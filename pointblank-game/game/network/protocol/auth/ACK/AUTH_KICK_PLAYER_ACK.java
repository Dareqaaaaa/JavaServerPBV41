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

public class AUTH_KICK_PLAYER_ACK extends AuthPacketACK
{
	protected int online;
	protected long pId;
	public AUTH_KICK_PLAYER_ACK(int online, long pId)
	{
		super(true);
		this.online = online;
		this.pId = pId;
	}
	@Override
	public void writeImpl()
	{
		WriteD(online);
		WriteQ(pId);
	}
}