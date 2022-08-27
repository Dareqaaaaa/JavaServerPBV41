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

import core.enums.*;
import core.models.*;
import core.utils.*;

public class SetsPISTOLA extends BinaryEncrypt
{
	protected static final SetsPISTOLA INSTANCE = new SetsPISTOLA();
	public List<Good> sets = new ArrayList<Good>();
	public SetsPISTOLA()
	{
		super("data/package/sets.pistola");
		try
		{ Load(); }
		catch (IOException e)
		{ e.printStackTrace(); }
	}
	public static SetsPISTOLA gI()
	{
		return INSTANCE;
	}
	void Load() throws FileNotFoundException, IOException
	{
		int sizeSets = br.ReadD();
		for (int i = 0; i < sizeSets; i++)
		{
			Good g = new Good();
			g.id = br.ReadD();
			int type = br.ReadD();
			int value = br.ReadD();
			if (type == 1)
				g.bonusGold = value;
			else
				g.item_id = value;
			g.gold = br.ReadD();
			g.cash = br.ReadD();
			g.count = br.ReadD();
			g.tag = ShopTag.values()[br.ReadD()];
			g.show = br.ReadD() == 1;
			g.set = true;
			sets.add(g);
		}
		close();
	}
}