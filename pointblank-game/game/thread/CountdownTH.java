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

package game.thread;

import core.enums.*;
import core.models.*;
import core.tasks.*;
import core.xml.*;
import game.network.protocol.game.ACK.*;

public class CountdownTH implements PrincipalAbstract
{
	protected int players;
	@Override
	public void run(int roomId, int channelId, int serverId, int value) throws Exception
	{
		Channel ch = GameServerXML.gI().getChannel(channelId, serverId);
		if (ch != null)
		{
			Room r = ch.BUSCAR_SALA(roomId);
			if (r != null)
			{
				players = r.presPorTime(TimeEnum.values()[r._getMaster() % 2 == 0 ? 1 : 0]);
				if (r.getSlotState(r.LIDER) == SlotState.READY && r.rstate == RoomState.COUNTDOWN && (players > 0 || r.comand))
				{
					r.rstate = RoomState.LOADING;
					for (int i = 0; i < 16; i++)
					{
						Player m = r.getPlayerBySlot(i);
						RoomSlot s = r.getRoomSlot(i);
						if (m != null && s.state == SlotState.READY)
						{
							m.connection.sendPacket(new BATTLE_READYBATTLE_ACK(r));
							r.changeState(s, SlotState.LOAD, false);
							r.prepareReady(m, s);
						}
					}
					r.updateBInfo();
					r.updateInfo();
				}
				else
				{
					for (int i = 0; i < 16; i++)
					{
						Player m = r.getPlayerBySlot(i);
						RoomSlot s = r.getRoomSlot(i);
						if (m != null && s.state == SlotState.READY)
						{
							m.connection.sendPacket(new BATTLE_READYBATTLE_ERROR_ACK(0x80001008));
						}
					}
				}
				r.stopTask(ThreadState.COUNTDOWN);
				r.threadCOUNTDOWN = null;
			}
		}
	}
}