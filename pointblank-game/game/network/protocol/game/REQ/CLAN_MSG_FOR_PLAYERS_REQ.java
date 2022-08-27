package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class CLAN_MSG_FOR_PLAYERS_REQ extends game.network.protocol.GamePacketREQ
{
	protected MessageState error = MessageState.SUCESSO;
	protected int size;
	protected int type;
	protected String message;
	public CLAN_MSG_FOR_PLAYERS_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		type = ReadC();
		message = ReadT(ReadC());
	}
	@Override
	public void runImpl()
	{
		try
		{
			Player p = client.getPlayer();
			if (p != null)
			{
				Clan c = ck.getClanId(p.clan_id);
				if (c != null)
				{
					if ((size = c.membros.size()) > 1)
					{
						PlayerMessage msg = new PlayerMessage(p.id, c.id, 15, NoteType.NORMAL_ASK, NoteReceive.MAX, false);
						msg.name = c.name;
						msg.owner_name = p.name;
						msg.texto = message;
						for (Player m : ck.getPlayers(c))
						{
							if (msg != null && (m != null && type == 0 && m.role != ClanRole.CLAN_MEMBER_LEVEL_UNKNOWN || type == 1 && m.role == ClanRole.CLAN_MEMBER_LEVEL_STAFF || type == 2 && m.role == ClanRole.CLAN_MEMBER_LEVEL_REGULAR))
							{
								msg.player_id = m.id;
								db.CRIAR_MENSAGEM(msg);
								if (msg != null && m.connection != null)
									m.connection.sendPacket(new MESSENGER_NOTE_RECEIVE_ACK(msg, AccountSyncer.gI().get(m.id)));
							}
						}
						sendPacket(new MESSENGER_NOTE_SEND_ACK(0));
						msg = null;
					}
				}
				else
				{
					error = MessageState.EVENT_ERROR_CLAN_NOSEARCH_CLANIDX;
				}
			}
			else
			{
				error = MessageState.ERRO;
			}
		}
		catch (Exception e)
		{
			error = MessageState.ERRO;
		}
		sendPacket(new CLAN_MSG_FOR_PLAYERS_ACK(error.value)); //1
	}
}