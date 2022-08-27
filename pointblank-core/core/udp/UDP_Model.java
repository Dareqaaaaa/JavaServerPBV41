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

package core.udp;

import java.io.*;
import java.nio.*;

import core.utils.*;
import io.netty.buffer.*;

public class UDP_Model
{
	public byte opcode;
	public byte slot;
	public float time;
	public byte session;
	public short length;
	public int event;

	public int sub_length;
	public byte[] allBytes;
	public byte[] bytes3;
	public ByteBuf read;

	public final int hours = DateTimeUtil.gI().getHourNow(0);

	public UDP_Model(ByteBuf receive) throws Exception
	{
		ByteBuf buffer = Unpooled.copiedBuffer(receive).order(ByteOrder.LITTLE_ENDIAN);
		allBytes = new byte[receive.readableBytes()];
		buffer.readBytes(allBytes);
		if (buffer.refCnt() != 0)
			buffer.release();

		//inicio
		opcode = receive.readByte();
		slot = receive.readByte();
		time = receive.readFloat();
		session = receive.readByte();
		length = receive.readShort();
		event = receive.readInt();
		bytes3 = new byte[length - 13];
        receive.readBytes(bytes3);
		read = Unpooled.copiedBuffer(bytes3).order(ByteOrder.LITTLE_ENDIAN);
		BitShift.onlyDecrypt(read, length);
	}
	public void writeFlags(ByteBuf send)
	{
		/*if (true)
		{
			UdpEvent flag = UdpEvent.None;
			//send.writeInt(sub_event);
			System.out.println(flag.toString());
			switch (flag)
			{
				case RadioChat:
				{
					byte chatValue = read.readByte();
					short mapLocal = read.readShort();
					short value1 = read.readShort();
					byte value2 = read.readByte();
					byte team = read.readByte();
					int value3 = read.readInt();
					send.writeByte(chatValue); //id
					send.writeShort(mapLocal); //area
					send.writeShort(value1); //20 10
					send.writeByte(value2); //00
					send.writeByte(team); //00
					send.writeInt(value3); //01 00 00 00
					System.out.println(" slot: " + slot + " release: " + sub_slot + " sended radio chat > id: " + chatValue + " > area: " + mapLocal + " > team: " + team);
					break;
				}
				case HpSync:
				{
					short life = read.readShort();
					send.writeShort(150); //hp
					System.out.println(" slot: " + slot + " slot writable: " + sub_slot + " sended " + life + " hp");			
					break;
				}
				case FireDataOnObject:
				{
					short shotId = read.readShort();
					short shotIndex = read.readShort();
					short shotCamX = read.readShort();
					short shotCamY = read.readShort();
					short shotCamZ = read.readShort();
		            byte weaponType = read.readByte();
		            int weaponId = read.readInt();
		            byte hittimes = read.readByte();
		            int maskdata = read.readInt();
		            byte unk1 = read.readByte(); //unk
		            byte unk2 = read.readByte(); //unk
		            byte unk3 = read.readByte(); //unk
		            int part = (maskdata >> 11) & 0x3F;
		            int who = (maskdata >> 2) & 0x1FF;
		            int hittype = (maskdata & 3);
		            int hitdamage = (maskdata >> 21);
		            int helmetflag = (maskdata >> 17) & 7;
		            send.writeShort(shotId);
		            send.writeShort(shotIndex);
		            send.writeShort(shotCamX);
		            send.writeShort(shotCamY);
		            send.writeShort(shotCamZ);
		            send.writeByte(weaponType);
		            send.writeInt(weaponId);
		            send.writeByte(hittimes);
		            send.writeInt(maskdata);
		            send.writeByte(unk1);
		            send.writeByte(unk2);
		            send.writeByte(unk3);
		            System.out.println("=================================================");
		            System.out.println("slot " + slot + " release FireDataOnObject to slot " + sub_slot);
		            System.out.println("shot id: " + shotId);
		            System.out.println("shot index: " + shotIndex);
		            System.out.println("shot camX: " + shotCamX);
		            System.out.println("shot camY: " + shotCamY);
		            System.out.println("shot camZ: " + shotCamZ);
		            System.out.println("hit type ( Wp / Knife ): " + weaponType);
		            System.out.println("weapon id: " + weaponId);
		            System.out.println("hit times: " + hittimes);
		            System.out.println("dmg flag: " + maskdata);
		            System.out.println("part: " + part);
		            System.out.println("who: " + who);
		            System.out.println("hittype: " + hittype);
		            System.out.println("hitdamage: " + hitdamage);
		            System.out.println("hit total damage: " + hitdamage * hittimes);
		            System.out.println("helmetflag: " + helmetflag);
		            for (int i = 0; i < hittimes; i++)
		            {
		            	read.readInt(); //weapon
		            	read.readBytes(24);
		            	if (hittimes > 1)
		            	{
		            		if ((hittimes - 1) != i)
		            		{
		            			System.out.println("VAROU!!!");
		            			read.readBytes(7);
		            		}
		            		else
		            		{
		            			read.readBytes(9);
		            		}
		            	}
		            	else
		            	{
		            		read.readBytes(9);
		            	}
		            }
		            System.out.println("readableBytes: " + read.readableBytes());
		            System.out.println("=================================================");
					break;
				}
				case ObjectStatus:
				{
					objectSyncer(read);
					break;
				}
				default:
				{
					break;
				}
			}
		}*/
	}
	public void missionDataSyncer(ByteBuf bb)
	{
		System.out.println(NetworkUtil.printData(String.format(" [!] BOMB 0x%02X [int: %d]", opcode, opcode), bb));
	}
	public void radioSyncer(ByteBuf bb)
	{
		//System.out.println(" slot " + slot + " radio chat to " + sub_slot);
		System.out.println(NetworkUtil.printData(String.format(" [!] RADIO 0x%02X [int: %d]", opcode, opcode), bb));
	}
	public void objectSyncer(ByteBuf bb)
	{
		bb.readShort(); //unk
		while (bb.isReadable())
		{
            int type = bb.readByte();
            if (type == 8)
            {
                int objid = bb.readShort();
                int unk1 = bb.readShort();
                bb.readByte();
                int unk2 = bb.readShort();
                bb.readByte();
                int hp = bb.readShort();
                System.out.println("Type: User, OBJ ID: " + objid + ", Unknown1(status? 11): " + unk1 + ", Unknown2(1): " + unk2 + ", HP: " + hp);
            }
            else if (type == 3)
            {
                int objid = bb.readShort();
                int unknown1 = bb.readShort();
                int unknown2 = bb.readShort();
                boolean isDestroyed = bb.readBoolean();
                System.out.println("<object type=\"OBJ\" objID=\"" + objid + "\" HP=\"100\"  unknown1=\"" + unknown1 + "\" unknown2=\"" + unknown2 + "\" canBreak=\"1\" /> Is Destroyed: " + isDestroyed);
            }
            bb.discardReadBytes();
		}
	}
	public void logger(String info)
	{
		try
		{
			File file = new File("package-logger/udp3//");
			if (!file.exists())
				file.mkdirs();
			FileWriter fw = new FileWriter("package-logger/udp3//Udp" + hours + ".txt", true);
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(info);
			bw.newLine();
			bw.flush();
			bw.close();
			fw.flush();
			fw.close();
			System.out.println(info);
			System.out.flush();
		}
		catch (IOException e)
		{
		}
	}
}