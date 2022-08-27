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

package core.sql;

import java.sql.*;

import core.jdbc.*;
import core.models.*;

@DaoSQL(database = "PostgresSQL")
public class AccountSQL extends InterfaceSQL
{
	protected static final AccountSQL INSTANCE = new AccountSQL();
	public AccountSQL()
	{
	}
	public static AccountSQL gI()
	{
		return INSTANCE;
	}
	public int sizeAccountsByIp(String ip)
	{
		int value = 0;
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try
		{
			con = DatabaseFactory.gI().newConnection();
			statement = con.prepareStatement("SELECT id FROM contas WHERE ip = ?");
			statement.setString(1, ip);
			rs = statement.executeQuery();
			while (rs.next())
				value++;
		}
		catch (SQLException e)
		{
			error(getClass(), e);
		}
		finally
		{
			DatabaseFactory.gI().closeConnection(con, statement, rs);
		}
		return value;
	}
	public boolean CONTA_EXISTENTE(String login)
	{
		return PlayerSQL.gI().queryExist("SELECT id FROM contas WHERE login='" + login + "'");
	}
	public boolean CONTA_BANIDA(String ip, String mac)
	{
		return PlayerSQL.gI().queryExist("SELECT * FROM system_blocked WHERE ip='" + ip + "' OR mac='" + mac + "'");
	}
	public void CRIAR(Account account)
	{
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try
		{
			con = DatabaseFactory.gI().newConnection();
			statement = con.prepareStatement("INSERT INTO contas(login, senha, ip, mac, last_access, client_version, ban_expires, userfilelist, launcher_key, email, bans, hwid, actived) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, account.login);
			statement.setString(2, account.senha);
			statement.setString(3, account.ip);
			statement.setString(4, account.mac);
			statement.setString(5, account.data);
			statement.setString(6, account.client);
			statement.setInt(7, account.ban_expires);
			statement.setString(8, account.userfilelist);
			statement.setLong(9, account.launcher_key);
			statement.setString(10, account.email);
			statement.setInt(11, account.bans);
			statement.setString(12, account.hwid);
			statement.setBoolean(13, account.actived);
			statement.executeUpdate();
			rs = statement.getGeneratedKeys();
			rs.next();
			account.id = (long)rs.getObject("id");
		} 
		catch (SQLException e)
		{
			error(getClass(), e);
		}
		finally
		{
			DatabaseFactory.gI().closeConnection(con, statement, rs);
		}
	}
	public Account CARREGAR(long id)
	{
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		Account account = null;
		try
		{
			con = DatabaseFactory.gI().newConnection();
			statement = con.prepareStatement("SELECT * FROM contas WHERE id=?");
			statement.setLong(1, id);
			rs = statement.executeQuery();
			if (rs.next())
			{
				account = new Account(rs.getString("login"), rs.getString("senha"));
				account.id = rs.getLong("id");
				account.ip = rs.getString("ip");
				account.mac = rs.getString("mac");
				account.data = rs.getString("last_access");
				account.client = rs.getString("client_version");
				account.ban_expires = rs.getInt("ban_expires");
				account.userfilelist = rs.getString("userfilelist");
				account.launcher_key = rs.getLong("launcher_key");
				account.email = rs.getString("email");
				account.bans = rs.getInt("bans");
				account.hwid = rs.getString("hwid");
				account.actived = rs.getBoolean("actived");
			}
		}
		catch (SQLException e)
		{
			error(getClass(), e);
		}
		finally
		{
			DatabaseFactory.gI().closeConnection(con, statement, rs);
		}
		return account;
	}
	public Account CARREGAR_PER_INFO(String login, String senha)
	{
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		long id = 0;
		try
		{
			con = DatabaseFactory.gI().newConnection();
			statement = con.prepareStatement("SELECT id FROM contas WHERE login=? AND senha=?");
			statement.setString(1, login);
			statement.setString(2, senha);
			rs = statement.executeQuery();
			if (rs.next())
				id = rs.getLong("id");
		}
		catch (SQLException e)
		{
			error(getClass(), e);
		}
		finally
		{
			DatabaseFactory.gI().closeConnection(con, statement, rs);
		}
		return CARREGAR(id);
	}
	public void ATUALIZAR(Account account)
	{
		if (account == null)
			return;
		Connection con = null;
		PreparedStatement statement = null;
		try
		{
			con = DatabaseFactory.gI().newConnection();
			statement = con.prepareStatement("UPDATE contas SET login=?, senha=?, ip=?, mac=?, last_access=?, client_version=?, ban_expires=?, userfilelist=?, launcher_key=?, email=?, bans=?, hwid=?, actived=? WHERE id = '" + account.id + "'");
			statement.setString(1, account.login);
			statement.setString(2, account.senha);
			statement.setString(3, account.ip);
			statement.setString(4, account.mac);
			statement.setString(5, account.data);
			statement.setString(6, account.client);
			statement.setInt(7, account.ban_expires);
			statement.setString(8, account.userfilelist);
			statement.setLong(9, account.launcher_key);
			statement.setString(10, account.email);
			statement.setInt(11, account.bans);
			statement.setString(12, account.hwid);
			statement.setBoolean(13, account.actived);
			statement.executeUpdate();
		} 
		catch (SQLException e)
		{
			error(getClass(), e);
		}
		finally
		{
			DatabaseFactory.gI().closeConnection(con, statement, null);
		}
	}
}