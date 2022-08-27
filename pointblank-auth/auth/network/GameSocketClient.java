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

package auth.network;

import static io.netty.channel.ChannelOption.*;
import io.netty.bootstrap.*;
import io.netty.channel.*;
import io.netty.channel.nio.*;
import io.netty.channel.socket.*;
import io.netty.channel.socket.nio.*;
import io.netty.handler.logging.*;

import java.net.*;

import core.models.*;
import auth.network.client.*;

public class GameSocketClient implements Runnable
{
	protected static final GameSocketClient INSTANCE = new GameSocketClient();
	protected SocketComplement sc;
	public GameSocketClient()
	{
	}
	public static GameSocketClient gI()
	{
		return INSTANCE;
	}
	public GameSocketClient configure(SocketComplement sc)
	{
		this.sc = sc;
		System.out.println(" ClientBootstrap bind " + sc.getAddr());
		System.out.flush();
		return this;
	}
	@Override
	public void run()
	{
		try
		{
			while (true)
			{
				NioEventLoopGroup group = new NioEventLoopGroup(sc.boss);
				try
				{
					Bootstrap client = new Bootstrap();
					client.option(TCP_NODELAY, false).
					group(group).
					channel(NioSocketChannel.class).
					handler(new ChannelInitializer<SocketChannel>()
					{
						@Override
						public void initChannel(SocketChannel channel) throws Exception
						{
							channel.pipeline().addLast(new LoggingHandler(LogLevel.DEBUG), new GameClient(channel, 0));
						}
					}).
					connect(new InetSocketAddress(InetAddress.getByName(sc.addr), sc.port)).sync().channel().closeFuture().sync();
					Thread.sleep(5000);
				}
				catch (Exception e)
				{
				}
				finally
				{
					try
					{
						group.shutdownGracefully().sync();
					}
					catch (Exception e)
					{
					}
				}
			}
		}
		catch (Exception e)
		{
		}
	}
}