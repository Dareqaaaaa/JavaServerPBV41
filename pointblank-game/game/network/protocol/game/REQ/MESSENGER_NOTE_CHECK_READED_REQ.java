package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class MESSENGER_NOTE_CHECK_READED_REQ extends game.network.protocol.GamePacketREQ
{
	protected int object;
	protected int view;
	public MESSENGER_NOTE_CHECK_READED_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		view = ReadC(); //1
		object = ReadD();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		if (p != null)
		{
			for (PlayerMessage msg : p.mensagens)
			{
				if (msg.object == object && msg.dias == 15)
				{
					if (!msg.special)
					{
						msg.expirate = date.getDateTimeK(msg.dias = 7);
						if (msg.type != NoteType.CLAN)
						{
							msg.readed = ReadType.VISUALIZADO;
							sendPacket(new MESSENGER_NOTE_CHECK_READED_ACK(object, view));
						}
						db.executeQuery("UPDATE jogador_mensagem SET readed='" + msg.readed.ordinal() + "', dias='7', expirate='" + msg.expirate + "' WHERE object='" + object + "'");
					}
					break;
				}
			}
		}
	}
}