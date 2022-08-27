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

public class BATTLE_DINO_ESCAPE_REQ extends game.network.protocol.GamePacketREQ
{
	protected int slot;
	protected int bonus;
	public BATTLE_DINO_ESCAPE_REQ(int opcode)
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
		Player p = client.getPlayer();
		if (p != null && r != null && r.rstate == RoomState.BATTLE)
		{
			RoomSlot s = r.getRoomSlot(slot);
			if (s != null && s.state.ordinal() == 13)
			{
				switch (s.dinoOnLife)
				{
					case 0: bonus = 1; break;
					case 1: bonus = 2; break;
					case 2: bonus = 3; break;
					case 3: bonus = 4; break;
					default: bonus = 1; break;
				}
				if (slot % 2 == 0)
					r.redDino += (5 + bonus + s.dinoOnLife);
				else
					r.blueDino += (5 + bonus + s.dinoOnLife);
				s.exp += 5;
				s.gold += 5;
				s.objetivo++;
				s.dinoOnLife++;
				for (int i = 0; i < 16; i++)
				{
					Player m = r.getPlayerBySlot(i);
					if (m != null)
					{
						m.connection.sendPacket(new BATTLE_DINO_ESCAPE_ACK(r, s));
						m.connection.sendPacket(new BATTLE_DINO_PLACAR_ACK(r));
					}
				}
			}
		}
	}
}