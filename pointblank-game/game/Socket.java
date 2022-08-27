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

package game;

import game.network.*;

import java.util.*;
import java.util.concurrent.*;

import core.info.*;
import core.models.*;
import core.xml.*;

public class Socket
{
	public static void start() throws Exception
	{
		int size = GameServerXML.gI().servers.size() - 1;
		List<Runnable> list = new ArrayList<Runnable>();
		if (size > 0) list.add(GameSocketServer1.gI().configure(new SocketComplement(Software.pc.host,7030, 5)));
		if (size > 1) list.add(GameSocketServer2.gI().configure(new SocketComplement(Software.pc.host,7031 ,5)));
		if (size > 2) list.add(GameSocketServer3.gI().configure(new SocketComplement(Software.pc.host,7032, 5)));
		list.add(AuthSocketServer.gI().configure(new SocketComplement(Software.pc.host, 22330, 1)));
		list.add(BattleSocketServer.gI().configure(new SocketComplement(Software.pc.host, 22331, 1)));
		list.add(new Computer("Game"));
		ExecutorService exe = Executors.newFixedThreadPool(list.size());
		for (Runnable r : list)
			exe.submit(r);
		list.clear();
	}
}