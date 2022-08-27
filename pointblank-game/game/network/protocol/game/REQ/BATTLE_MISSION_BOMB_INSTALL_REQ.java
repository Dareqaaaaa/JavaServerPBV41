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
import core.udp.UDP_PosRotation;
import game.network.protocol.game.ACK.*;
import game.thread.*;

public class BATTLE_MISSION_BOMB_INSTALL_REQ extends game.network.protocol.GamePacketREQ
{
	protected BombMap map;
	protected UDP_PosRotation position;
	protected int slot;
	public BATTLE_MISSION_BOMB_INSTALL_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		try
		{
			slot = ReadD();
			map = BombMap.values()[ReadC()];
			position = new UDP_PosRotation(ReadU(), ReadU(), ReadU(), ReadU(), ReadU(), ReadU());
		}
		catch (Exception e)
		{
		}
	}
	@Override
	public void runImpl()
	{
		Room r = client.getRoom();
		Player p = client.getPlayer();
		if (r != null && p != null)
		{
			RoomSlot s = r.getRoomSlot(slot);
			if (s != null && r.threadBOMB == null && slot % 2 == 0 && map != BombMap.NULL && s.state == SlotState.BATTLE && r.rstate == RoomState.BATTLE && position != null)
			{
				for (int i = 0; i < 16; i++)
				{
					Player mM = r.getPlayerBySlot(i);
					if (mM != null)
						mM.connection.sendPacket(new BATTLE_MISSION_BOMB_INSTALL_ACK(slot, map, position));
				}
				if (r.map != 44)
				{
					s.objetivo++;
					r.bombMissionStart(new BombMissionTH(), r.rodadas);
				}
				map = null;
				position = null;
			}
		}
	}
}