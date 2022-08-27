package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class VOTEKICK_UPDATE_REQ extends game.network.protocol.GamePacketREQ
{
	protected Room r;
	protected int voto;
	protected int jogador_kikado;
	protected int jogador_abriu;
	protected int slot;
	protected boolean kikar_jogador, terminar = false;
	public VOTEKICK_UPDATE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		r = client.getRoom();
		voto = ReadC();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		if (p != null && r != null)
		{
			if (r.threadVOTE != null && r.votekick != null)
			{
				synchronized (r.votekick)
				{
					jogador_kikado = r.votekick.jogador_kikado;
					jogador_abriu = r.votekick.jogador_abriu;
					slot = p.slot;
					if (slot == jogador_abriu || slot == jogador_kikado || r.votou.containsKey(p.id) || r.getSlotState(p).ordinal() != 13)
						return;
					if (voto == 0)
						r.votekick.kikar++;
					else
						r.votekick.deixar++;
					r.votou.put(p.id, voto);
	                int jogadores_vermelho = r.getPlayingPlayers(0, true, -1);
	                int jogadores_azul = r.getPlayingPlayers(1, true, -1);
	                if (jogador_kikado % 2 == 0)
	                	jogadores_vermelho--;
	                else
	                	jogadores_azul--;
	                kikar_jogador = false;
					int kikar = r.votekick.kikar;
					int deixar = r.votekick.deixar;
					int contarMeuTime = jogador_kikado % 2 == 0 ? jogadores_vermelho : jogadores_azul;
					if (kikar > contarMeuTime || kikar >= (jogadores_vermelho + jogadores_azul))
					{
						kikar_jogador = r.KIKAR_JOGADOR(r.votekick.jogador_kikado);
						terminar = true;
					}
					else if (deixar > contarMeuTime || deixar >= (jogadores_vermelho + jogadores_azul))
					{
						terminar = true;
					}
					for (int i = 0; i < 16; i++)
					{
						Player m = r.getPlayerBySlot(i);
						if (m != null)
							m.connection.sendPacket(new VOTEKICK_UPDATE_ACK(kikar, deixar));
			        }
					if (terminar)
					{
						for (int i = 0; i < 16; i++)
						{
							Player mM = r.getPlayerBySlot(i);
							if (mM != null && i != jogador_kikado)
								mM.connection.sendPacket(new VOTEKICK_RESULT_ACK(jogador_kikado, kikar, deixar, kikar_jogador, false));
				        }
						r.stopTask(ThreadState.VOTEKICK);
						r.threadVOTE = null;
						r.votekick = null;
					}
				}
			}
		}
	}
}