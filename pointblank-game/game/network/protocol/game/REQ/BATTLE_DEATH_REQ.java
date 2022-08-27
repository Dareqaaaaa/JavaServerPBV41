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

package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import core.udp.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class BATTLE_DEATH_REQ extends game.network.protocol.GamePacketREQ
{
	protected FragInfos kills;
	protected Player player;
	protected Room room;
	protected boolean dead, suicidio;
	public BATTLE_DEATH_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		player = client.getPlayer();
		room = client.getRoom();
		if (room == null || player == null)
			return;
		if (room.rstate.ordinal() < 5)
			return;
		int leader = room._getMaster();
		kills = new FragInfos();
		kills.index = ReadC();
        kills.count = ReadC();
        kills.slot = ReadC();
        kills.weapon = ReadD();
		kills.position = new UDP_PosRotation(ReadU(), ReadU(), ReadU(), ReadU(), ReadU(), ReadU());
        kills.flag = ReadC(); //0xff
        boolean really = room.getSlotState(kills.slot).ordinal() == 13 && kills.position != null;
        if ((room.special == 6 || room.special == 9) && kills.position != null)
        	if (leader % 2 != kills.slot % 2)
        		really = true;
        if (really)
        {
	    	for (int i = 1; i <= kills.count; i++)
			{
				Frag frag = new Frag();
	            frag.index = ReadC();
	            frag.hits = ReadC();
	            ReadH(); //0
	            frag.position = new UDP_PosRotation(ReadU(), ReadU(), ReadU(), ReadU(), ReadU(), ReadU());
	            frag.flag = ReadC(); //0xff
				if (frag.getDeatSlot() == kills.slot)
				{
					dead = true;
					if (kills.count < 3)
						suicidio = true;
				}
				really = room.getSlotState(frag.getDeatSlot()).ordinal() == 13 && frag.position != null;
				 if ((room.special == 6 || room.special == 9) && frag.position != null)
		        	if (leader % 2 != frag.getDeatSlot() % 2)
		        		really = true;
				if (really)
					kills.frags.add(frag);
	        }
        }
	}
	@Override
	public void runImpl()
	{
		synchronized (this)
		{
			if (room == null || player == null || kills.frags.isEmpty())
				return;
			RoomSlot killer = room.getRoomSlot(kills.slot);
			if (killer != null && (!killer.espectador && player.espectador == 0 || player.espectador == 1))
			{
				if (player.espectador == 1)
				{
					killer.killMessage = FragValues.NONE;
					killer.oneTimeKills = 0;
					killer.repeatLastState = false;
					killer.lastKillState = 0;
				}
				else
				{
					killer.killMessage = FragValues.NONE;
					int weapon = kills.weapon / 100000;
					boolean matouMais = kills.count > 1 && !suicidio;
			    	for (Frag frag : kills.frags)
					{
			    		RoomSlot death = room.getRoomSlot(frag.getDeatSlot());
			    		if (death != null)
			    		{
			    			if (frag.getDeatSlot() != kills.slot)
							{
								if (matouMais && kills.massKill())
									killer.killMessage = FragValues.MASS_KILL;
								else
								{
									int killMessage = 0;
									if ((frag.hits >> 4) == 3)
										killMessage = 4;
									else if ((frag.hits >> 4) == 1 && weapon == 7020) 
										killMessage = 6;
									if (killMessage > 0)
									{
										if ((killer.lastKillState >> 12) != killMessage)
											killer.repeatLastState = false;
										killer.lastKillState = killMessage << 12 | (killer.oneTimeKills + 1);
										if (killMessage == 4)
										{
											if (killer.repeatLastState)
												killer.killMessage = (killer.lastKillState & 15) < 2 ? FragValues.HEADSHOT : FragValues.CHAIN_HEADSHOT;
											else
											{
												killer.killMessage = FragValues.HEADSHOT;
												killer.repeatLastState = true;
											}
											if (matouMais && !kills.massKill() && weapon == 3000)
											{
												if (killer.killMessage == FragValues.HEADSHOT)
													killer.killMessage = FragValues.PIERCING_HEADSHOT;
												else if (killer.killMessage == FragValues.CHAIN_HEADSHOT)
													killer.killMessage = FragValues.PIERCING_CHAIN_HEADSHOT;
												killer.repeatLastState = true;
											}
											killer.allHeadshots++;
										}
										else if (killMessage == 6)
										{
											if (killer.lastFrag == 7020 || (killer.repeatLastState && (killer.lastKillState & 15) > 1))
											{
												killer.killMessage = FragValues.CHAIN_SLUGGER;
												killer.repeatLastState = true;
											}
											else
											{
												killer.repeatLastState = true;
											}
										}
									}
									else
									{
										if (matouMais && !kills.massKill())
											killer.killMessage = FragValues.PIERCING_SHOT;
										else
										{
											killer.lastKillState = 0;
											killer.repeatLastState = false;
										}
									}
								}
				                killer.allKills++;
				                killer.oneTimeKills++;
								if (death.oneTimeKills > 3)
									killer.killMessage = FragValues.CHAIN_STOPPER;
								if (room.special == 6 || room.special == 9)
									killer.score += (killer.oneTimeKills * room.aiLevel + getScore(killer.killMessage.ordinal(), kills.count));
								else
								{
									killer.score += (killer.oneTimeKills == 1 ? 0 : killer.oneTimeKills * 2);
									if (killer.killMessage.value == 1)
										killer.piercing_shot++;
									killer.exp += 5;
									killer.gold += 5;
									EssencialUtil.gI().MISSION_COMPLETE(room, killer, kills, false, false, false, false);
								}
							}
							else if (kills.count == 1)
							{
								killer.killMessage = FragValues.NONE;
								killer.oneTimeKills = 0;
								killer.repeatLastState = false;
								killer.lastKillState = 0;
							}
							if (death.id % 2 == 0)
							{
								room.blueKills++;
								if (room.isDino(1) && room.rodadas == 1)
									room.redDino += 5;
							}
							else
							{
								room.redKills++;
								if (room.isDino(1) && room.rodadas == 2)
									room.blueDino += 5;
							}
							if (frag.getDeatSlot() == kills.slot ? kills.acidDino() : true)
								death.allDeaths++;
							EssencialUtil.gI().MISSION_COMPLETE(room, death, new FragInfos(), true, false, false, false);
							death.death = room.isGhostMode(player.espectador);
			    		}
					}
					killer.lastFrag = weapon;
				}
			}
			int ROUND_ATUAL = room.rodadas;
	    	for (int i = 0; i < 16; i++)
	    	{
	    		Player m = room.getPlayerBySlot(i);
	    		if (m != null && room.getSlotState(i) == SlotState.BATTLE)
	    			m.connection.sendPacket(new BATTLE_DEATH_ACK(room, kills));
	    	}
			if (room.isDino(1))
			{
	            for (int i = 0; i < 16; i++)
		    	{
		    		Player m = room.getPlayerBySlot(i);
		    		if (m != null && room.getSlotState(i) == SlotState.BATTLE)
		    			m.connection.sendPacket(new BATTLE_DINO_PLACAR_ACK(room));
		    	}
			}
			else if (room.isGhostMode(0))
			{
				checking();
			}
			else
			{
				if (room.special != 6 && room.special != 9 && !room.isRoundMap() && !room.isDino(2))
				{
					for (int i : room.KILLS)
					{
				        if (room.getKillsByMask() == i)
						{
							if (room.redKills >= i || room.blueKills >= i)
							{
								room.end(-1);
								return;
							}
						}
					}
				}
			}
			if (room.isGhostMode(0))
				if (ROUND_ATUAL == room.rodadas)
					checking();
		}
		if (kills != null)
		{
			kills.frags.clear();
			kills = null;
		}
	}
	public void checking()
	{
		int mortos_red = 0, mortos_blue = 0;
		for (int i = 0; i < 16; i++)
		{
			RoomSlot s = room.getRoomSlot(i);
			if (s != null && s.death && !s.espectador && s.respawn > 0 && s.state == SlotState.BATTLE)
			{
				if (i % 2 == 0)
					mortos_red++;
				else
					mortos_blue++;
			}
		}
		if (room.bomba && dead && kills.count > 1)
		{
			if (mortos_blue >= room.getPlayingPlayers(1, true, 0))
			{
				room.round(TimeEnum.TIME_VERMELHO, WinnerRound.ALLDEATH);
				return;
			}
			else if (mortos_red >= room.getPlayingPlayers(0, true, 0))
			{
				if (!room.bomba)
					room.round(TimeEnum.TIME_AZUL, WinnerRound.ALLDEATH);
				return;
			}
		}
		if (kills.slot % 2 == 0)
		{
			if (dead && kills.count > 1)
			{
				if (mortos_blue >= room.getPlayingPlayers(1, true, 0))
				{
					room.round(TimeEnum.TIME_VERMELHO, WinnerRound.ALLDEATH);
					return;
				}
				else if (mortos_red >= room.getPlayingPlayers(0, true, 0))
				{
					if (!room.bomba)
						room.round(TimeEnum.TIME_AZUL, WinnerRound.ALLDEATH);
					return;
				}
			}
			else
			{
				if (mortos_red >= room.getPlayingPlayers(0, true, 0))
				{
					if (!room.bomba)
					{
						room.round(TimeEnum.TIME_AZUL, WinnerRound.ALLDEATH);
						return;
					}
					else if (mortos_blue >= room.getPlayingPlayers(1, true, 0))
					{
						room.round(TimeEnum.TIME_VERMELHO, WinnerRound.ALLDEATH);
						return;
					}
				}
				else if (mortos_blue >= room.getPlayingPlayers(1, true, 0))
				{
					room.round(TimeEnum.TIME_VERMELHO, WinnerRound.ALLDEATH);
					return;
				}
			}
		}
		else
		{
			if (dead && kills.count > 1)
			{
				if (mortos_red >= room.getPlayingPlayers(0, true, 0))
				{
					if (!room.bomba)
					{
						room.round(TimeEnum.TIME_AZUL, WinnerRound.ALLDEATH);
						return;
					}
					else if (mortos_blue >= room.getPlayingPlayers(1, true, 0))
					{
						room.round(TimeEnum.TIME_VERMELHO, WinnerRound.ALLDEATH);
						return;
					}
				}
				else if (mortos_blue >= room.getPlayingPlayers(1, true, 0))
				{
					room.round(TimeEnum.TIME_VERMELHO, WinnerRound.ALLDEATH);
					return;
				}
			}
			else
			{
				if (mortos_blue >= room.getPlayingPlayers(1, true, 0))
				{
					room.round(TimeEnum.TIME_VERMELHO, WinnerRound.ALLDEATH);
					return;
				}
				else if (mortos_red >= room.getPlayingPlayers(0, true, 0))
				{
					if (!room.bomba)
						room.round(TimeEnum.TIME_AZUL, WinnerRound.ALLDEATH);
					return;
				}
			}
		}
	}
    public int getScore(int message, int kills)
    {
        if (dead)
            return 0;
        else
        {
            if (message == 1)
            	return kills * 5;
            else if (message == 2)
            	return kills * 5;
            else if (message == 4)
            	return 6;
            else if (message == 5)
            	return 7;
            else
            	return 5;
        }
    }
}