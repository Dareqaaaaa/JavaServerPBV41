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

public class MissionAwards
{
    public int id, blue_order, item_id, exp, gp, count;
    public MissionAwards(int id, int blue_order, int exp, int gp, int item_id, int count)
    {
        this.id = id;
        this.blue_order = blue_order;
        this.item_id = item_id;
        this.exp = exp;
        this.gp = gp;
        this.count = count;
    }
}