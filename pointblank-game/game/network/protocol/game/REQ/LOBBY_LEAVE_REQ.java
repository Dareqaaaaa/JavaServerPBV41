package game.network.protocol.game.REQ;

import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class LOBBY_LEAVE_REQ extends game.network.protocol.GamePacketREQ
{
	public LOBBY_LEAVE_REQ(int opcode)
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
		Channel c = client.getChannel();
		Room r = client.getRoom();
		if (p != null && c != null)
		{
			if (r != null)
				r.REMOVER_JOGADOR(p, true, true);
			c.REMOVER_JOGADOR(p.id);
			p.room_id = -1;
			p.channel_id = -1;
			if (p.status() > 0 && p.last_fstate != 64)
				EssencialUtil.gI().ATUALIZAR_AMIGOS(p, 64, false);
		}
		sendPacket(new LOBBY_LEAVE_ACK());
	}
}