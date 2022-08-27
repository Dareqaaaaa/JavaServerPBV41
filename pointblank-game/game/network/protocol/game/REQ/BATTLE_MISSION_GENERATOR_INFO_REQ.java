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

public class BATTLE_MISSION_GENERATOR_INFO_REQ extends game.network.protocol.GamePacketREQ
{
	protected Room r;
	protected boolean playing = false;
	public BATTLE_MISSION_GENERATOR_INFO_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		r = client.getRoom();
		if (r != null)
		{
			playing = r.getSlotState(client.pId).ordinal() == 13 && r.rstate == RoomState.BATTLE;
			if (playing)
			{
				r.bar1 = ReadH();
				r.bar2 = ReadH();
		        for (int i = 0; i < 16; i++)
		        {
		        	RoomSlot slot = r.getRoomSlot(i);
		        	slot.bar1 = ReadH();
		        	slot.util = slot.bar1 / 600;
		        }
			}
		}
	}
	@Override
	public void runImpl()
	{
		if (r != null && playing)
		{
			for (int i = 0; i < 16; i++)
			{
				Player mM = r.getPlayerBySlot(i);
				if (mM != null)
					mM.connection.sendPacket(new BATTLE_MISSION_GENERATOR_INFO_ACK(r));
			}
	        if (r.bar1 < 1)
	        {
	        	r.round(TimeEnum.TIME_AZUL, WinnerRound.GENERATORINFO);
	        }
	        else if (r.bar2 < 1)
	        {
	        	r.round(TimeEnum.TIME_VERMELHO, WinnerRound.GENERATORINFO);
	        }
		}
	}
}