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

public class CLAN_WAR_MATCH_TEAM_LIST_REQ extends game.network.protocol.GamePacketREQ
{
	protected List<ClanFronto> match = new ArrayList<ClanFronto>();
	protected short error;
	public CLAN_WAR_MATCH_TEAM_LIST_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		error = ReadH();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		Channel ch = client.getChannel();
		if (p != null && ch != null)
		{
			for (ClanFronto cf : ch.CLANFRONTOS.values())
			{
				if (cf.id != p.cf_id)
				{
					if (cf.PLAYERS() == 0)
					{
						ch.CLANFRONTOS.remove(cf.id);
						continue;
					}
					match.add(cf);
				}
			}
			sendPacket(new CLAN_WAR_MATCH_TEAM_LIST_ACK(match, error));
		}
		match = null;
	}
}