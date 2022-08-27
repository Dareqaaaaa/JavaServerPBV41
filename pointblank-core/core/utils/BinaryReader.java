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

package core.utils;

import java.io.*;
import java.nio.*;

public class BinaryReader extends FilterInputStream
{
	protected long lenght;
	protected long position;
    public BinaryReader(InputStream in) throws IOException
    {
        super(in);
        lenght = in.available();
    }
    public long getLength() throws IOException
    {
    	return lenght - position;
    }
    public byte ReadC() throws IOException
    {
    	position++;
        return ByteBuffer.wrap(ReadB(1)).order(ByteOrder.LITTLE_ENDIAN).get();
    }
    public short ReadH() throws IOException
    {
    	position += 2;
        return ByteBuffer.wrap(ReadB(2)).order(ByteOrder.LITTLE_ENDIAN).getShort();
    }
    public int ReadD() throws IOException
    {
    	position += 4;
        return ByteBuffer.wrap(ReadB(4)).order(ByteOrder.LITTLE_ENDIAN).getInt();
    }
    public float ReadF() throws IOException
    {
    	position += 4;
        return ByteBuffer.wrap(ReadB(4)).order(ByteOrder.LITTLE_ENDIAN).getFloat();
    }
    public byte[] ReadB(int length) throws IOException
    {
        position += length;
        byte[] bytes = new byte[length];
        read(bytes);
        return bytes;
    }
    public String ReadS(int lenght) throws IOException
    {
        byte[] val = new byte[lenght];
        ByteBuffer.wrap(ReadB(lenght)).order(ByteOrder.LITTLE_ENDIAN).get(val);
        return new String(val, "UTF-8");
    }
}