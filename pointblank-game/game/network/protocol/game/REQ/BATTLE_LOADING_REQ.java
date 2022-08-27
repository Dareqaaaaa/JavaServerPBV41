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

public class BATTLE_LOADING_REQ extends game.network.protocol.GamePacketREQ
{
	protected Room r;
	public BATTLE_LOADING_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		r = client.getRoom();
		if (r != null)
			r.map_name = ReadS(ReadC());
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		if (r != null && p != null)
		{
			if (r.map_name.isEmpty() || r.map_name.length() < 3)
				return;
			if (r.getSlotState(p.slot) != SlotState.LOAD)
				return;
			p.listClans.clear();
			if (!r.prepared1.containsKey(p.slot))
				r.prepared1.put(p.slot, p.id);
			r.changeState(p.slot, SlotState.RENDEZVOUS, true);
			if (p.id == r.LIDER)
			{
				r.prepare_room(p.slot);
				r.rstate = RoomState.RENDEZVOUS;
				r.updateBInfo();
			}
		}
	}
}