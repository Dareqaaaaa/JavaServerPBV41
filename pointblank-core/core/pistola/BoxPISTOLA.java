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
import java.util.concurrent.*;

import core.models.*;
import core.utils.*;

public class BoxPISTOLA extends BinaryEncrypt
{
	protected static final BoxPISTOLA INSTANCE = new BoxPISTOLA();
	public ConcurrentHashMap<Integer, RandomBox> randomBox = new ConcurrentHashMap<Integer, RandomBox>();
	public BoxPISTOLA()
	{
		super("data/package/random.pistola");
		try
		{ Load(); }
		catch (IOException e)
		{ e.printStackTrace(); }
	}
	public static BoxPISTOLA gI()
	{
		return INSTANCE;
	}
	void Load() throws FileNotFoundException, IOException
	{
		int sizeBox = br.ReadD();
		for (int i = 0; i < sizeBox; i++)
		{
			RandomBox r = new RandomBox();
			r.id = br.ReadD();
			r.total = br.ReadD();
			r.probability = br.ReadD();
			int sizeItems = br.ReadD();
			for (int j = 0; j < sizeItems; j++)
			{
				RandomBoxReward b = new RandomBoxReward();
				b.random = br.ReadD();
				b.item_id = br.ReadD();
				b.count = br.ReadD();
				b.equip = br.ReadD();
				b.percent = br.ReadD();
				b.jackpot = br.ReadD() == 1;
				r.items.add(b);
			}
			randomBox.put(r.id, r);
		}
		close();
	}
}