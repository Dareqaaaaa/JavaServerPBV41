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

public class RoundRestartTH implements PrincipalAbstract
{
	@Override
	public void run(int roomId, int channelId, int serverId, int value) throws Exception
	{
		Channel ch = GameServerXML.gI().getChannel(channelId, serverId);
		if (ch != null)
		{
			Room r = ch.BUSCAR_SALA(roomId);
			if (r != null)
			{
				if (r.rstate.ordinal() > 1)
				{
					r.bomba = false;
			        r.stopTask(ThreadState.BOMB);
					for (int i = 0; i < 16; i++)
					{
						Player mM = r.getPlayerBySlot(i);
						RoomSlot s = r.getRoomSlot(i);
						if (mM != null && s != null && s.state == SlotState.BATTLE)
						{
							s.espectador = false;
							s.death = false;
				            mM.connection.sendPacket(new BATTLE_MISSION_ROUND_PRE_START_ACK(r));
				            mM.connection.sendPacket(new BATTLE_MISSION_ROUND_START_ACK(r, 0));
						}
					}
				}
				r.stopTask(ThreadState.ROUND);
				r.stopTask(ThreadState.BOMB);
			    r.threadROUND = null;
			    r.threadBOMB = null;
			}
		}
	}
}