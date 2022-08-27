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

package core.manager;

import game.network.protocol.game.ACK.*;

import java.util.*;
import java.util.concurrent.*;

import core.enums.ClanRole;
import core.models.*;
import core.sql.*;
import core.utils.*;

public class ClanManager
{
	protected static final ClanManager INSTANCE = new ClanManager();
	public volatile ConcurrentHashMap<Integer, Clan> clans = new ConcurrentHashMap<Integer, Clan>();
	protected final PlayerSQL db = PlayerSQL.gI();
	public ClanManager()
	{
	}
	public static ClanManager gI()
	{
		return INSTANCE;
	}
	public synchronized boolean logoExist(int logo)
	{
		for (Clan c : clans.values())
			if (c.logo == logo)
				return true;
		return false;
	}
	public boolean nameExist(String name)
	{
		for (Clan c : clans.values())
			if (c.name.equals(name))
				return true;
		return false;
	}
	public List<Player> getPlayers(Clan c)
	{
		List<Player> list = new ArrayList<Player>(); //limit
		if (c != null)
		{
			for (Player f : c.membros)
			{
				Player p = AccountSyncer.gI().get(f.id);
				if (p != null) f = p.clone();
				if (f != null) list.add(f);
			}
		}
		return list;
	}
	public Clan getClanId(int id)
	{
		if (clans.containsKey(id))
			return clans.get(id);
		else
			return null;
	}
	public void inserirJogador(Player p, boolean updateInfo, int cId)
	{
		if (p != null)
		{
			Clan c = getClanId(cId);
			if (c != null)
			{
		        p.clan_id = cId;
				p.role = ClanRole.CLAN_MEMBER_LEVEL_REGULAR;
		        p.clanDate = DateTimeUtil.gI().getClanTime();
		        p.clan_invited = 0;
				c.membros.add(p);
		        for (Player f : getPlayers(c))
		        {
		        	if (f != null && f.connection != null)
		        	{
		        		if (f.id != p.id)
		        			f.connection.sendPacket(new CLAN_MEMBER_INFO_INSERT_ACK(p));
		        		if (updateInfo)
		        			f.connection.sendPacket(new CLAN_CREATE_ACK(c, 0, f.gold));
		        	}
		        }
		        if (p.connection != null)
		        	p.connection.sendPacket(new CLAN_READ_MEMBERS_ACK(c));
		        db.updateClanID(p);
		        db.updateClanDate(p);
		        db.updateRole(p.id, p.role.ordinal());
		        ClanInviteManager.gI().deleteInvite(p);
		        EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(p, true, false, false);
		        AccountSyncer.gI().UPDATE(p);
			}
		}
	}
	public String getClanName(int id)
	{
		Clan c = getClanId(id);
		if (c != null)
			return c.name;
		return "";
	}
	public Clan getClanNotNull(int id)
	{
		Clan c = getClanId(id);
		if (c != null)
			return c;
		return new Clan(0, true);
	}
	public boolean addClan(Clan c)
	{
		if (!clans.containsKey(c.id))
		{
			clans.put(c.id, c);
			return true;
		}
		return false;
	}
	public void updateClan(Clan c)
	{
		if (c != null)
			if (clans.containsKey(c.id))
				clans.replace(c.id, c);
	}
	public void removeClan(int cId)
	{
		if (clans.containsKey(cId))
			clans.remove(cId);
	}
	public boolean JOGADOR_ESTA_NO_CLAN(long pId)
	{
		for (Clan c : clans.values())
			for (Player p : getPlayers(c))
				if (p.id == pId)
					return true;
		Player c = AccountSyncer.gI().get(pId);
		if (c != null)
			return c.clan_id > 0;
		else
			return db.returnQueryValueI("SELECT clan_id FROM jogador WHERE id='" + pId + "'", "clan_id") > 0;
	}
	public void ATUALIZAR_INFO(Clan c)
	{
		if (c != null)
		{
    		for (Player f : getPlayers(c))
				if (f != null && f.connection != null)
					f.connection.sendPacket(new CLAN_CREATE_ACK(c, 0, f.gold));
		}
	}
	public void LOAD()
	{
		clans = db.CARREGAR_CLANS(0);
	}
}