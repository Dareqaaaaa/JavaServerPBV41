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

import java.util.*;

public class TitleV
{
	public int id;
	public int pos;
	public int pos_v;
	public int medals;
	public int brooch;
	public int blue_order;
	public int insignia;
	public int rank;
	public int slot;
	public int reqT1;
	public int reqT2;
	public List<PlayerInventory> rewards = new ArrayList<PlayerInventory>();
	public TitleV()
	{
	}
}