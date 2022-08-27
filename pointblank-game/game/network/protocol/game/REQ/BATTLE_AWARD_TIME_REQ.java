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

import core.enums.*;
import core.models.*;
import core.xml.*;
import game.network.protocol.game.ACK.*;

public class BATTLE_AWARD_TIME_REQ extends game.network.protocol.GamePacketREQ
{
	protected int gift;
	public BATTLE_AWARD_TIME_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		gift = ReadD();
	}
	@Override
	public void runImpl()
	{
		Room r = client.getRoom();
		Player p = client.getPlayer();
		if (p != null && r != null)
		{
			if (r.getSlotState(p) == SlotState.NORMAL)
			{
				EventPlaytime e = PlaytimeXML.gI().PLAYTIME_ID(p.event.event_playtime);
				if (e != null)
				{
					for (EventReward er : e.items)
					{
						if (er.gift == gift)
						{
							sendPacket(new INVENTORY_ITEM_CREATE_ACK(p, er.item_id, er.count, er.equip, -1, true));
							break;
						}
					}
					p.event.event_playtime = -1;
				}
			}
		}
	}
}