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

public enum MessageState
{
	NOTE_MESSAGE_CLAN_INVITE(0),
	NOTE_MESSAGE_CLAN_INVITE_ACCEPT(1),
	NOTE_MESSAGE_CLAN_INVITE_DENIAL(2),
	NOTE_MESSAGE_CLAN_JOIN_ACCEPT(3),
	NOTE_MESSAGE_CLAN_JOIN_DENIAL(4),
	NOTE_MESSAGE_CLAN_SECESSION(5),
	NOTE_MESSAGE_CLAN_DEPORTATION(6),
	NOTE_MESSAGE_CLAN_MASTER(7),
	NOTE_MESSAGE_CLAN_STAFF(8),
	NOTE_MESSAGE_CLAN_REGULAR(9),
	EVENT_RECEIVE_CLAN_NOTE(0x80003001),
	EVENT_ERROR_NOTE_SEND_UKNOWN_NICK(0x8000107E),
	EVENT_ERROR_NOTE_SEND_BOX_FULL(0x8000107F),
	EVENT_ERROR_NOTE_SEND_SELF(0x80001080),
	EVENT_ERROR_NOTE_SEND_DAILY_LIMIT(0x80001081),
	EVENT_ERROR_CLAN_NOSEARCH_CLANIDX(0x8000105B),
	SUCESSO(0),
	ERRO(0x80000000);
	public int value;
	MessageState(int value)
	{
		this.value = value;
	}
}