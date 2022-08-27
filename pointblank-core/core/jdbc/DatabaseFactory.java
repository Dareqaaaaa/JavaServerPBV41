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

package core.jdbc;

import java.sql.*;

import org.apache.commons.dbcp.*;

import core.system.*;

public class DatabaseFactory extends core.sql.InterfaceSQL
{
	protected static final DatabaseFactory INSTANCE = new DatabaseFactory();
	protected volatile BasicDataSource dataSource;
	public static DatabaseFactory gI()
	{
		return INSTANCE;
	}
	private DatabaseFactory()
	{
		try
		{
			createConnection();
		}
		catch (SQLException e)
		{
			error(getClass(), e);
		}
	}
	private void createConnection() throws SQLException
	{
		ConfigurationLoader c = ConfigurationLoader.gI();
		dataSource = new BasicDataSource();
		dataSource.setDriverClassName(c.driver);
		dataSource.setUsername(c.username);
		dataSource.setPassword(c.password);
		dataSource.setUrl(c.url);
		dataSource.setMaxActive(c.maxActive); //setMaxTotal
		dataSource.setMaxIdle(c.maxIdle);
		dataSource.setValidationQuery(c.validationQuery);
	}
	public Connection newConnection() throws SQLException
	{
		return dataSource.getConnection();
	}
	public void closeConnection(Connection conn, Statement stmt, ResultSet rs)
	{
		try
		{
			if (rs != null)
			{
				rs.close();
				rs = null;
			}
			if (stmt != null)
			{
				//stmt.cancel();
				stmt.close();
				stmt = null;
			}
			if (conn != null)
			{
				conn.close();
				conn = null;
			}
		}
		catch (SQLException e)
		{
			error(getClass(), e);
		}
	}
	public void shutdown() throws Exception
	{
		dataSource.close();
	}
}