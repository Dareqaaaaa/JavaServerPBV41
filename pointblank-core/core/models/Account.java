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

import core.network.*;

public class Account
{
	public long id;
	public long launcher_key;
	public String login;
	public String senha;
	public String email;
	public String ip;
	public String mac;
	public String data;
	public String client;
	public String userfilelist;
	public String hwid = "";
	public int ban_expires;
	public int bans;
	public boolean actived = true;
	public Connection connection;
	public Account(String login, String senha)
	{
		this.login = login;
		this.senha = senha;
		email = String.valueOf(login + "@pointblank");
	}
}