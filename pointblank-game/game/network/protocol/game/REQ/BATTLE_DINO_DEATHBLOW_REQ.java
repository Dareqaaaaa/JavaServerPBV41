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

public class BATTLE_DINO_DEATHBLOW_REQ extends game.network.protocol.GamePacketREQ
{
	public BATTLE_DINO_DEATHBLOW_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		//Logger.gI().info("error", NetworkUtil.printData(String.format(" Dino Deathblow: 0x%02X [int: %d]", opcode, opcode), buf), "");
	}
	@Override
	public void runImpl()
	{
		Room r = client.getRoom();
		if (r != null && r.type == ModesEnum.DINO)
		{
			r.blueDino += 5;
			for (int i = 0; i < 16; i++)
			{
				Player pR = r.getPlayerBySlot(i);
				if (pR != null)
					pR.connection.sendPacket(new BATTLE_DINO_PLACAR_ACK(r));
			}
		}
	}
}