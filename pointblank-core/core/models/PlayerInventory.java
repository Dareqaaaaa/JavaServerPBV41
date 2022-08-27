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

public class PlayerInventory
{
	public long object;
	public Integer item_id;
	public Integer count;
	public int equip;
	public int slot;
	public int effect;
	public int cupon_id;
	public int rank;
	public int template;
	public boolean starter, full = false;
	public PlayerInventory(long object, Integer item_id, int count, int equip)
	{
		this.object = object;
		this.item_id = item_id;
		this.count = count;
		this.equip = equip;
		slot = readSlot(item_id);
	}
	public PlayerInventory()
	{
	}
	public int readSlot(int id)
    {
        if (id < 600000000)
        	return 1;
        if (id < 700000000 && id > 600000000)
        	return 2;
        if (id < 800000000 && id > 700000000)
        	return 3;
        if (id < 900000000 && id > 800000000)
        	return 4;
        if (id < 1000000000 && id > 900000000)
        	return 5;
        if (id < 1001002000 && id > 1001001000)
        	return 6;
        if (id < 1001003000 && id > 1001002000)
        	return 7;
        if (id < 1104004000 && id > 1104003000 || id < 1105004000 && id > 1105003000 || id < 1102004000 && id > 1102003000)
        	return 8;
        if (id < 1006004000 && id > 1006001000)
        	return 9;
        if (id < 1103004000 && id > 1103003000)
        	return 10;
        return 11;
    }
}