package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import core.utils.*;
import game.network.protocol.*;
import game.network.protocol.game.ACK.*;

public class FRIEND_INVITE_REQ extends GamePacketREQ
{
	protected Player c;
	protected FriendState acType = FriendState.INSERIR;
	public FRIEND_INVITE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		c = EssencialUtil.gI().CARREGAR_JOGADOR_NOME(ReadS(33).replace(" ", "").trim(), false, false, false, false);
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		if (p != null && c != null && c.status() == 1 && c.name != "" && c.name != " " && !c.name.isEmpty())
		{
			if (p.amigos.size() >= 50)
				sendPacket(new FRIEND_INVITE_ACK(FriendState.EVENT_ERROR_EVENT_FRIEND_INSERT_FULL.value));
			else if (p.friendExist(c.id))
				sendPacket(new FRIEND_INVITE_ACK(FriendState.EVENT_ERROR_EVENT_FRIEND_INSERT_ALREADY_FRIEND.value));
			else
			{
				if (db.COUNT_QUERY("SELECT friend_id FROM jogador_amigo WHERE player_id='" + c.id + "'") >= 50)
					sendPacket(new FRIEND_INVITE_ACK(FriendState.EVENT_ERROR_EVENT_FRIEND_INSERT_FULL.value));
				else
				{
					if (insert(p))
					{
						for (PlayerFriend f : p.amigos)
						{
							if (f.id == c.id)
							{
								sendPacket(new FRIEND_UPDATE_ACK(c, FriendState.INSERIR, p.amigos.indexOf(f), f.status, 0));
								break;
							}
						}
						if (c.connection == null)
							return;
						for (PlayerFriend f : c.amigos)
						{
							if (f.id == p.id)
							{
								c.connection.sendPacket(new FRIEND_UPDATE_ACK(p, acType, c.amigos.indexOf(f), f.status, 0));
								break;
							}
						}
					}
				}
			}
		}
		else
		{
			sendPacket(new FRIEND_INVITE_ACK(FriendState.EVENT_ERROR_EVENT_FRIEND_INSERT_NOT_FIND_NICK.value));
		}
	}
	protected boolean insert(Player p)
	{
		try
		{
			if (c.connection != null ? !c.friendExist(p.id) : !db.contaisFriend(c.id, p.id))
			{
				c.amigos.add(new PlayerFriend(p.id, CommState.CONVITE2.value));
				p.amigos.add(new PlayerFriend(c.id, CommState.CONVITE1.value));
				fd.ADICIONAR_AMIGO(c.id, p.id, CommState.CONVITE2.value);
				fd.ADICIONAR_AMIGO(p.id, c.id, CommState.CONVITE1.value);
			}
			else
			{
				p.amigos.add(new PlayerFriend(c.id, CommState.CONVITE1.value));
				fd.ADICIONAR_AMIGO(p.id, c.id, CommState.CONVITE1.value);
				fd.ATUALIZAR_STATUS_AMIGO(c.id, p.id, CommState.CONVITE2.value);
				for (PlayerFriend f : c.amigos)
				{
					if (f.id == p.id)
					{
						f.status = CommState.CONVITE2.value;
						break;
					}
				}
				acType = FriendState.ATUALIZAR;
			}
			return true;
		}
		catch (Exception e)
		{
			sendPacket(new FRIEND_INVITE_ACK(FriendState.EVENT_ERROR_INVITE.value));
			return false;
		}
	}
}