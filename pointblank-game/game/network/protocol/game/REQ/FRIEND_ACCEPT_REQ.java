package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class FRIEND_ACCEPT_REQ extends game.network.protocol.GamePacketREQ
{
	protected int indexOf;
	public FRIEND_ACCEPT_REQ(int opcode)
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
		if (p != null)
		{
			PlayerFriend ft = p.amigos.get(indexOf);
			if (ft != null)
			{
				Player c = AccountSyncer.gI().get(ft.id);
				if (c == null)
				{
					c = new Player();
					c.id = ft.id;
					c.name = EssencialUtil.gI().BUSCAR_NICK(c.id);
					c.rank = EssencialUtil.gI().BUSCAR_RANK(c.id);
				}
				int state = newState(c, p.id); //0 - Amizade existente pelos 2 | 48 - Amizade cancelada
				ft.status = state;
				for (PlayerFriend tf : p.amigos)
				{
					if (tf.id == ft.id)
					{
						tf.status = state;
						break;
					}
				}
				if (state == 0)
					fd.ATUALIZAR_STATUS_AMIGO(ft.id, p.id, 0);
				fd.ATUALIZAR_STATUS_AMIGO(p.id, ft.id, 0);
				if (c.connection != null && state == 0)
				{
					for (PlayerFriend fp : c.amigos)
					{
						if (fp.id == p.id)
						{
							fp.status = 0;
							c.connection.sendPacket(new FRIEND_UPDATE_ACK(p, FriendState.ATUALIZAR, c.amigos.indexOf(fp), fp.status, 0));
							break;
						}
					}
				}
				sendPacket(new FRIEND_UPDATE2_ACK(FriendState.ACEITAR, indexOf));
				sendPacket(new FRIEND_UPDATE_ACK(c, FriendState.ATUALIZAR, indexOf, ft.status, 0));
			}
		}
	}
	public int newState(Player c, long id)
	{
		if ((c.connection != null) ? c.friendExist(id) : db.contaisFriend(c.id, id))
			return 0;
		else
			return 48;
	}
}