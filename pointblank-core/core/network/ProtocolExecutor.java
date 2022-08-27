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

import java.util.concurrent.*;

import core.info.Software;
import core.log.*;
import core.utils.*;

@SuppressWarnings({ "unchecked", "rawtypes" })
public abstract class ProtocolExecutor<P extends PacketREQ, C extends Connection>
{
	public final ConcurrentMap<Integer, P> pacotes = new ConcurrentSkipListMap<Integer, P>();
	protected void put(P packet)
	{
		if (pacotes.containsKey(packet.opcode))
			System.err.println(" [!] Packet already added: " + packet.opcode);
		pacotes.put(packet.opcode, packet);
	}
	protected P getPacket(int opcode, ByteBuf buffer, C client, boolean SYSTEM) throws Exception
	{
		if (!SYSTEM) //Opcode 2825 - Bot envia
		{
			buffer.readUnsignedShort(); //length
			if (opcode != 2584 && (opcode < 275 || opcode == 396 || buffer.readableBytes() > 299 || buffer.readableBytes() == 12866 || (Software.rev != 9 && opcode > 3911)))
			{
				client.close(null);
				return null;
			}
		}
		P packet = pacotes.get(opcode);
		if (packet != null)
		{
			P res = (P) packet.clonePacket();
			res.buf = buffer;
			res.client = client;
			return res;
		}
		Logger.gI().info("error", null, (client + NetworkUtil.printData(String.format(" [!] OPCODE NOT FOUNDED : 0x%02X [int: %d]", opcode, opcode), buffer)), getClass());
		return null;
	}
}