package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class FRIEND_REMOVE_REQ extends game.network.protocol.GamePacketREQ
{
	protected int indexOf;
	protected int error = 0x80000000;
	public FRIEND_REMOVE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		indexOf = ReadC();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		try
		{
			if (p != null)
			{
				PlayerFriend f = p.amigos.get(indexOf);
				if (f != null)
				{
					fd.DELETAR_AMIGO(p.id, f.id);
					if (f.status == 0)
					{
						fd.ATUALIZAR_STATUS_AMIGO(f.id, p.id, 48);
						Player a = AccountSyncer.gI().get(f.id);
						if (a != null && a.connection != null)
						{
							for (PlayerFriend ft : a.amigos)
							{
								if (ft.id == p.id)
								{
									ft.status = 48;
									a.connection.sendPacket(new FRIEND_UPDATE_ACK(p, FriendState.ATUALIZAR, a.amigos.indexOf(ft), ft.status, ft.status));
									break;
								}
							}
						}
					}
					p.amigos.remove(indexOf);
					error = 0;
				}
			}
		}
		catch (Exception e)
		{
			error = 0x80000000;
		}
		if (error == 0)
		{
			sendPacket(new FRIEND_UPDATE2_ACK(FriendState.REMOVER, indexOf));
			sendPacket(new FRIEND_REMOVE_ACK(0));
			sendPacket(new FRIEND_INFO_ACK(p));
		}
		else
		{
			sendPacket(new FRIEND_REMOVE_ACK(error));
		}
	}
}