package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class CLAN_MESSAGE_INVITE_REQ extends game.network.protocol.GamePacketREQ
{
	protected Player f;
	public CLAN_MESSAGE_INVITE_REQ(int opcode)
	{
		super(opcode);	
	}
	@Override
	public void readImpl()
	{
		int type = ReadC();
		if (type == 0)
		{
			f = EssencialUtil.gI().CARREGAR_JOGADOR_ID(ReadQ(), false, false, false, false);
		}
		else if (type == 1)
		{
			Room r = client.getRoom();
			if (r != null)
				f = r.getPlayerBySlot(ReadD());
		}
		else if (type == 2)
		{
			Channel c = client.getChannel();
			if (c != null)
				f = c.BUSCAR_JOGADOR_LOBBY(ReadD());
		}
	}
	@Override
	public void runImpl() 
	{
		try
		{
			Player p = client.getPlayer();
			if (p != null && f != null)
			{
				Clan c = ck.getClanId(p.clan_id);
				if (c != null && f.clan_id == 0)
				{
					for (PlayerMessage msg : p.mensagens)
					{
						if (msg.type == NoteType.CLAN && msg.readed == ReadType.NAO_VISUALIZADO && msg.owner_id == c.id)
						{
							return;
						}
					}
					int object = db.returnQueryValueI("SELECT object FROM jogador_mensagem WHERE type='5' AND readed='1' AND owner_id='" + c.id + "' AND player_id='" + f.id + "'", "object");
					if (object == 0)
					{
						PlayerMessage msg = new PlayerMessage(f.id, c.id, 15, NoteType.CLAN, NoteReceive.CONVITE, false);
						msg.name = c.name;
						msg.owner_name = p.name;
						msg.texto = "";
						db.CRIAR_MENSAGEM(msg);
						if (msg != null && f.connection != null)
							f.connection.sendPacket(new MESSENGER_NOTE_RECEIVE_ACK(msg, f));
						sendPacket(new CLAN_INVITE_ACK(0));
						msg = null;
					}
				}
				else
				{
					sendPacket(new CLAN_INVITE_ACK(0x8000105B));
				}
			}
			else
			{
				sendPacket(new CLAN_INVITE_ACK(0x80003002));
			}
		}
		catch (Exception e)
		{
			sendPacket(new CLAN_INVITE_ACK(0x80003002));
		}
	}
}