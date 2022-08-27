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

package battle.models;

import java.util.concurrent.*;

public class Room
{
	public int id;
	public int roomId;
	public int leader;
	public int seed;
	public int serverId;
	public int channelId;
	public int map;
	public String map_name;
	public ConcurrentHashMap<Integer, Player> players = new ConcurrentHashMap<Integer, Player>();
	public Room(int id, int roomId, int seed, int serverId, int channelId, int map, int leader, String map_name)
	{
		this.id = id;
		this.roomId = roomId;
		this.seed = seed;
		this.serverId = serverId;
		this.channelId = channelId;
		this.map = map;
		this.leader = leader;
		this.map_name = map_name;
	}
	public void addPlayer(Player p)
	{
		if (players.containsKey(p.slot))
			players.replace(p.slot, p);
		else
			players.put(p.slot, p);
	}
	public void removePlayer(int slot)
	{
		if (players.containsKey(slot))
			players.remove(slot);
	}
	public Player getPlayer(int slot)
	{
		return players.get(slot);
	}
	public boolean isUDP(int slot, boolean lider)
	{
		return lider ? slot != leader : slot == leader;
	}
}