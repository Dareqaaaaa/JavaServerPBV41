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

package battle.network.udp;

import io.netty.buffer.*;

import java.io.*;
import java.nio.*;

public class BattleUdpBuffer
{
	ByteArrayInputStream bais;
    ByteArrayOutputStream baos;
    ByteBuf buffer;
    public BattleUdpBuffer()
    {
        buffer = Unpooled.buffer().order(ByteOrder.LITTLE_ENDIAN);
    }
    public byte[] toArray()
    {
        return baos.toByteArray();
    }
    public void close() throws Throwable
    {
    	if (baos != null)
    	{
    		baos.flush();
			baos.close();
    	}
    	if (buffer != null && buffer.refCnt() != 0)
    		buffer.release();
    	super.finalize();
    }
    public ByteBuf getBuffer()
    {
    	return Unpooled.copiedBuffer(toArray(), 0, toArray().length);
    }
}