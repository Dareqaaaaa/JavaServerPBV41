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

package game.network.protocol.auth.ACK;

import game.network.protocol.*;

import java.util.*;

import core.models.*;

public class RECEIVE_PLAYER_CHANNEL_ACK extends AuthPacketACK
{
	protected List<GameServerInfo> servers;
	public RECEIVE_PLAYER_CHANNEL_ACK(List<GameServerInfo> servers)
	{
		super(true);
		this.servers = servers;
	}
	@Override
	public void writeImpl()
	{
		WriteC(servers.size());
		for (GameServerInfo srv : servers)
		{
			WriteD(srv.id);
			WriteD(srv.players);
		}
		servers = null;
	}
}