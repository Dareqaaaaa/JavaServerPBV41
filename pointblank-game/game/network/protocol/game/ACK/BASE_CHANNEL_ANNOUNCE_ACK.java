package game.network.protocol.game.ACK;

import game.network.protocol.*;

import java.io.UnsupportedEncodingException;

import core.models.*;

public class BASE_CHANNEL_ANNOUNCE_ACK extends GamePacketACK
{
	protected Channel c;
	protected int error;
	public BASE_CHANNEL_ANNOUNCE_ACK(Channel c, int error)
	{
		super(true);
		this.c = c;
		this.error = error;
	}
	@Override
	public void writeImpl()
	{
		if (error == 0 && c != null)
		{
			WriteD(c.id);
			WriteH(c.anuncio.length());
			try
			{
				WriteTXT(c.anuncio.getBytes("Windows-1251"));
			}
			catch (UnsupportedEncodingException e)
			{
			}
		}
		else
		{
			WriteD(error);
		}
	}
}