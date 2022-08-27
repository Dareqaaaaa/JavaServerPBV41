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
import core.xml.*;
import game.network.protocol.game.ACK.*;

public class ATTENDANCE_CHECK_REQ extends game.network.protocol.GamePacketREQ
{
	protected int id;
	public ATTENDANCE_CHECK_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		id = ReadD();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		EventVerification e = CheckXML.gI().VERIFICATION_ID(id);
		if (p != null && e != null)
		{
			synchronized (e)
			{
				if (p.checkou)
					return;
				p.event.eventIdx = id;
				p.event.last_check1++;
				p.event.last_check2++;
				if (p.event.last_check1 >= e.checks)
					p.event.last_check2++;
				p.event.check_day = date.getYearMouthDay(0);
				sendPacket(new ATTENDANCE_CHECK_ACK(e, p.event, 0x80001504));
				EventGifts gf = e.GIFT(p.event.last_check1);
				if (gf.clear)
				{
					sendPacket(new ATTENDANCE_REWARD_ACK(0x80001504));
					for (EventReward r : e.items)
					{
						if (r.gift == gf.gift1 || r.gift == gf.gift2)
						{
							sendPacket(new INVENTORY_ITEM_CREATE_ACK(p, r.item_id, r.count, r.equip, -1, true));
							break;
						}
					}
				}
				if (p.event.last_check2 > p.event.last_check1)
				{
					p.event.last_check1 = 0;
					p.event.last_check2 = 0;
					p.event.check_day = 0;
					p.event.checks_id = id;
					db.executeQuery("UPDATE jogador_evento SET checks_id='" + id + "' WHERE player_id='" + p.id + "'");
				}
				db.executeQuery("UPDATE jogador_evento SET last_check1='" + p.event.last_check1 + "', last_check2='" + p.event.last_check2 + "', check_day='" + p.event.check_day + "' WHERE player_id='" + p.id + "'");
				p.checkou = true;
			}
		}
	}
}