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

package core.utils;

import java.util.concurrent.*;

import core.models.*;
import core.xml.*;

public class AccountSyncer
{
	protected static final AccountSyncer INSTANCE = new AccountSyncer();
	public volatile ConcurrentHashMap<Long, Player> ACCOUNTS = new ConcurrentHashMap<Long, Player>();
	public AccountSyncer()
	{
	}
	public static AccountSyncer gI()
	{
		return INSTANCE;
	}
	public int SERVERSIZE(int server_id)
	{
		int players = 0;
		for (Player p : ACCOUNTS.values())
		{
			if (p != null && p.connection != null && p.channel_id >= 0 && p.server_id >= 0)
			{
				Channel ch = GameServerXML.gI().getChannel(p.channel_id, p.server_id);
				if (ch != null)
					players++;
			}
		}
		return players;
	}
	public void PUT(Player p)
	{
		synchronized (p)
		{
			if (p != null)
			{
				if (ACCOUNTS.containsKey(p.id))
					ACCOUNTS.replace(p.id, p);
				else
					ACCOUNTS.put(p.id, p);
			}
		}
	}
	public void REMOVE(long pId)
	{
		synchronized (ACCOUNTS)
		{
			if (ACCOUNTS.containsKey(pId))
				ACCOUNTS.remove(pId);
		}
	}
	public void UPDATE(Player p)
	{
		synchronized (p)
		{
			if (p != null)
			{
				if (ACCOUNTS.containsKey(p.id))
					ACCOUNTS.replace(p.id, p);
			}
		}
	}
	public Player get(long pId)
	{
		if (pId > 0)
		{
			if (ACCOUNTS.containsKey(pId))
			{
				Player p = ACCOUNTS.get(pId);
				if (p != null && p.connection != null)
				{
					if (p.connection.socket.isActive() && p.connection.socket.isOpen())
						p.online = 1;
				}
				return p;
			}
			else
			{
				return null;
			}
		}
		else
		{
			return null;
		}
	}
	public Player get(String name)
	{
		for (Player pR : ACCOUNTS.values())
			if (pR.name.equals(name))
				return get(pR.id);
		return null;
	}
}