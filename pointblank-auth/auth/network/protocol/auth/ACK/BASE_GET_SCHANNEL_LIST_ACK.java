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
import core.utils.*;
import core.xml.*;
import auth.manager.*;

public class BASE_GET_SCHANNEL_LIST_ACK extends auth.network.protocol.AuthPacketACK
{
	public BASE_GET_SCHANNEL_LIST_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		GameServerXML g = GameServerXML.gI();
		WriteD(conn.id);
		WriteB(conn.getIPBytes());
		WriteH(conn.SECURITY_KEY);
		WriteH(conn.HASHCODE);
		WriteB(new byte[] { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 });
		WriteC(1);
		WriteD(g.servers.size());
		for (GameServerInfo srv : g.servers)
		{
			WriteD(srv.active ? 1 : 0);
			WriteB(srv.ip);
			WriteH(srv.port);
			WriteC(srv.type.ordinal());
			WriteH(srv.max_players);
			WriteD(AccountManager.gI().sizePlayers(srv.id));
		}
		WriteB(NetworkUtil.hexStringToByteArray("00 00 01 00 00 00 00 00 00"));
		//WriteB(NetworkUtil.hexStringToByteArray("01 00 2C 01 C8 00 00 00 64 00 00 00 01 01 00 00 00 64 00 00 00 96 00"));
	}
}