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

package auth;

import java.util.*;
import java.util.concurrent.*;

import core.info.*;
import core.models.*;
import auth.network.*;

public class Socket
{
	public static void start() throws Exception
	{
		List<Runnable> list = new ArrayList<Runnable>();
		list.add(AuthSocketServer.gI().configure(new SocketComplement(Software.pc.host, 39190, 5)));
		list.add(GameSocketClient.gI().configure(new SocketComplement(Software.pc.host, 22330, 1)));
		list.add(new Computer("Auth"));
		ExecutorService exe = Executors.newFixedThreadPool(list.size());
		for (Runnable r : list)
			exe.submit(r);
		list.clear();
	}
}