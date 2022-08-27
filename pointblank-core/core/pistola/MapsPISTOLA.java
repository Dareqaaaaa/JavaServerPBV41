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

package core.pistola;

import java.io.*;
import java.util.*;

import core.models.*;
import core.utils.*;

public class MapsPISTOLA extends BinaryEncrypt
{
	protected static final MapsPISTOLA INSTANCE = new MapsPISTOLA();
	public List<Maps> maps = new ArrayList<Maps>();
    public int mapList1, mapList2, mapList3, mapList4, mapList5, mapList6, mapList7, mapList8, mapList9;
	public MapsPISTOLA()
	{
		super("data/package/maps.pistola");
		try
		{ Load(); }
		catch (IOException e)
		{ e.printStackTrace(); }
	}
	public static MapsPISTOLA gI()
	{
		return INSTANCE;
	}
	void Load() throws FileNotFoundException, IOException
	{
		int sizeMap = br.ReadD();
		for (int i = 0; i < sizeMap; i++)
		{
			Maps map = new Maps();
			map.id = br.ReadD();
			maps.add(map);
		}
		for (int i = 0; i < sizeMap; i++)
		{
			Maps map = maps.get(i);
			map.list = br.ReadD();
		}
		for (int i = 0; i < sizeMap; i++)
		{
			Maps map = maps.get(i);
			map.mode = br.ReadH();
		}
		for (int i = 0; i < sizeMap; i++)
		{
			Maps map = maps.get(i);
			map.tag = br.ReadC();
		}
		mapList1 = br.ReadD();
		mapList2 = br.ReadD();
		mapList3 = br.ReadD();
		mapList4 = br.ReadD();
		mapList5 = br.ReadD();
		mapList6 = br.ReadD();
		mapList7 = br.ReadD();
		mapList8 = br.ReadD();
		mapList9 = br.ReadD();
		close();
	}
}