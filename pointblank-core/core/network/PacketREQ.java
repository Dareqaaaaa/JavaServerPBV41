/*
 * PointBlank Java Server
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Henrique Rodrigues
 * Copyright (C) 2015-2017
 */

package core.network;

import core.enums.*;
import core.log.*;

@SuppressWarnings("rawtypes")
public abstract class PacketREQ<P extends PacketREQ, T extends Connection> extends PacketHAR implements Cloneable, Runnable
{
	public T client;
	protected PacketREQ(int opcode)
	{
		super(PacketType.CLIENT);
		this.opcode = opcode;
	}
	public final boolean read()
	{
		try
		{
			readImpl();
			return true;
		}
		catch (Exception e)
		{
			excp(e);
			return false;
		}
		finally
		{
			//if (buf.refCnt() != 0)
			//	buf.release();
			if (buf != null)
			{
				buf.clear();
				buf = null;
			}
		}
	}
	public final void excp(Exception e)
	{
		Logger.gI().info("error", e, "", getClass());
	}
	protected final int ReadD()
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
	protected final int ReadC()
	{
		try
		{
			return buf.readByte() & 255;
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
			return (short)(buf.readShort() & 65535);
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
			return buf.readUnsignedShort();
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
			return buf.readLong();
		}
		catch (Exception e)
		{
			excp(e);
		}
		return 0;
	}
	protected String ReadS(int size)
	{
		return ReadString(size, "Windows-1251", "S");
	}
	protected String ReadT(int size)
	{
		return ReadString(size, "Windows-1252", "T");
	}
	protected String ReadString(int size, String charset, String log)
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
			//excp(e);
		}
		return "";
	}
	protected final byte[] ReadB(int length) 
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
	protected abstract void readImpl();
	protected abstract void runImpl();
	protected abstract P clonePacket();
}