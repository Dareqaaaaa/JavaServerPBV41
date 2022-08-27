package battle;

import java.util.*;
import java.util.concurrent.*;

import core.info.*;
import core.models.*;
import battle.network.*;
import battle.network.udp.*;

public class Socket
{
	public static void start() throws Exception
	{
		List<Runnable> list = new ArrayList<Runnable>();
		list.add(BattleUdpServer.gI().configure(new SocketComplement(Software.pc.host, 40000, 0)));
		list.add(BattleSocketClient.gI().configure(new SocketComplement(Software.pc.host, 22331, 1)));
		list.add(new Computer("UDP"));
		ExecutorService exe = Executors.newFixedThreadPool(list.size());
		for (Runnable r : list)
			exe.submit(r);
		list.clear();
	}
}