package game.network.protocol.game.REQ;

import core.enums.*;
import core.manager.*;
import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class CLAN_PLAYER_LEAVE_REQ extends game.network.protocol.GamePacketREQ
{
	public CLAN_PLAYER_LEAVE_REQ(int opcode)
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
		if (p != null)
		{
			try
			{
				Clan c = ck.getClanId(p.clan_id);
				if (c != null)
				{
					for (Player f : c.membros)
					{
						if (f.id == p.id)
						{
							c.membros.remove(f);
							break;
						}
					}
                    for (Player f : ck.getPlayers(c))
                    {
                    	if (f != null && f.connection != null)
			        	{
			        		if (f.id != p.id)
			        			f.connection.sendPacket(new CLAN_MEMBER_INFO_DELETE_ACK(p.id));
							f.connection.sendPacket(new CLAN_CREATE_ACK(c, 0, f.gold));
			        	}
                    }
					sendMessage(c, p);
				}
				if (p.clan_invited > 0)
					db.executeQuery("UPDATE jogador SET clan_invited='0' WHERE id='" + p.id + "'");
		        p.clan_invited = 0;
				p.clanDate = 0;
				p.clan_id = 0;
				p.role = ClanRole.CLAN_MEMBER_LEVEL_UNKNOWN;
				db.updateRole(p.id, p.role.ordinal());
				db.updateClanDate(p);
				db.updateClanID(p);
				ClanInviteManager.gI().deleteInvite(p);
				EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(p, true, false, false);
				sendPacket(new CLAN_PLAYER_LEAVE_ACK(0));
			}
			catch (Exception e)
			{
				sendPacket(new CLAN_PLAYER_LEAVE_ACK(0x8000106B));
			}
		}
		else
		{
			sendPacket(new CLAN_PLAYER_LEAVE_ACK(0x8000106B));
		}
	}
	public void sendMessage(Clan c, Player p) throws Exception
	{
		if (c != null && p != null)
		{
			PlayerMessage msg = new PlayerMessage(p.id, c.id, 15, NoteType.WEB, NoteReceive.ABANDONOU_CLAN, false);
			msg.name = c.name;
			msg.owner_name = p.name;
			msg.texto = "";
			for (Player m : ck.getPlayers(c))
			{
				if (msg != null && (m != null && m.role == ClanRole.CLAN_MEMBER_LEVEL_MASTER || m.role == ClanRole.CLAN_MEMBER_LEVEL_STAFF))
				{
					msg.player_id = m.id;
					db.CRIAR_MENSAGEM(msg);
					if (msg != null && m.connection != null)
						m.connection.sendPacket(new MESSENGER_NOTE_RECEIVE_ACK(msg, AccountSyncer.gI().get(m.id)));
				}
			}
			msg = null;
		}
	}
}