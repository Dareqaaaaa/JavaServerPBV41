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

public class RankInfo
{
	public int id;
	public int onNextLevel;
    public int rank;
    public int onGPUp;
    public int onCPUP;
    public int onAllExp;
    public List<PlayerInventory> rewards = new ArrayList<PlayerInventory>();
    public List<Integer> gifts = new ArrayList<Integer>(4);
    public RankInfo(int id)
    {
    	this.id = id;
    }
    public void set()
    {
    	for (PlayerInventory item : rewards)
    		gifts.add(item.item_id);
    	for (int i = 0; i < (4 - gifts.size()); i++)
    		gifts.add(0);
    }
}