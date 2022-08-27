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

package core.enums;

public enum FriendState
{
	ERROR_EVENT_FRIEND_INFO_PARAMETER_USER(0x80001035),
	ERROR_EVENT_FRIEND_INFO_QUERY(0x80001036),
	EVENT_ERROR_EVENT_FRIEND_INSERT_PARAMETER_USER(0x80001037),
	EVENT_ERROR_EVENT_FRIEND_INSERT_FULL(0x80001038),
	EVENT_ERROR_EVENT_FRIEND_INSERT_QUERY(0x80001039),
	EVENT_ERROR_EVENT_FRIEND_ACCEPT_PARAMETER_USER(0x8000103A),
	EVENT_ERROR_EVENT_FRIEND_ACCEPT_PARAMETER_IDX(0x8000103B),
	EVENT_ERROR_EVENT_FRIEND_ACCEPT_QUERY(0x8000103C),
	EVENT_ERROR_EVENT_FRIEND_INVITED_PARAMETER_USER(0x8000103D),
	EVENT_ERROR_EVENT_FRIEND_INVITED_PARAMETER_IDX(0x8000103E),
	EVENT_ERROR_EVENT_FRIEND_INVITED_NOT_CONNECTED(0x8000103F),
	EVENT_ERROR_EVENT_FRIEND_INVITED_NOT_MATCHED(0x80001040),
	EVENT_ERROR_EVENT_FRIEND_INSERT_ALREADY_FRIEND(0x80001041),
	EVENT_ERROR_EVENT_FRIEND_INSERT_NOT_FIND_NICK(0x80001042),
	EVENT_ERROR_INVITE(0x80001039),
	FRIEND_STATE_REQUEST(0),
	FRIEND_STATE_HOLD(1),
	FRIEND_STATE_OFFLINE(2),
	FRIEND_STATE_ONLINE(3),
	FRIEND_STATE_ROOM(4),
	FRIEND_STATE_MAX(5),
	INSERIR(1),
	ACEITAR(2),
	REMOVER(3),
	ATUALIZAR(4);
	public int value;
	FriendState(int value)
	{
		this.value = value;
	}
}