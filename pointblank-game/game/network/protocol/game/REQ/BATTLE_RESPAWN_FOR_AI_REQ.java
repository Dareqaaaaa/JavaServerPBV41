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
import game.network.protocol.game.ACK.*;

public class BATTLE_RESPAWN_FOR_AI_REQ extends game.network.protocol.GamePacketREQ
{
	protected int slot;
	public BATTLE_RESPAWN_FOR_AI_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{		
		slot = ReadD();
	}
	@Override
	public void runImpl()
	{
		Room r = client.getRoom();
		if (r != null && r.special == 6 || r.special == 9 && r.rstate == RoomState.BATTLE)
		{
			r.respawn++;
			RoomSlot s = r.getRoomSlot(slot);
			if (s != null)
			{
				s.killMessage = FragValues.NONE;
				s.lastKillState = 0;
				s.oneTimeKills = 0;
				s.repeatLastState = false;
				s.dinoOnLife = 0;
				s.respawn++;
			}
			for (int i = 0; i < 16; i++)
			{
				Player m = r.getPlayerBySlot(i);
				if (m != null)
					m.connection.sendPacket(new BATTLE_RESPAWN_FOR_AI_ACK(slot));
			}
		}
	}
}