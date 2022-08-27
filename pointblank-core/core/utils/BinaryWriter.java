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

public class BinaryWriter extends FileOutputStream
{
    public BinaryWriter(String name) throws FileNotFoundException
    {
        super(name);
    }
    public void WriteB(byte[] bytes) throws IOException
    {
        write(ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN).array());
    }
    public void WriteC(byte bytes) throws IOException
    {
        write(ByteBuffer.allocate(1).put(bytes).order(ByteOrder.LITTLE_ENDIAN).array());
    }
    public void WriteD(int val) throws IOException
    {
        write(ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putInt(val).array());
    }
    public void WriteH(short val) throws IOException
    {
        write(ByteBuffer.allocate(2).order(ByteOrder.LITTLE_ENDIAN).putShort(val).array());
    }
    public void WriteF(float val) throws IOException
    {
        write(ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putFloat(val).array());
    }
    public void WriteS(String value) throws IOException
    {
        write(ByteBuffer.allocate(value.length()).order(ByteOrder.LITTLE_ENDIAN).put(value.getBytes("Windows-1251")).array());
    }
}