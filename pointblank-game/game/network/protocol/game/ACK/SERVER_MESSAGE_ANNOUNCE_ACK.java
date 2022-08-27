package game.network.protocol.game.ACK;

import java.io.*;

public class SERVER_MESSAGE_ANNOUNCE_ACK extends game.network.protocol.GamePacketACK
{
	protected String msg;
	public SERVER_MESSAGE_ANNOUNCE_ACK(String msg)
	{
		super(true);
		this.msg = msg;
	}
	@Override
	public void writeImpl()
	{
		WriteD(2);
		WriteH(msg.length()); //1024
		try
		{
			WriteTXT(msg.getBytes("Windows-1251"));
		}
		catch (UnsupportedEncodingException e)
		{
		}
	}
}