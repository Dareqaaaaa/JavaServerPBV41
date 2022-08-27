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

public class TitlesPISTOLA extends BinaryEncrypt
{
	protected static final TitlesPISTOLA INSTANCE = new TitlesPISTOLA();
	public List<TitleV> titles = new ArrayList<TitleV>();
	public TitlesPISTOLA()
	{
		super("data/package/titles.pistola");
		try
		{ Load(); }
		catch (IOException e)
		{ e.printStackTrace(); }
	}
	public static TitlesPISTOLA gI()
	{
		return INSTANCE;
	}
	void Load() throws FileNotFoundException, IOException
	{
		int sizeTitles = br.ReadD();
		for (int i = 0; i < sizeTitles; i++)
		{
			TitleV t = new TitleV();
			t.id = br.ReadD();
    		t.pos = br.ReadD();
    		t.pos_v = br.ReadD();
    		t.brooch = br.ReadD();
    		t.insignia = br.ReadD();
    		t.medals = br.ReadD();
    		t.blue_order = br.ReadD();
    		t.rank = br.ReadD();
    		t.slot = br.ReadD();
    		t.reqT1 = br.ReadD();
    		t.reqT2 = br.ReadD();
    		int sizeRewards = br.ReadD();
    		for (int j = 0; j < sizeRewards; j++)
    			t.rewards.add(new PlayerInventory(0, br.ReadD(), br.ReadD(), br.ReadD()));
    		titles.add(t);
		}
		close();
	}
	public void Calcule(Player p)
	{
		for (int i = 1; i < p.title.title.length; i++)
		{
			if (p.title.title[i] == 1)
			{
				TitleV t = titles.get(i);
				if (t != null)
				{
					if (t.pos == 1) p.title.pos1 += t.pos_v;
					else if (t.pos == 2) p.title.pos2 += t.pos_v;
					else if (t.pos == 3) p.title.pos3 += t.pos_v;
					else if (t.pos == 4) p.title.pos4 += t.pos_v;
					else if (t.pos == 5) p.title.pos5 += t.pos_v;
					else if (t.pos == 6) p.title.pos6 += t.pos_v;
					else if (t.pos == 7) p.title.pos7 += t.pos_v;
					else if (t.pos == 8) p.title.pos8 += t.pos_v;
				}
			}
		}
	}
}