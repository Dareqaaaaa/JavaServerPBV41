package game.network.protocol.game.REQ;

import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class LOBBY_ENTER_REQ extends game.network.protocol.GamePacketREQ
{
	public LOBBY_ENTER_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		Room r = client.getRoom();
		Channel c = client.getChannel();
		if (p != null && c != null)
		{
			if (r != null)
				r.REMOVER_JOGADOR(p, true, true);
			p.room_id = -1;
			c.ADICIONAR_JOGADOR(p);
			if (p.status() > 0 && p.last_fstate != 80)
				EssencialUtil.gI().ATUALIZAR_AMIGOS(p, 80, false);
		}
		sendPacket(new LOBBY_ENTER_ACK(0));
	}
}