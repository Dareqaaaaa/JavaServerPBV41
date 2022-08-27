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

package battle.controllers;

import java.util.concurrent.*;

import core.network.*;
import battle.models.*;
import battle.network.protocol.*;

public class RoomController
{
	protected volatile ConcurrentHashMap<Integer, Room> rooms = new ConcurrentHashMap<Integer, Room>();
	public transient Connection conn = null;
	public RoomController()
	{
	}
	public static RoomController gI()
	{
		return Singleton.INSTANCE;
	}
    public void addRoom(Room r)
    {
    	if (rooms.containsKey(r.id))
    		rooms.replace(r.id, r);
    	else
    		rooms.put(r.id, r);
    }
    public void removeRoom(int id)
    {
    	if (rooms.containsKey(id))
    		rooms.remove(id);
    }
    public Room getRoom(int id)
    {
        return rooms.get(id);
    }
    public void sendPacket(BattlePacketACK packet)
    {
    	if (conn != null && packet != null)
    		conn.sendPacket(packet);
    }
    protected static class Singleton
	{
		protected static final RoomController INSTANCE = new RoomController();
	}
}