package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class MESSENGER_NOTE_SEND_REQ extends game.network.protocol.GamePacketREQ
{
	protected int lowner;
	protected int lmessage;
	protected String owner;
	protected String message;
	public MESSENGER_NOTE_SEND_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		lowner = ReadC();
		lmessage = ReadC();
		owner = ReadS(lowner).replace(" ", "").trim();
		message = ReadT(lmessage);
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		if (p != null)
		{
			Player to = EssencialUtil.gI().CARREGAR_JOGADOR_NOME(owner, false, false, false, true);
			if (to != null && owner.length() > 0 && owner != "" && owner != " " && !owner.isEmpty() && message.length() > 0)
			{
				if (to.mensagens.size() >= 100)
				{
					sendPacket(new MESSENGER_NOTE_SEND_ACK(MessageState.EVENT_ERROR_NOTE_SEND_BOX_FULL.value));
				}
				else if (owner.equals(p.name))
				{
					sendPacket(new MESSENGER_NOTE_SEND_ACK(MessageState.EVENT_ERROR_NOTE_SEND_SELF.value));
				}
				else
				{
					try
					{
						PlayerMessage m = new PlayerMessage(to.id, p.id, 15, NoteType.NORMAL, NoteReceive.MAX, false);
						m.name = p.name;
						m.owner_name = to.name;
						m.texto = message;
						db.CRIAR_MENSAGEM(m);
						if (m != null && to.connection != null)
							to.connection.sendPacket(new MESSENGER_NOTE_RECEIVE_ACK(m, to));
						sendPacket(new MESSENGER_NOTE_SEND_ACK(MessageState.SUCESSO.value));
						m = null;
					}
					catch (Exception e)
					{
						sendPacket(new MESSENGER_NOTE_SEND_ACK(0x7FFFFFFF));
					}
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
}