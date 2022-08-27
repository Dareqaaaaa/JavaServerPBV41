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

public class CLAN_MATCH_CLAN_PART_REQ extends game.network.protocol.GamePacketREQ
{
	protected List<ClanFronto> list = new ArrayList<ClanFronto>();
	protected int error;
	public CLAN_MATCH_CLAN_PART_REQ(int opcode)
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
	        for (ClanFronto m : ch.CLANFRONTOS.values())
	        	if (m.clan_id == p.clan_id)
	        		list.add(m);
		}
		sendPacket(new CLAN_MATCH_CLAN_PART_ACK(list, error));
	}
}