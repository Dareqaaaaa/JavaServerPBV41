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

package game.network.protocol;

public enum BattlePacketIdACK
{
	REQUEST_BATTLE_CONNECTION_ACK(1),
	REQUEST_REGISTER_ROOM_ACK(16),
	REQUEST_UNREGISTER_ROOM_ACK(17),
	REQUEST_ADD_PLAYER_ACK(18),
	REQUEST_REMOVE_PLAYER_ACK(19),
	REQUEST_CHANGE_HOST_ACK(20),
	REQUEST_PRESTART_PLAYER_ACK(21);
	public int id;
	BattlePacketIdACK(int id)
	{
		this.id = id;
	}
	public static int getOpcode(String packet)
	{
		BattlePacketIdACK p = valueOf(packet);
		return p != null ? p.id : 0;
	}
}