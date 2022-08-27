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

package game.network.protocol.game.ACK;

import java.util.*;

import core.enums.*;
import core.models.*;
import core.utils.*;

public class BATTLE_STARTBATTLE_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	protected RoomSlot s;
	protected int enter;
	protected int error;
	protected int slotDino;
	public BATTLE_STARTBATTLE_ACK(Room r, RoomSlot s, int enter, int error)
	{
		super(true);
		this.r = r;
		this.s = s;
		this.enter = enter;
		this.error = error;
		EssencialUtil.gI().MISSION_COMPLETE(r, s, new FragInfos(), false, enter == 0, false, enter == 1);
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		WriteD(s.id);
		WriteC(enter);
		WriteH(r.getMaskSlotBattle(false, false, false));
		if (r.isRoundMap() || r.isDino(2))
		{
			WriteH(r.teamRound(0));
			WriteH(r.teamRound(1));
			if (r.isGhostMode(0))
				WriteH(r.getMaskSlotBattle(true, false, false));
			else
			{
				if (r.type == ModesEnum.SABOTAGEM || r.type == ModesEnum.DEFESA)
				{
					WriteH(r.bar1);
					WriteH(r.bar2);
				    for (int i = 0; i < 16; i++)
				    	WriteH(r.getRoomSlot(i).bar1);
				    if (r.type == ModesEnum.DEFESA)
				    	for (int i = 0; i < 16; i++)
				    		WriteH(r.getRoomSlot(i).bar2);
				}
				else if (r.isDino(2))
				{
					List<Integer> pL = EssencialUtil.gI().DINOSSAUROS(r, r.dinossaur());
					WriteC(0); //r.dinossaur()
					WriteH(0); //r.getMaskSlotBattle(false, false, false)
					WriteC((pL.size() == 1 || r.isDino(0)) ? 0xFF : r.rexDino);
					for (int slot : pL)
						if (slot != r.rexDino && r.isDino(1) || r.isDino(0))
							WriteC(slot);
					for (int i = 0; i < (7 - pL.size()); i++)
						WriteC(0xFF);
					WriteC(0xFF);
					WriteC(0xFF);
					WriteC(0xFF);
					WriteC(37); //89
					pL = null;
				}
			}
		}
	}
}