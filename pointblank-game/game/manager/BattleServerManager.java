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

import core.enums.*;
import core.models.*;
import core.network.*;
import game.network.client.*;
import game.network.protocol.battle.ACK.*;

public class BattleServerManager extends core.sql.InterfaceSQL
{
	protected static final BattleServerManager INSTANCE = new BattleServerManager();	
	protected transient Connection conn = null;
	public BattleServerManager()
	{
	}
	public static BattleServerManager gI()
	{
		return INSTANCE;
	}
	public int REGISTRAR(BattleClient client)
	{
		conn = client;
		System.out.println(" BattleServerManager accepted connection ");
		System.out.flush();
		return BattleServerAuthResponse.CONNECTED.ordinal();
	}
	public void REMOVER() throws Exception
	{
		if (conn != null)
		{
			conn.finalize();
			conn = null;
			System.out.println(" BattleServerManager removed connection ");
			System.out.flush();
		}
	}
	public void CHANGE_HOST(Room r, int slot)
	{
		try
		{
			if (r != null && conn != null)
				conn.sendPacket(new REQUEST_CHANGE_HOST_ACK(r, slot));
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
	}
	public void ADD_ROOM(Room r, int slot)
	{
		try
		{
			if (r != null && conn != null)
				conn.sendPacket(new REQUEST_REGISTER_ROOM_ACK(r, slot));
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
	}
	public void REMOVE_ROOM(int roomIdx)
	{
		try
		{
			if (conn != null)
				conn.sendPacket(new REQUEST_UNREGISTER_ROOM_ACK(roomIdx));
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
	}
	public void ADD_PLAYER(Room r, int slot)
	{
		try
		{
			if (r != null && r.rstate.ordinal() > 1 && conn != null)
				conn.sendPacket(new REQUEST_ADD_PLAYER_ACK(r, slot));
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
	}
	public void REMOVE_PLAYER(Room r, int slot)
	{
		try
		{
			if (r != null && conn != null)
				conn.sendPacket(new REQUEST_REMOVE_PLAYER_ACK(r, slot));
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
	}
	public void PREPARE_PLAYER(Room r, int slot)
	{
		try
		{
			if (r != null && r.rstate.ordinal() > 1 && conn != null)
				conn.sendPacket(new REQUEST_PRESTART_PLAYER_ACK(r, slot));
		}
		catch (Exception e)
		{
			error(getClass(), e);
		}
	}
}