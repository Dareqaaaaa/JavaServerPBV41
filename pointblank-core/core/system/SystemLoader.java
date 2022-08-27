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

package core.system;

import java.io.*;
import java.util.*;

public abstract class SystemLoader 
{
	protected static final Properties PROPERTIES = new Properties();
	public String fileName;
	protected SystemLoader(String file)
	{
		fileName = file;
		LOAD();
	}
	public void LOAD()
	{
		try
		{
			FileReader fr = new FileReader(fileName);
			BufferedReader br = new BufferedReader(fr);
			PROPERTIES.load(br);
			fr.close();
			br.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.err.flush();
		}
	}
	public boolean ReadL(String key)
	{
		return Boolean.valueOf(PROPERTIES.getProperty(key));
	}
	public int ReadD(String key)
	{
		String pro = PROPERTIES.getProperty(key);
		if (pro.equals("-1"))
			return -1;
		return Integer.valueOf(pro);
	}
	public long ReadQ(String key)
	{
		return Long.valueOf(PROPERTIES.getProperty(key));
	}
	public String ReadT(String section, String var, String def)
	{
		return PROPERTIES.getProperty(section + '.' + var, def);
	}
	public String ReadS(String key)
	{
		return PROPERTIES.getProperty(key);
	}
}