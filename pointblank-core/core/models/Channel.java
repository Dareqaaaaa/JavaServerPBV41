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

import game.manager.*;

import java.util.*;
import java.util.concurrent.*;

import core.enums.*;
import core.sql.*;
import core.utils.*;

public class Channel
{
    public int id;
    public int max_rooms;
    public int server_id;
    public int max_cf = 0;
    public double bonusExp;
    public double bonusGold;
    public double bonusCash;
    public String anuncio;
    public boolean only_acess;
    public ChannelServerEnum type;
	public volatile List<Long> JOGADORES = new ArrayList<Long>();
	public volatile ConcurrentHashMap<Integer, ClanFronto> CLANFRONTOS = new ConcurrentHashMap<Integer, ClanFronto>();
	public volatile ConcurrentHashMap<Integer, Room> SALAS = new ConcurrentHashMap<Integer, Room>();
	protected final PlayerSQL db = PlayerSQL.gI();
	public Channel(int server_id)
	{
		this.server_id = server_id;
	}
	public boolean LIDER_NA_SALA(long pId)
	{
		for (Room r : SALAS.values())
			if (r.LIDER == pId)
				return true;
		return false;
	}
	public Room BUSCAR_SALA(int roomId)
	{
		REMOVER_SALAS_VAZIAS();
		return SALAS.containsKey(roomId) ? SALAS.get(roomId) : null;
	}
	public Player BUSCAR_JOGADOR_LOBBY(int idx)
	{
		long id = 0;
		try
		{
			id = JOGADORES.get(idx);
		}
		catch (Exception e)
		{
		}
		if (id > 0)
			return AccountSyncer.gI().get(id);
		return null;
	}
	public int CONTADOR_DE_JOGADORES()
	{
		int total = 0;
		for (Player p : AccountSyncer.gI().ACCOUNTS.values())
			if (p != null && p.connection != null && p.channel_id == id)
				total++;
		return total;
	}
	public void REMOVER_SALAS_VAZIAS()
	{
		for (Room r : SALAS.values())
		{
			List<Player> players = r.getPlayers();
			if (r != null && players.size() == 0)
			{
				players.clear();
				r.stopAllThread();
				BattleServerManager.gI().REMOVE_ROOM(r.index);
				SALAS.remove(r.id);
				r.finalize();
				r = null;
			}
		}
	}
	public void ADICIONAR_JOGADOR(Player p)
	{
		if (p != null && p.status() > 0 && p.channel_id >= 0)
		{
			if (!JOGADORES.contains(p.id))
			{
				p.room_id = -1;
				JOGADORES.add(p.id);
			}
		}
	}
	public void REMOVER_JOGADOR(long pId)
	{
		JOGADORES.remove(pId);
	}
	public ClanFronto BUSCAR_CF(int id)
	{
		if (CLANFRONTOS.containsKey(id))
			return CLANFRONTOS.get(id);
		else
			return null;
	}
	public long LIDER_DO_CF(int id)
	{
		ClanFronto match = BUSCAR_CF(id);
		if (match != null)
			return match.lider;
		else
			return -1;
	}
	public boolean JOGADOR_EXISTECF(long id)
	{
		if (id > 0)
		{
			for (ClanFronto cf : CLANFRONTOS.values())
			{
				for (RoomSlot slot : cf.SLOT)
				{
					if (slot.player_id == id)
						return true;	
				}
			}
		}
		return false;
	}
}