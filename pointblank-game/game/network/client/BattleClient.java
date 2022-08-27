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

package game.network.client;

import game.manager.*;
import game.network.protocol.*;
import io.netty.buffer.*;
import io.netty.channel.*;
import io.netty.channel.socket.*;

import java.io.IOException;
import java.nio.*;
import java.util.*;

import core.network.*;

public class BattleClient extends Connection 
{
	protected final ProtocolProcessor<BattlePacketREQ> processor = new ProtocolProcessor<BattlePacketREQ>(1, 8);
	public BattleClient(SocketChannel socket, int serverIndex)
	{
		super(socket, serverIndex);
	}
	@Override
	protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception
	{
		super.decode(ctx, in, out);
		ByteBuf buffer = in.order(ByteOrder.LITTLE_ENDIAN);
		if (readHeader)
		{
			if (buffer.readableBytes() < 2)
				return;
			LENGTH = buffer.readUnsignedShort();
			readHeader = false;
		}
		if (buffer.readableBytes() < (LENGTH + 2))
			return;
		receivePacket(buffer.readBytes(LENGTH + 2));
		readHeader = true;
		buffer = null;
	}
	@Override
	public void channelUnregistered(ChannelHandlerContext ctx) throws Exception
	{
		super.channelUnregistered(ctx);
		BattleServerManager.gI().REMOVER();
	}
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception
	{
		super.exceptionCaught(ctx, cause);
		if (cause instanceof IOException)
			channelUnregistered(null);
	}
	@Override
	public void close(PacketACK packet)
	{
		super.close(packet);
		try
		{
			channelUnregistered(null);
		}
		catch (Exception e)
		{
		}
	}
	@Override
	public void sendPacket(PacketACK packet)
	{
		try
		{
			if (packet != null && (packet instanceof BattlePacketACK))
			{
				((BattlePacketACK) packet).write(this);
				packet.finalize();
			}
		}
		catch (Exception e)
		{
			excp(e);
		}
		packet = null;
	}
	protected void receivePacket(ByteBuf buffer)
	{
		BattlePacketREQ packet = null;
		try
		{
			packet = BattlePacketHAK.gI().MONTAR_PACOTE(buffer, this);
			if (packet != null && packet.read())
			{
				processor.newThread(packet);
				packet.finalize();
			}
		}
		catch (Exception e)
		{
			excp(e);
		}
		packet = null;
	}
}