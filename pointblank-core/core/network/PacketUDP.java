package core.network;

import io.netty.buffer.*;

public abstract class PacketUDP
{
	public ByteBuf buf;
	public PacketUDP(ByteBuf buf)
	{
		this.buf = buf;
	}
	public final void excp(Exception e)
	{
		//Logger.gI().info("error", client.toString() + " " + this + " " + e.fillInStackTrace().toString() + " | " + e.getLocalizedMessage() + " | " + e.toString(), "-PacketREQ");
	}
	public final int restantes()
	{
		return buf.readableBytes();
	}
	public final int ReadD()
	{
		try
		{
			return buf.readInt();
		}
		catch (Exception e)
		{
			excp(e);
		}
		return 0;
	}
	public final byte ReadC()
	{
		try
		{
			return buf.readByte();
		}
		catch (Exception e)
		{
			excp(e);
		}
		return 0;
	}
	public final short ReadH()
	{
		try
		{
			return (short)(buf.readShort() & 65535);
		}
		catch (Exception e)
		{
			excp(e);
		}
		return 0;
	}
	public final long ReadQ()
	{
		try
		{
			return buf.readLong();
		}
		catch (Exception e)
		{
			excp(e);
		}
		return 0;
	}
	public String ReadS(int size)
	{
		return ReadString(size, "Windows-1251", "S");
	}
	public String ReadT(int size)
	{
		return ReadString(size, "Windows-1252", "T");
	}
	public String ReadString(int size, String charset, String log)
	{
		try
		{
			String txt = new String(ReadB(size), charset).trim();
			int length = txt.indexOf(Character.MIN_VALUE);
			if (length != -1)
				txt = txt.substring(0, length);
			return txt;
		}
		catch (Exception e)
		{
			excp(e);
		}
		return "";
	}
	public final byte[] ReadB(int length) 
	{
		byte[] result = new byte[length];
		try
		{
			buf.readBytes(result);
		}
		catch (Exception e)
		{
			excp(e);
		}
		return result;
	}
	public abstract Object readImpl();
}