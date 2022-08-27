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
import game.thread.*;

public class BATTLE_TIMERSYNC_REQ extends game.network.protocol.GamePacketREQ
{
	protected Room room;
	protected Player player;
	public BATTLE_TIMERSYNC_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		room = client.getRoom();
		player = client.getPlayer();
		if (room != null && player != null)
		{
			if (room.getSlotState(room.LIDER).ordinal() == 13)
			{
				room.timeLost = ReadD(); //4294967285-0
				ReadC();
				ReadC();
				ReadH();
				ReadC();
				ReadC();
			}
		}
	}
	@Override
	public void runImpl()
	{
		if (room != null && player != null)
		{
			if (room.isDino(1))
				sendPacket(new BATTLE_DINO_PLACAR_ACK(room));
			if (room.timeLost < 1 && room.LIDER == player.id)
				endRound();
		}
	}
	public void endRound()
	{
		if (room.rstate == RoomState.BATTLE)
		{
			if (room.rodadas == 1 && room.isDino(2))
			{
				room.rodadas = 2;
				room.threadCROSS = null;
				for (int i = 0; i < 16; i++)
                {
					RoomSlot s = room.getRoomSlot(i);
					s.killMessage = FragValues.NONE;
					s.lastKillState = 0;
					s.oneTimeKills = 0;
					s.repeatLastState = false;
					s.espectador = false;
					s.bar1 = 0;
					s.bar2 = 0;
					s.dinoOnLife = 0;
					s.util = 0;
					s.death = false;
                }
				int win = room.timeVencedor(); //2
				for (int i = 0; i < 16; i++)
				{
					Player pR = room.getPlayerBySlot(i);
					RoomSlot s = room.getRoomSlot(i);
					if (pR != null && s.state == SlotState.BATTLE)
						pR.connection.sendPacket(new BATTLE_MISSION_ROUND_END_ACK(room, TimeEnum.values()[win], WinnerRound.TIMEOUT));
				}
				room.crossStart(new CrossCounterTH(), 1, 7350);
				return;
			}
			else if (room.type == ModesEnum.DESTRUICAO || room.type == ModesEnum.SABOTAGEM || room.type == ModesEnum.SUPRESSAO || room.type == ModesEnum.DEFESA || room.type == ModesEnum.ESCOLTA)
			{
				TimeEnum winner = TimeEnum.TIME_AZUL;
				if (room.type != ModesEnum.SABOTAGEM)
					winner = TimeEnum.TIME_AZUL;
				else
				{
					if (room.bar1 > room.bar2)
						winner = TimeEnum.TIME_VERMELHO;
					else if (room.bar1 < room.bar2)
						winner = TimeEnum.TIME_AZUL;
				}
				room.round(winner, WinnerRound.TIMEOUT);
			}
			else
			{
				int win = room.timeVencedor();
				if (room.type == ModesEnum.DEATHMACH || room.type == ModesEnum.CAOS)
				{
					for (int i = 0; i < 16; i++)
					{
						Player pR = room.getPlayerBySlot(i);
						if (pR != null && room.getSlotState(i).ordinal() > 8)
						{
							pR.connection.sendPacket(new BATTLE_MISSION_ROUND_END_ACK(room, TimeEnum.values()[win], WinnerRound.TIMEOUT));
						}
					}
				}
				room.end(win);
			}
		}
	}
}