package game.network.protocol.game.REQ;

import game.network.protocol.game.ACK.*;

import java.util.*;

import core.models.*;

public class MESSENGER_NOTE_DELETE_REQ extends game.network.protocol.GamePacketREQ
{
	protected List<Integer> mensagens = new ArrayList<Integer>();
	protected int sucess;
	protected int size;
	public MESSENGER_NOTE_DELETE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{	
		try
		{
			Player p = client.getPlayer();
			if (p != null)
			{
				size = ReadC();
				for (int i = 0; i < size; i++)
				{
					int objIdx = ReadD();
					try
					{
						if (p.removeMessage(objIdx))
							mensagens.add(objIdx);
					}
					catch (Exception e)
					{
						continue;
					}
				}
			}
		}
		catch (Exception e)
		{
			sucess = 0x80000000;
		}
	}
	@Override
	public void runImpl()
	{
		sendPacket(new MESSENGER_NOTE_DELETE_ACK(mensagens, sucess));
	}
}