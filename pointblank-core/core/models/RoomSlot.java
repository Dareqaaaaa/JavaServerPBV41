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
import java.util.concurrent.*;

import core.enums.*;

public class RoomSlot implements Cloneable
{
    public SlotState state = SlotState.EMPTY;
    public int id,
    		allKills,
    		oneTimeKills,
    		allDeaths,
    		score,
    		allHeadshots,
    		lastKillState,
    		gold,
    		exp,
    		cash,
    		gold_bonus,
    		exp_bonus,
    		tag,
    		objetivo,
    		bar1,
    		bar2,
    		respawn,
    		dinoOnLife,
    		util,
    		ping,
    		piercing_shot,
    		missionActiveCompleted = -1;
	public boolean repeatLastState = false,
			death = false,
			espectador = false,
			checked = false,
			isUp = false,
			updateBrooch = false,
			updateInsignia = false,
			updateMedal = false,
			updateBlueOrder = false,
			missionClear = false,
			battleAccept = false;
	public FragValues killMessage = FragValues.NONE;
	public int lastFrag;
    public long player_id;
    public PlayerEquipment equipment = new PlayerEquipment();
    public PlayerEquipment padrao = new PlayerEquipment();
    public PlayerInventory invent = new PlayerInventory();
	public ConcurrentHashMap<Integer, MissionUpdate> missions = new ConcurrentHashMap<Integer, MissionUpdate>();
	public ConcurrentHashMap<Long, Player> armasUsadas = new ConcurrentHashMap<Long, Player>(); 
	public List<PlayerInventory> armasExcluir = new ArrayList<PlayerInventory>();
	public RoomSlot newSlot, oldSlot;
	public RoomSlot(RoomSlot newSlot, RoomSlot oldSlot)
	{
		this.newSlot = newSlot;
		this.oldSlot = oldSlot;
	}
	public RoomSlot(int id, long player_id, SlotState state)
	{
		this.id = id;
		this.player_id = player_id;
		this.state = state;
	}
	@Override
	public RoomSlot clone()
	{
		try
		{
			return (RoomSlot) super.clone();
		}
		catch (CloneNotSupportedException e)
		{
			return null;
		}
	}
}