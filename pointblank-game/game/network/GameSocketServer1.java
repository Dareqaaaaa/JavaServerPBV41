package game.network;

import game.network.client.*;
import io.netty.bootstrap.*;
import io.netty.channel.*;
import io.netty.channel.nio.*;
import io.netty.channel.socket.*;
import io.netty.channel.socket.nio.*;
import io.netty.handler.logging.*;

import java.net.*;

import core.models.*;
import static io.netty.channel.ChannelOption.*;

public class GameSocketServer1 implements Runnable
{
	protected static final GameSocketServer1 INSTANCE = new GameSocketServer1();
	protected SocketComplement sc;
	public GameSocketServer1()
	{
	}
	public static GameSocketServer1 gI()
	{
		return INSTANCE;
	}
	public GameSocketServer1 configure(SocketComplement sc) throws Exception
	{
		this.sc = sc;
		System.out.println(" ServerBootstrap bind " + sc.getAddr());
		System.out.flush();
		return this;
	}
	@Override
	public void run()
	{
		while (true)
		{
			NioEventLoopGroup group = new NioEventLoopGroup(sc.boss);
			NioEventLoopGroup child = new NioEventLoopGroup(sc.work);
			try
			{
				ServerBootstrap server = new ServerBootstrap();
				server.option(TCP_NODELAY, false).
				childOption(TCP_NODELAY, false).
				group(group, child).
				channel(NioServerSocketChannel.class).
				childHandler(new ChannelInitializer<SocketChannel>()
				{
					@Override
					public void initChannel(SocketChannel channel) throws Exception
					{
						channel.pipeline().addLast(new LoggingHandler(LogLevel.DEBUG), new GameClient(channel, 1));
					}
				}).
				bind(new InetSocketAddress(InetAddress.getByName(sc.addr), sc.port)).sync().channel().closeFuture().sync();
				Thread.sleep(5000);
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			finally
			{
				try
				{
					group.shutdownGracefully().sync();
					child.shutdownGracefully().sync();
				}
				catch (Exception e)
				{
				}
			}
			System.out.println(" ServerBootstrap is trying to reconnect to " + sc.getAddr() + "... ");
			System.out.flush();
		}
	}
}