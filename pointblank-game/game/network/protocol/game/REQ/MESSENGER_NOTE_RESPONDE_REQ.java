package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class MESSENGER_NOTE_RESPONDE_REQ extends game.network.protocol.GamePacketREQ
{
	protected long pId;
	protected int object;
	protected String message;
	public MESSENGER_NOTE_RESPONDE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		object = ReadD();
		ReadD();
		message = ReadT(ReadC());
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		if (p != null)
		{
			for (PlayerMessage msg : p.mensagens)
			{
				if (msg.object == object)
				{
					pId = msg.owner_id;
					break;
				}
			}
			try
			{
				if (pId != 0 && message.length() > 0)
				{
					Player owner = EssencialUtil.gI().CARREGAR_JOGADOR_ID(pId, false, false, false, true);
					if (owner != null)
					{
						if (pId == p.id)
						{
							sendPacket(new MESSENGER_NOTE_SEND_ACK(0x8000107E));
							return;
						}
						else if (owner.mensagens.size() >= 100)
						{
							sendPacket(new MESSENGER_NOTE_SEND_ACK(MessageState.EVENT_ERROR_NOTE_SEND_BOX_FULL.value));
							return;
						}
						else
						{
							PlayerMessage m = new PlayerMessage(pId, p.id, 15, NoteType.NORMAL, NoteReceive.MAX, false);
							m.name = p.name;
							m.owner_name = owner.name;
							m.texto = message;
							db.CRIAR_MENSAGEM(m);
							if (m != null && owner.connection != null)
								owner.connection.sendPacket(new MESSENGER_NOTE_RECEIVE_ACK(m, owner));
							sendPacket(new MESSENGER_NOTE_SEND_ACK(MessageState.SUCESSO.value));
							m = null;
						}
					}
					else
					{
						sendPacket(new MESSENGER_NOTE_SEND_ACK(MessageState.EVENT_ERROR_NOTE_SEND_UKNOWN_NICK.value));
					}
				}
				else
				{
					sendPacket(new MESSENGER_NOTE_SEND_ACK(0x7FFFFFFF));
				}
			}
			catch (Exception e)
			{
				sendPacket(new MESSENGER_NOTE_SEND_ACK(0x7FFFFFFF));
			}
		}
	}
}