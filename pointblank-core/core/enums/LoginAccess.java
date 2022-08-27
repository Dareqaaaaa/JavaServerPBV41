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

public enum LoginAccess
{
	SUCESSO(1),
	CRASHED(0xFF),
	EVENT_ERROR_LOGIN(0x80000100), //Erro ao logar
	EVENT_ERROR_EVENT_LOG_IN_ALEADY_LOGIN(0x80000101), //Usuário conectado
	EVENT_ERROR_EVENT_LOG_IN_INVALID_ACCOUNT(0x80000102), //Conta inválida
	EVENT_ERROR_LOGIN_BREAK_SESSION(0x80000103),
	EVENT_ERROR_EVENT_LOGOUTING(0x80000104),
	EVENT_ERROR_EVENT_LOG_IN_TIME_OUT1(0x80000105),
	EVENT_ERROR_EVENT_LOG_IN_TIME_OUT2(0x80000106),
	EVENT_ERROR_EVENT_LOG_IN_BLOCK_ACCOUNT(0x80000107), //Conta bloqueada
	EVENT_ERROR_EVENT_LOG_IN_UNKNOWN(0x80000108),
	EVENT_ERROR_EVENT_LOG_IN_PACKET(0x80000109),
	EVENT_ERROR_EVENT_LOG_IN_MD5(0x8000010A), //MD5
	EVENT_ERROR_EVENT_LOG_IN_HTTP(0x8000010B), //Http error
	EVENT_ERROR_EVENT_LOG_IN_SYS(0x8000010C), //Http error
	EVENT_ERROR_EVENT_LOG_IN_MAXUSER(0x8000010E), //Limite de jogadores
	EVENT_ERROR_EVENT_LOG_IN_REGION_BLOCKED(0x80000121); //Região bloqueada
	public int value;
	LoginAccess(int value)
	{
		this.value = value;
	}
	public static LoginAccess valueOf(int value)
	{
		for (LoginAccess la : values())
			if (la.value == value)
				return la;
		return CRASHED;
	}
}