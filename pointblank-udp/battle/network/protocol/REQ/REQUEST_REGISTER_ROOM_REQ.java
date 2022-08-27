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

package battle.network.protocol.REQ;

import battle.controllers.*;
import battle.models.*;

public class REQUEST_REGISTER_ROOM_REQ extends battle.network.protocol.BattlePacketREQ
{
	protected int id;
	protected int roomId;
	protected int seed;
	protected int serverId;
	protected int channelId;
	protected int map;
	protected int leader;
	protected String map_name;
    public REQUEST_REGISTER_ROOM_REQ(int opcode)
    {
        super(opcode);
    }
	@Override
	public void readImpl()
	{
		id = ReadD();
		roomId = ReadD();
		seed = ReadD();
		serverId = ReadD();
		channelId = ReadD();
		map = ReadD();
		leader = ReadD();
		map_name = ReadS(ReadH());
	}
	@Override
	public void runImpl()
	{
		Room r = new Room(id, roomId, seed, serverId, channelId, map, leader, map_name);
		r.addPlayer(new Player(leader));
        RoomController.gI().addRoom(r);
	}
}