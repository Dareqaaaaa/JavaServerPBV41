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

package game.network.protocol.game.REQ;

import game.network.protocol.game.ACK.*;

import java.util.*;

import core.models.*;

public class CLAN_CLIENT_LIST_REQ extends game.network.protocol.GamePacketREQ
{
	protected List<Clan> clans = new ArrayList<Clan>(170);
	protected int error;
	protected int clan_id;
	public CLAN_CLIENT_LIST_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		error = ReadD();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		if (p != null)
		{
			clan_id = p.clan_id;
			if (error == 0)
			{
				p.listClans.clear();
				int clanSize = (int)Math.ceil((double)ck.clans.size() / 170);
				if (clanSize == 0 && ck.clans.size() > 0)
					clanSize = 1;
				for (int i = 0; i < clanSize; i++)
					p.listClans.put(i, new ArrayList<Clan>(170));
				for (Clan c : ck.clans.values())
				{
					for (List<Clan> list : p.listClans.values())
					{
						if (list.size() + 1 <= 170)
						{
							list.add(c);
							break;
						}
					}
				}
			}
			if (p.listClans.containsKey(error))
				clans = p.listClans.get(error);
		}
		sendPacket(new CLAN_CLIENT_LIST_ACK(clans, error, clan_id));
	}
}