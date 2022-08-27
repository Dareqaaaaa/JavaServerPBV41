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

package auth.network.protocol.auth.REQ;

import java.util.concurrent.*;

import core.models.*;
import core.network.*;
import auth.manager.*;
import auth.network.protocol.auth.ACK.*;
import auth.network.protocol.game.ACK.*;

public class BASE_GET_ENTER_SERVER_REQ extends auth.network.protocol.AuthPacketREQ
{
	protected Player p;
	protected Account a;
	protected long pId;
	protected boolean DESTROY = false;
	public BASE_GET_ENTER_SERVER_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		p = client.player;
		a = client.account;
		if (a != null) pId = a.id;
		else if (p != null) pId = p.id;
	}
	@Override
	public void runImpl()
	{
		try
		{
			DESTROY = checkIntegrity();
			if (DESTROY)
			{
				Connection con = GameServerManager.gI().conn;
				if (con != null)
					con.sendPacket(new KICK_ACCOUNT_ACK(pId));
				client.close(new BASE_GET_MACHINE_ACK());
			}
		}
		catch (Exception e)
		{
		}
		sendPacket(new BASE_GET_ENTER_SERVER_ACK());
	}
	public boolean checkIntegrity()
	{
		ConcurrentHashMap<Integer, auth.network.protocol.AuthPacketREQ> packets = client.packets;
		if (!packets.containsKey(2678)) return true;
		if (!packets.containsKey(2565)) return true;
		if (!packets.containsKey(2567)) return true;
		if (!packets.containsKey(2577)) return true;
		return false;
	}
}