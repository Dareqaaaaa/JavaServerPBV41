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

package auth.network.protocol.auth.ACK;

import core.models.*;
import core.xml.*;
import auth.manager.*;

public class BASE_UPDATE_SCHANNEL_LIST_ACK extends auth.network.protocol.AuthPacketACK
{
	protected boolean active;
	protected boolean access;
	protected int players;
	public BASE_UPDATE_SCHANNEL_LIST_ACK(boolean access)
	{
		super(true);
		this.access = access;
	}
	@Override
	public void writeImpl()
	{
		GameServerXML g = GameServerXML.gI();
		WriteD(g.servers.size());
		for (GameServerInfo srv : g.servers)
		{
			players = AccountManager.gI().sizePlayers(srv.id);
			if (players >= srv.max_players) active = false;
			else active = srv.active;
			if (access) active = srv.active;
			WriteD(active ? 1 : 0);
			WriteB(srv.ip);
			WriteH(srv.port);
			WriteC(srv.type.ordinal());
			WriteH(srv.max_players);
			WriteD(players);
		}
	}
}