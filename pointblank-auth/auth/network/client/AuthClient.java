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

import java.io.*;
import java.nio.*;
import java.util.*;
import java.util.concurrent.*;

import core.models.*;
import core.network.*;
import core.sql.*;
import core.utils.*;
import auth.manager.*;
import auth.network.protocol.*;
import auth.network.protocol.auth.ACK.*;

public class AuthClient extends Connection
{
	protected final ProtocolProcessor<AuthPacketREQ> processor = new ProtocolProcessor<AuthPacketREQ>(1, 8);
	public volatile ConcurrentHashMap<Integer, AuthPacketREQ> packets = new ConcurrentHashMap<Integer, AuthPacketREQ>();
	public Account account;
	public Player player;
	public String login = "";
	public AuthClient(SocketChannel socket, int serverIndex)
	{
		super(socket, serverIndex);
	}
	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception
	{
		super.channelActive(ctx);
		sendPacket(new BASE_GET_SCHANNEL_LIST_ACK());
	}
	@Override
	protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception
	{
		super.decode(ctx, in, out);
		ByteBuf buffer = in.order(ByteOrder.LITTLE_ENDIAN);
		if (readHeader)
		{
			if (buffer.readableBytes() < 4)
				return;
			LENGTH = buffer.readUnsignedShort();
			if (LENGTH > 8908)
			{
				LENGTH &= 32767;
				decrypt = true;
			}
			readHeader = false;
		}
		if (buffer.readableBytes() < (LENGTH + 2))
			return;
		ByteBuf recv = buffer.readBytes(LENGTH + 2);
		if (decrypt)
			BitShift.decrypt(recv, CRYPT_KEY);
		receivePacket(recv);
		readHeader = true;
		decrypt = false;
		buffer = null;
	}
	@Override
	public void channelUnregistered(ChannelHandlerContext ctx) throws Exception
	{
		if (this != null && super.getClass() != null)
		{
			AccountManager ac = AccountManager.gI();
			if (ac.WAITING.containsKey(id))
				ac.WAITING.remove(id);
			if (login != null && ac.accounts.containsKey(login))
				ac.accounts.remove(login);
		}
		super.channelUnregistered(ctx);
	}
	public void VERIFICAR_CONTA_ONLINE()
	{
		if (player != null)
			PlayerSQL.gI().updateOnline(player.id, 0);
	}
	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception
	{
		super.exceptionCaught(ctx, cause);
		if (cause instanceof IOException)
		{
			channelUnregistered(null);
			VERIFICAR_CONTA_ONLINE();
		}
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
		VERIFICAR_CONTA_ONLINE();
	}
	@Override
	public void sendPacket(PacketACK packet)
	{
		try
		{
			if (packet != null && (packet instanceof AuthPacketACK))
			{
				((AuthPacketACK) packet).write(this);
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
		AuthPacketREQ packet = null;
		try
		{
			packet = AuthPacketHAK.gI().MONTAR_PACOTE(buffer, this);
			if (packet != null && packet.read())
			{
				if (!packets.containsKey(packet.opcode))
					packets.put(packet.opcode, packet);
				else
				{
					if (packet.opcode == 2577)
						close(new BASE_GET_MACHINE_ACK());
				}
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