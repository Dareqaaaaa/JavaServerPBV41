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

import io.netty.buffer.*;

import java.io.*;
import java.nio.*;

import core.enums.*;
import core.log.*;

public abstract class PacketACK extends PacketHAR
{
	protected PacketACK(int ok)
	{
		super(PacketType.SERVER, Unpooled.buffer(4).order(ByteOrder.LITTLE_ENDIAN));
	}
	public final void msgError(String txt)
	{
		Logger.gI().info("error", null, txt, getClass());
	}
	public final void excp(Exception e)
	{
		Logger.gI().info("error", e, "", getClass());
	}
	protected final void WriteB(byte[] array)
	{
		try
		{
			buf.writeBytes(array, 0, array.length);
		}
		catch (Exception e)
		{
			excp(e);
		}
	}
	protected final void WriteD(int value)
	{
		try
		{
			buf.writeInt(value);
		}
		catch (Exception e)
		{
			excp(e);
		}
	}
	protected final void WriteH(int value)
	{
		try
		{
			buf.writeShort(value);
		}
		catch (Exception e)
		{
			excp(e);
		}
	}
	protected final void WriteC(int value)
	{
		try
		{
			buf.writeByte(value);
		}
		catch (Exception e)
		{
			excp(e);
		}
	}
	protected final void WriteQ(long value)
	{
		try
		{
			buf.writeLong(value);
		}
		catch (Exception e)
		{
			excp(e);
		}
	}
	protected final void WriteF(float value)
	{
		try
		{
			buf.writeFloat(value);
		}
		catch (Exception e)
		{
			excp(e);
		}
	}
	protected final void WriteE(int value)
	{
		try
		{
			buf.writeChar(value);
		}
		catch (Exception e)
		{
			excp(e);
		}
	}
	protected final void WriteS(String text, int length)
	{
		WriteString(text, length, "Windows-1251");
	}
	protected final void WriteT(String text, int length)
	{
		WriteString(text, length, "Windows-1252");
	}
	protected final void WriteString(String text, int length, String charset)
	{
		if (text == null)
			text = "";
		try
		{
			WriteB(text.getBytes(charset));
		}
		catch (UnsupportedEncodingException e)
		{
		}
		WriteB(new byte[length - text.length()]);
	}
	protected final void WriteTXT(byte[] array)
	{
		try
		{
			byte[] result = new byte[array.length * 2];
			for (int i = 0; i < array.length; i++)
				result[i * 2] = array[i];
			WriteB(result);
			WriteH(0);
		}
		catch (Exception e)
		{
			excp(e);
		}
	}
}