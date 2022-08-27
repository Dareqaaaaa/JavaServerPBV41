package game.network.protocol.game.ACK;

import java.util.*;

public class MESSENGER_NOTE_DELETE_ACK extends game.network.protocol.GamePacketACK
{
	protected List<Integer> mensagens;
	protected int sucess;
	public MESSENGER_NOTE_DELETE_ACK(List<Integer> mensagens, int sucess)
	{
		super(true);
		this.mensagens = mensagens;
		this.sucess = sucess;
	}
	@Override
	public void writeImpl()
	{
		WriteD(sucess);
		if (sucess == 0)
		{
			WriteC(mensagens.size());
			for (int objIdx : mensagens)
				WriteD(objIdx);
		}
		mensagens.clear();
	}
}