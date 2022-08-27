package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class LOBBY_GET_ROOMLIST_REQ extends game.network.protocol.GamePacketREQ
{
	protected boolean run = true;
	public LOBBY_GET_ROOMLIST_REQ(int opcode)
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
		if (p != null && c != null)
		{
			run = p.room_id == -1;
			if (run)
			{
				c.REMOVER_SALAS_VAZIAS();
				if (!p.shopList)
				{
					try
					{
						client.close(new BASE_KICK_ACCOUNT_ACK(p.connection, KickType.O_JOGO_SERA_FINALIZADO_POR_SOLICITAÇÃO_DO_SERVIDOR));
					}
					catch (Exception e)
					{
					}
				}
			}
		}
		if (run)
			sendPacket(new LOBBY_GET_ROOMLIST_ACK(c));
	}
}