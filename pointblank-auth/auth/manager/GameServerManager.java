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

package auth.manager;

import core.network.*;

public class GameServerManager
{
	protected static final GameServerManager INSTANCE = new GameServerManager();	
	public transient Connection conn = null;
	private GameServerManager()
	{
	}
	public static GameServerManager gI()
	{
		return INSTANCE;
	}
	public void REGISTRAR(Connection client)
	{
		conn = client;
		System.out.println(" GameServerManager accepted connection ");
		System.out.flush();
	}
	public void REMOVER() throws Exception
	{
		if (conn != null)
		{
			conn.finalize();
			conn = null;
			System.out.println(" GameServerManager removed connection ");
			System.out.flush();
		}
	}
}