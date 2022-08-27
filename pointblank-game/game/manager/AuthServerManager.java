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

package game.manager;

import core.network.*;

public class AuthServerManager
{
	protected static final AuthServerManager INSTANCE = new AuthServerManager();	
	protected transient Connection conn = null;
	private AuthServerManager()
	{
	}
	public static AuthServerManager gI()
	{
		return INSTANCE;
	}
	public void REGISTRAR(Connection client)
	{
		conn = client;
		System.out.println(" AuthServerManager accepted connection ");
		System.out.flush();
	}
	public void REMOVER() throws Exception
	{
		if (conn != null)
		{
			conn.finalize();
			conn = null;
			System.out.println(" AuthServerManager removed connection ");
			System.out.flush();
		}
	}
}