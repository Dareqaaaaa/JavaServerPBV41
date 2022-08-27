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

import core.udp.UDP_PosRotation;

public class FragInfos
{
	public int index; //victimIdx
	public int count;
	public int slot;
	public int weapon;
	public int flag;
	public UDP_PosRotation position;
	public List<Frag> frags = new ArrayList<Frag>(16);
	public FragInfos()
	{
	}
	public boolean massKill()
	{
		return weapon == 100016001 || weapon == 100016002 || weapon == 100016003 || weapon == 2000016001 || getWeapon() == 4000 || getWeapon() == 8030 || getWeapon() == 9040;
	}
	public boolean acidDino()
	{
		return weapon != 19016 && weapon != 19022;
	}
	public int getWeapon()
	{
		return weapon / 100000;
	}
}