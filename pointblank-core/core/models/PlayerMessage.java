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
import core.utils.*;

public class PlayerMessage
{
	public long player_id, owner_id;
	public int object, expirate, dias;
	public boolean special;
	public String name, owner_name, texto;
	public NoteType type;
	public ReadType readed;
	public NoteReceive receive;
	public PlayerMessage(long player_id, long owner_id, int dias, NoteType type, NoteReceive receive, boolean special)
	{
		this.player_id = player_id;
		this.owner_id = owner_id;
		this.dias = dias;
		this.type = type;
		this.receive = receive;
		this.special = special;
		readed = ReadType.NAO_VISUALIZADO;
		expirate = DateTimeUtil.gI().getDateTimeK(dias);
	}
}