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

import java.util.*;

import core.models.*;
import core.sql.*;

public class ClanInviteManager
{
	protected static final ClanInviteManager INSTANCE = new ClanInviteManager();
	protected volatile List<PlayerInvites> invites = new ArrayList<PlayerInvites>();
	public ClanInviteManager()
	{
	}
	public static ClanInviteManager gI()
	{
		return INSTANCE;
	}
	public void LOAD()
	{
		invites = PlayerSQL.gI().allInvitesClan();
	}
	public boolean deleteInvite(Player p)
	{
		try
		{
			for (PlayerInvites pi : invites)
			{
				if (pi.player_id == p.id)
				{
					p.clan_invited = 0;
					PlayerSQL.gI().executeQuery("UPDATE jogador SET clan_invited='0' WHERE id='" + p.id + "'");
					PlayerSQL.gI().executeQuery("DELETE FROM jogador_invites WHERE player_id='" + p.id + "'");
					invites.remove(pi);
					return true;
				}
			}
			return false;
		}
		catch (Exception e)
		{
			return false;
		}
	}
	public void addInvite(PlayerInvites e)
	{
		invites.add(e);
	}
	public List<PlayerInvites> getInvitesClan(int clan_id)
	{
		List<PlayerInvites> list = new ArrayList<PlayerInvites>();
		for (PlayerInvites pi : invites)
			if (pi.clan_id == clan_id)
				list.add(pi);
		return list;
	}
	public boolean playerHasInvited(long pId)
	{
		for (PlayerInvites pi : invites)
			if (pi.player_id == pId)
				return true;
		return false;
	}
	public String textoByPlayerClan(long pId, int cId)
	{
		for (PlayerInvites pi : invites)
			if (pi.player_id == pId && pi.clan_id == cId)
				return pi.texto;
		return "";
	}
}