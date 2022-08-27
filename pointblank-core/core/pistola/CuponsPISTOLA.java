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

public class CuponsPISTOLA extends BinaryEncrypt
{
	protected static final CuponsPISTOLA INSTANCE = new CuponsPISTOLA();
	protected ConcurrentHashMap<Integer, Coupon> coupons = new ConcurrentHashMap<Integer, Coupon>();
	public CuponsPISTOLA()
	{
		super("data/package/cupons.pistola");
		try
		{ Load(); }
		catch (IOException e)
		{ e.printStackTrace(); }
	}
	public static CuponsPISTOLA gI()
	{
		return INSTANCE;
	}
	void Load() throws FileNotFoundException, IOException
	{
		int sizeCoupon = br.ReadD();
		for (int i = 0; i < sizeCoupon; i++)
		{
			Coupon c = new Coupon();
			c.id = br.ReadD();
			c.type = br.ReadD();
			c.list = br.ReadD();
			c.value = br.ReadD();
			coupons.put(c.id, c);
		}
		close();
	}
	public int couponCalcule(Player p, int list)
	{
		int valor = 0;
		if (p != null)
		{
			for (Coupon cp : coupons.values())
			{
				if (cp.type == 1 && cp.list == list)
				{
					if (p.buscarEquipPeloItemId(cp.id) == 2)
					{
						if (!p.quarent.containsKey(cp.id))
							valor += cp.value;
					}
				}
			}
		}
		return valor;
	}
	public Coupon get(int item_id)
	{
		if (coupons.containsKey(item_id))
			return coupons.get(item_id);
		else
			return null;
	}
}