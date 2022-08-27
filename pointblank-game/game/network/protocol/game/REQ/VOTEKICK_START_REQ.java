package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import core.system.*;
import game.network.protocol.game.ACK.*;
import game.thread.*;

public class VOTEKICK_START_REQ extends game.network.protocol.GamePacketREQ
{
	protected int motivo;
	protected int slot;
	protected int jogadores_vermelho;
	protected int jogadores_azul;   
	protected int error;
	protected int owner_slot;
	public VOTEKICK_START_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		slot = ReadC();
        motivo = ReadC();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		Room r = client.getRoom();
		if (p != null && r != null)
		{
			owner_slot = p.slot;
			if (r.threadVOTE == null && r.votekick == null)
			{
				Player owner = r.getPlayerBySlot(slot);
				for (int i = 0; i < 16; i++)
				{
		            if (r.getSlotState(i) == SlotState.BATTLE)
		            {
		            	if (i % 2 == 0)
		            		jogadores_vermelho++;
		            	else
		            		jogadores_azul++;
		            }
				}
				if (jogadores_vermelho < 2 && jogadores_azul < 2)
					error = 0x800010E2; //A votação não pode ser iniciada com 2 jogadores
				else if (p.rank < ConfigurationLoader.gI().votekick_requirits_rank)
					error = 0x800010E4; //Você não tem patente para abrir votação
				else
				{
					if (owner != null)
					{
						if (r.getSlotState(owner_slot).ordinal() != 13 || r.getSlotState(slot).ordinal() != 13 || owner.rank == 53 || owner.rank == 54 || owner.access_level.ordinal() > 0)
							error = 0x800010E3;
					}
					else
					{
						error = 0x800010E3;
					}
				}
			}
			else
			{
				error = 0x800010E3;
			}
			sendPacket(new BATTLE_SUGGEST_KICKVOTE_ACK(error));
			if (error == 0)
			{
				VoteKick vote = new VoteKick();
				vote.kikar = 0;
				vote.deixar = 0;
				vote.motivo = motivo;
				vote.jogador_kikado = slot;
				vote.jogador_abriu = owner_slot;
				r.votekick = vote;
				r.stopTask(ThreadState.VOTEKICK);
				for (int i = 0; i < 16; i++)
				{
					Player mM = r.getPlayerBySlot(i);
					if (mM != null && i != slot && i != owner_slot)
						mM.connection.sendPacket(new VOTEKICK_START_ACK(vote.jogador_abriu, slot, motivo));
				}
				r.votekickStart(new VoteKickTH());
			}
		}
	}
}