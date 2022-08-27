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

public class PlayerTitles
{
    public int[] title = new int[45];
    public int pos1, pos2, pos3, pos4, pos5, pos6, pos7, pos8;
    public int equip1, equip2, equip3;
    public int slot = 1;
    public PlayerTitles()
    {
		for (int i = 0; i < title.length; i++)
			title[i] = 0;
		title[0] = 1;
    }
}