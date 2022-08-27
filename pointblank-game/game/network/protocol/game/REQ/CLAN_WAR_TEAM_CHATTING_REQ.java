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

import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class CLAN_WAR_TEAM_CHATTING_REQ extends game.network.protocol.GamePacketREQ
{
	protected String msg;
	protected int length;
	public CLAN_WAR_TEAM_CHATTING_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		ReadH(); //type
		length = ReadH();
		if (length > 60) length = 60;
		msg = ReadS(length);
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		Channel ch = client.getChannel();
		if (p != null && ch != null)
		{
			ClanFronto cf = ch.BUSCAR_CF(p.cf_id);
			if (cf != null)
			{
				for (RoomSlot slot : cf.SLOT)
				{
					if (slot.player_id > 0)
					{
						Player m = AccountSyncer.gI().get(slot.player_id);
						if (m != null && m.connection != null)
							m.connection.sendPacket(new CLAN_WAR_TEAM_CHATTING_ACK(p, msg));
					}
				}
			}
		}
	}
}