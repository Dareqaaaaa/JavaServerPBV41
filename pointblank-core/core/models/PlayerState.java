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

public class PlayerState
{
	public boolean inRoom = false;
	public boolean inChannel = false;
	public int room_id = 0;
	public int channel_id = 0;
	public int server_id = 0;
	public int clan_fronto = 0;
	public CommState state = CommState.OFFLINE;
	public PlayerState(int room_id, int channel_id, int server_id)
	{
		this.room_id = room_id;
		this.channel_id = channel_id;
		this.server_id = server_id;
	}
}