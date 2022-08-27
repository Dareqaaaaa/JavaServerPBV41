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
import io.netty.buffer.*;

public abstract class PacketHAR
{
	protected final String TYPE_PATTERN = "[%s] 0x%02X %s";
	public PacketType packetType;
	public ByteBuf buf;
	public int opcode;
	public boolean runner = true;
	protected PacketHAR(PacketType packetType)
	{
		this.packetType = packetType;
	}
	protected PacketHAR(PacketType packetType, ByteBuf buf)
	{
		this(packetType);
		this.buf = buf;
	}
	public String getName()
	{
		return getClass().getSimpleName();
	}
	public void finalize()
	{
		try
		{
			super.finalize();
		}
		catch (Throwable e)
		{
		}
	}
	@Override
	public String toString()
	{
		return String.format(TYPE_PATTERN, packetType.name, opcode, getName());
	}
}