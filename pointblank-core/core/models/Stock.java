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

public class Stock implements Cloneable
{
	public int id;
	public int item_id;
	public int tipo1;
	public int tipo2;
	public int tipo3;
	public int titulo;
	public Stock()
	{
	}
	@Override
	public Stock clone()
	{
		try
		{
			return (Stock) super.clone();
		}
		catch (CloneNotSupportedException e)
		{
		}
		return null;
	}
}