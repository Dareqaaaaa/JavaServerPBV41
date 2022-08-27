/*
 * PointBlank Java client
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

import io.netty.bootstrap.*;
import io.netty.channel.nio.*;
import io.netty.channel.socket.nio.*;

import java.net.*;

import core.models.*;

public class BattleUdpServer extends core.sql.InterfaceSQL implements Runnable
{
	protected static final BattleUdpServer INSTANCE = new BattleUdpServer();
	protected SocketComplement sc;
	public BattleUdpServer()
	{
	}
	public static BattleUdpServer gI()
	{
		return INSTANCE;
	}
	public BattleUdpServer configure(SocketComplement sc)
	{
		this.sc = sc;
		//client.handler(new ChannelInitializer<NioDatagramChannel>()
		//{
		//	@Override
		//	public void initChannel(NioDatagramChannel channel) throws Exception
		//	{
		//		channel.pipeline().addLast(new LoggingHandler(LogLevel.DEBUG), new BattleUdpReceive());
		//	}
		//});
		//client.option(SO_BROADCAST, true);
		//client.option(SO_KEEPALIVE, true);
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
					System.out.println(" ClientBootstrap bind " + sc.getAddr());
					System.out.flush();
					Bootstrap client = new Bootstrap();
					client.group(group).
					channel(NioDatagramChannel.class).
					handler(new BattleUdpReceive()).
					bind(new InetSocketAddress(InetAddress.getByName(sc.addr), sc.port)).sync().channel().closeFuture().await();
					Thread.sleep(5000);
				}
				catch (Exception e)
				{
					error(getClass(), e);
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
				System.out.println(" ClientBootstrap is trying to reconnect to " + sc.getAddr() + "...");
				System.out.flush();
			}
		}
		catch (Exception e)
		{
		}
	}
}