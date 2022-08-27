package core.utils;

import core.log.Logger;
import io.netty.buffer.*;

public abstract class ByteReader
{
	protected ByteBuf r;
	public ByteReader(ByteBuf r)
	{
		this.r = r;
	}
	protected final byte ReadC()
	{
		try
		{
			return r.readByte();
		}
		catch (Exception e)
		{
			excp(e);
		}
		return 0;
	}
	protected final int ReadD()
	{
		try
		{
			return r.readInt();
		}
		catch (Exception e)
		{
			excp(e);
		}
		return 0;
	}
	protected final short ReadH()
	{
		try
		{
			return r.readShort();
		}
		catch (Exception e)
		{
			excp(e);
		}
		return 0;
	}
	protected final int ReadU()
	{
		try
		{
			return r.readUnsignedShort();
		}
		catch (Exception e)
		{
			excp(e);
		}
		return 0;
	}
	protected final long ReadQ()
	{
		try
		{
			return r.readLong();
		}
		catch (Exception e)
		{
			excp(e);
		}
		return 0;
	}
	protected final byte[] ReadB(int length) 
	{
		byte[] result = new byte[length];
		try
		{
			r.readBytes(result);
		}
		catch (Exception e)
		{
			excp(e);
		}
		return result;
	}
	public final void excp(Exception e)
	{
		Logger.gI().info("error", e, "", getClass());
	}
	public void close() throws Throwable
	{
		if (r.refCnt() != 0) r.release();
		super.finalize();
	}
}