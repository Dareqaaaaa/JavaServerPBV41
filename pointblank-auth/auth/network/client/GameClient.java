/*
 * Point Blank Emulador
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Authors: Henrique Rodrigues
 * Copyright (C) 2016-2018
 */

package auth.network.client;

import io.netty.buffer.*;
import io.netty.channel.*;
import io.netty.channel.socket.*;

import java.nio.*;
import java.util.*;

import core.network.*;
import auth.manager.*;
import auth.network.protocol.*;
import auth.network.protocol.game.ACK.*;

public class GameClient extends Connection
{
	protected final ProtocolProcessor<GamePacketREQ> processor = new ProtocolProcessor<GamePacketREQ>(1, 8);
	public GameClient(SocketChannel socket, int serverIndex)
	{
		super(socket, serverIndex);
	}
	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception
	{
		super.channelActive(ctx);
		sendPacket(new GAME_CONNECTION_ACK(1));
		GameServerManager.gI().REGISTRAR(this);
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
		GameServerManager.gI().REMOVER();
	}
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception
	{
		super.exceptionCaught(ctx, cause);
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
			if (packet != null && (packet instanceof GamePacketACK))
			{
				((GamePacketACK) packet).write(this);
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
		GamePacketREQ packet = null;
		try
		{
			packet = GamePacketHAK.gI().MONTAR_PACOTE(buffer, this);
			if (packet != null && packet.read())
			{
				if (packet.sync)
				{
					synchronized (packet)
					{
						processor.newThread(packet);
						packet.finalize();
					}
				}
				else
				{
					processor.newThread(packet);
					packet.finalize();
				}
			}
		}
		catch (Exception e)
		{
			excp(e);
		}
		packet = null;
	}
}