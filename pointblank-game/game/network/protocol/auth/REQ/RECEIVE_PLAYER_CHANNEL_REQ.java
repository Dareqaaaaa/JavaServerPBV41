/*
 * PointBlank Java Server
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Henrique Rodrigues
 * Copyright (C) 2015-2017
 */

package game.network.protocol.auth.REQ;

import game.network.protocol.*;
import game.network.protocol.auth.ACK.*;

import java.util.*;

import core.models.*;
import core.utils.*;
import core.xml.*;

public class RECEIVE_PLAYER_CHANNEL_REQ extends AuthPacketREQ
{
	public RECEIVE_PLAYER_CHANNEL_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
	}
	@Override
	public void runImpl()
	{
		List<GameServerInfo> servers = new ArrayList<GameServerInfo>();
		for (GameServerInfo srv : GameServerXML.gI().servers)
		{
			srv.players = AccountSyncer.gI().SERVERSIZE(srv.id);
			servers.add(srv);
		}
		sendPacket(new RECEIVE_PLAYER_CHANNEL_ACK(servers));
	}
}