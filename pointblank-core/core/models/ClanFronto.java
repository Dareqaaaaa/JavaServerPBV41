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

package core.models;

import core.enums.*;

public class ClanFronto
{
	public int id;
	public int formacao;
	public int clan_id;
	public int channel_id;
	public int server_id;
	public long lider;
	public RoomSlot[] SLOT = new RoomSlot[8];
	public RoomClanState cstate = RoomClanState.CLAN_ROOM_STAY;
	public ClanFronto(int id, int formacao, int clan_id, int channel_id, int server_id, long lider)
	{
		this.id = id;
		this.formacao = formacao;
		this.clan_id = clan_id;
		this.channel_id = channel_id;
		this.server_id = server_id;
		this.lider = lider;
		for (int i = 0; i < 8; i++)
			SLOT[i] = new RoomSlot(i, 0, SlotState.EMPTY);
	}
	public int ADICIONAR_JOGADOR(long pId)
	{
		for (int i = 0; i < 8; i++)
		{
			RoomSlot s = SLOT[i];
			if (s.player_id == 0 && s.state == SlotState.EMPTY)
			{
				s.player_id = pId;
				s.state = SlotState.NORMAL;
				return i;
			}
		}
		return -1;
	}
	public void REMOVER_JOGADOR(int slot)
	{
		RoomSlot s = BUSCAR_SLOT(slot);
		if (s != null)
		{
			s.player_id = 0;
			s.state = SlotState.EMPTY;
		}
	}
	public RoomSlot BUSCAR_SLOT(int slot)
	{
		if (slot >= 0)
			return SLOT[slot];
		else
			return null;
	}
	public int PLAYERS()
	{
		int total = 0;
		for (RoomSlot s : SLOT)
			if (s.player_id > 0)
				total++;
		return total;
	}
}