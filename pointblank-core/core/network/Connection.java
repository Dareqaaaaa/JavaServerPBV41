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
import io.netty.channel.*;
import io.netty.channel.socket.*;
import io.netty.handler.codec.*;

import java.io.*;
import java.net.*;
import java.util.*;

import core.log.*;
import core.utils.*;

public abstract class Connection extends ByteToMessageDecoder
{
	public final int id = IDFactory.gI().nextId(); //5404
	public final int SECURITY_KEY = 29890;
	public final int CRYPT_KEY = ((id + SECURITY_KEY) % 7) + 1;
	public final int HASHCODE = 32759;
	public int LENGTH, LEAVEP2P, serverIndex;
	public byte[] shieldProtection;
	public boolean antiCheaterVerific = false, readHeader = true, decrypt = false, hasUnregistered = false, forceClose = false;
	public Channel channel;
	public String ip;
	public String mac;
	public SocketChannel socket;
	public InetSocketAddress address;
	public Connection(SocketChannel socket, int serverIndex)
	{
		this.socket = socket;
		this.serverIndex = serverIndex;
		address = socket.remoteAddress();
	}
	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception
	{
		channel = ctx.channel();
		SocketAddress remote = channel.remoteAddress();
		if (remote != null)
			ip = NetworkUtil.parseIp(remote.toString());
	}
	@Override
	protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception
	{
		//SocketChannel channel = (SocketChannel) ctx.channel();
		//if (channel.isActive() && socket.isActive() && channel.isOpen() && socket.isOpen())
		//	return;
		//close(null);
	}
	@Override
	public void channelReadComplete(ChannelHandlerContext ctx) throws Exception 
	{
		ctx.flush();
	}
	@Override
	public void channelUnregistered(ChannelHandlerContext ctx) throws Exception
	{
		if (ctx != null)
			super.channelUnregistered(ctx);
		if (ctx != null || forceClose)
		{
			IDFactory.gI().releaseId(id);
			finalize();
		}
		hasUnregistered = true;
	}
	@Override
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
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception 
	{
		if (cause.getMessage().equals("blockbot"))
			return;
		if (cause instanceof IOException)
		{
		    //ctx.pipeline().remove(this);
		    //ctx.pipeline().fireChannelRegistered();
			channel.flush();
			channel.close();
			ctx.channel().flush();
			ctx.channel().close();
			ctx.close();
		}
		else
		{
			excp(cause);
		}
	}
	public byte[] getIPBytes()
	{
		try
		{
			return NetworkUtil.parseIpToBytes(ip);
		}
		catch (Exception e)
		{
			return new byte[] { 1, 0, 0, 127 };
		}
	}
	public void close(PacketACK packet)
	{
		try
		{
			if (packet != null)
				sendPacket(packet);
			if (channel != null)
			{
				channel.flush();
				channel.close();
			}
			forceClose = true;
		}
		catch (Exception e)
		{
		}
	}
	@Override
	public String toString()
	{
		StringBuilder sb = new StringBuilder();
		sb.append("Client [id:").append(id);
		sb.append(", ip: ").append(ip).append(']');
		return sb.toString();
	}
	public final void excp(Throwable e)
	{
		Logger.gI().info("error", e, "", getClass());
	}
	abstract public void sendPacket(PacketACK packet);
}