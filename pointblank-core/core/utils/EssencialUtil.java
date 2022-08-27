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

package core.utils;

import game.network.protocol.game.ACK.*;

import java.security.*;
import java.util.*;
import java.util.concurrent.*;

import core.enums.*;
import core.manager.*;
import core.models.*;
import core.pistola.*;
import core.sql.*;
import core.system.*;
import core.xml.*;

public class EssencialUtil
{
	protected static final EssencialUtil INSTANCE = new EssencialUtil();
	protected MissionsPISTOLA missao = MissionsPISTOLA.gI();
	protected PlayerSQL db = PlayerSQL.gI();
	public EssencialUtil()
	{
	}
	public static EssencialUtil gI()
	{
		return INSTANCE;
	}
	public String BUSCAR_NICK(long pId)
	{
		Player p = AccountSyncer.gI().get(pId);
		if (p != null)
		{
			db.REPLACE_NICK(pId, p.name);
			return p.name;
		}
		if (db.TODOS_OS_NICKS.containsKey(pId))
			return db.TODOS_OS_NICKS.get(pId);
		else
			return db.returnQueryValueS("SELECT nick FROM jogador WHERE id='" + pId + "'", "nick");
	}
	public int BUSCAR_RANK(long pId)
	{
		Player p = AccountSyncer.gI().get(pId);
		if (p != null)
		{
			db.REPLACE_RANK(pId, p.rank);
			return p.rank;
		}
		if (db.TODOS_OS_RANKS.containsKey(pId))
			return db.TODOS_OS_RANKS.get(pId);
		else
			return db.returnQueryValueI("SELECT rank FROM jogador WHERE id='" + pId + "'", "rank");
	}
	public Player CARREGAR_JOGADOR_ID(long pId, boolean stats, boolean equip, boolean friend, boolean msg)
	{
		Player p = AccountSyncer.gI().get(pId);
		if (p != null)
			return p;
		return db.CARREGAR_JOGADOR_ID(pId, stats, equip, friend, msg);
	}
	public Player CARREGAR_JOGADOR_NOME(String name, boolean stats, boolean equip, boolean friend, boolean msg)
	{
		Player p = AccountSyncer.gI().get(name);
		if (p != null)
			return p;
		return db.CARREGAR_JOGADOR_NOME(name, stats, equip, friend, msg);
	}
	public Room BUSCAR_SALA_JOGADOR(long id)
	{
		for (Channel ch : GameServerXML.gI().channels)
			for (Room sala : ch.SALAS.values())
				for (Player jogador : sala.getPlayers())
					if (jogador.id == id)
						return sala;
		return null;
	}
	public boolean containsString(String msg, String bad, boolean allSize)
	{
		if (allSize)
		{
			int count = 0;
			for (char i : bad.toCharArray())
				if (msg.contains("" + i))
					count++;
			return count == msg.length();
		}
		else
		{
			for (char i : bad.toCharArray())
				if (msg.contains("" + i))
					return true;
		}
		return false;
	}
	public synchronized boolean VERIFICAR_APELIDO_NA_DATABASE(String nome)
	{
		if (containsString(nome, ConnectionLoader.gI().bad_string, false))
			return true;
		if (AccountSyncer.gI().get(nome) != null) return true;
		if (nome.length() < 3) return true;
		if (db.playerExist(nome) != 0) return true;
		return false;
	}
	public synchronized boolean VERIFICAR_APELIDO_DO_CLAN(Player p, String new_name)
	{
		if (containsString(new_name, ConnectionLoader.gI().bad_string, false))
			return true;
		if (ClanManager.gI().nameExist(new_name)) return true;
		if (p == null) return true;
		if (new_name.length() < 3) return true;
		if (db.clanExist(new_name) != 0) return true;
		return false;
	}
	public boolean CS_CHECKED_NAME(long id, String nome)
	{
		for (Player p : AccountSyncer.gI().ACCOUNTS.values())
		{
			if (p != null && p.connection != null && p.id != id && p.clan_id > 0 && p.role == ClanRole.CLAN_MEMBER_LEVEL_MASTER)
			{
				if (p.clan_nome.equals(nome))
					return true;
			}
		}
		return false;
	}
	public boolean PS_CHECKED_NAME(long id, String nome)
	{
		for (Player p : AccountSyncer.gI().ACCOUNTS.values())
		{
			if (p != null && p.connection != null && p.id != id)
			{
				if (p.novo_nome.equals(nome))
					return true;
			}
		}
		return false;
	}
	public String stringBad(String msg, String bad)
	{
		for (Character i : bad.toCharArray())
			if (msg.contains("" + i))
				return i.toString();
		return "";
	}
	public void convertSHA1(String txt) throws NoSuchAlgorithmException
	{
		MessageDigest md = MessageDigest.getInstance("SHA-1");
		md.update(txt.getBytes());
	  	StringBuffer encripted = new StringBuffer();
	  	for (byte byt : md.digest())
	  		encripted.append(Integer.toString((byt & 0xff) + 0x100, 16).substring(1));
	  	txt = encripted.toString();
	}
	public PlayerState PLAYER_STATE(long pId)
	{
		PlayerState sv = new PlayerState(0, 0, 0);
		Player p = AccountSyncer.gI().get(pId);
		if (p != null && p.connection != null)
		{
			if (p.room_id != -1)
			{
				sv.inRoom = true;
				sv.room_id = p.room_id;
			}
			if (p.channel_id != -1)
			{
				sv.inChannel = true;
				sv.channel_id = p.channel_id;
			}
			sv.server_id = p.server_id;
			if (sv.inRoom) sv.state = CommState.SALA;
			else if (!sv.inRoom && sv.inChannel) sv.state = CommState.ONLINE;
			else if (!sv.inRoom && !sv.inChannel) sv.state = CommState.AGUARDANDO;
			else if (p.online == 1) sv.state = CommState.AGUARDANDO;
		}
		else
		{
			if (db.getOnlinePlayer(pId))
				sv.state = CommState.AGUARDANDO;
		}
		return sv;
	}
	public void ATUALIZAR_SALA_AMIGOS_CLAN(Player p, boolean upInfo, boolean upFriends, boolean upInfoClan)
	{
		if (p != null)
		{
			if (upInfo && p.channel_id != -1 && p.server_id != -1)
			{
				Channel ch = GameServerXML.gI().getChannel(p.channel_id, p.server_id);
				if (ch != null)
				{
					Room sala = ch.BUSCAR_SALA(p.room_id);
					if (sala != null)
						sala.updateInfo();
				}
			}
			Clan c = ClanManager.gI().getClanId(p.clan_id);
			if (c != null && upInfoClan)
			{
				for (Player f : c.membros)
				{
					if (f.id == p.id)
					{
						f = p;
						break;
					}
				}
			}
			if (upFriends)
				ATUALIZAR_AMIGOS(p, 0, upInfoClan);
		}
	}
	public void ATUALIZAR_AMIGOS(Player p, int real_status, boolean upInfoClan)
	{
		if (p != null)
		{
			if (p.clan_id > 0)
			{
				Clan c = ClanManager.gI().getClanId(p.clan_id);
				if (c != null)
				{
					for (Player f : ClanManager.gI().getPlayers(c))
					{
						if (f != null && f.connection != null && f.id != p.id)
						{
							if (upInfoClan)
								f.connection.sendPacket(new CLAN_READ_MEMBERS_ACK(c));
							f.connection.sendPacket(new CLAN_MEMBER_INFO_CHANGE_ACK(p, real_status));
						}
					}
				}
			}
			if (p.amigos.size() > 0)
			{
				for (PlayerFriend ft : p.amigos)
				{
					Player a = AccountSyncer.gI().get(ft.id);
					if (a != null && a.amigos.size() > 0)
						for (PlayerFriend g : a.amigos)
							if (g.id == p.id && (g.status == 0 || g.status == 48))
								if (a.connection != null)
									a.connection.sendPacket(new FRIEND_UPDATE_ACK(p, FriendState.ATUALIZAR, a.amigos.indexOf(g), g.status, real_status));
				}
			}
		}
	}
	public void MISSION_COMPLETE(Room room, RoomSlot slot, FragInfos kills, boolean dead, boolean enter, boolean winner, boolean invadir)
	{
		if (!ConfigurationLoader.gI().mission_active)
			return;
		if (room == null || slot == null)
			return;
		Player pS = room.getPlayerBySlot(slot.id);
		if (pS == null)
			return;
		if (slot.missions == null)
			slot.missions = new ConcurrentHashMap<Integer, MissionUpdate>();
		if (room.special != 6 && room.special != 9 && room.map != 44 && pS.espectador == 0)
		{
	         List<MissionEnum> missions = new ArrayList<MissionEnum>();
	         List<Card> card = new ArrayList<Card>();
	         if (dead) missions.add(MissionEnum.MISSION_DEATH);
	         else if (enter) missions.add(MissionEnum.MISSION_ENTER);
	         else if (winner) missions.add(MissionEnum.MISSION_WINNER);
	         else if (invadir) missions.add(MissionEnum.MISSION_INVASION);
	         else if (slot.killMessage == FragValues.HEADSHOT || slot.killMessage == FragValues.CHAIN_HEADSHOT || slot.killMessage == FragValues.PIERCING_HEADSHOT || slot.killMessage == FragValues.PIERCING_CHAIN_HEADSHOT) missions.add(MissionEnum.MISSION_HEADSHOT);
	         else if (slot.killMessage == FragValues.MASS_KILL) missions.add(MissionEnum.MISSION_MASSKILL);
	         else if (slot.killMessage == FragValues.PIERCING_SHOT || slot.killMessage == FragValues.PIERCING_HEADSHOT || slot.killMessage == FragValues.PIERCING_CHAIN_HEADSHOT || slot.killMessage == FragValues.PIERCING_CHAIN_SLUGGER) missions.add(MissionEnum.MISSION_PIERCINGSHOT);
	         else if (slot.killMessage == FragValues.CHAIN_SLUGGER) missions.add(MissionEnum.MISSION_CHAINSLUGGER);
	         else if (slot.oneTimeKills == 1) missions.add(MissionEnum.MISSION_KILL);
	         else if (slot.oneTimeKills == 2) missions.add(MissionEnum.MISSION_DOUBLEKILL);
	         else if (slot.oneTimeKills == 3) missions.add(MissionEnum.MISSION_TRIPLEKILL);
	         else if (slot.oneTimeKills == 4) missions.add(MissionEnum.MISSION_CHAINKILLER);
	         for (int missionId = 1; missionId < 5; missionId++)
	         {
	        	 for (int cardId = 1; cardId < 18; cardId++)
	        	 {
	        		 if (pS.isMission(missionId, cardId))
	        		 {
	        			 card = missao.getCards(cardId);
	        			 break;
	        		 }
	        	 }
	        	 if (card.size() > 0)
	        		 break;
	         }
	         for (Card c : card)
	         {
	        	 if (c.id == pS.missions.card1 && pS.missions.active == 0 || c.id == pS.missions.card2 && pS.missions.active == 1 || c.id == pS.missions.card3 && pS.missions.active == 2 || c.id == pS.missions.card4 && pS.missions.active == 3)
	        	 {
		        	 int weapon = kills.getWeapon();
	        		 boolean sucesso = false;
	            	 for (MissionEnum mission : missions)
	            	 {
	            		 if (c.type == MissionType.CONSEGUIR_KILL
	                     || c.type == MissionType.CONSEGUIR_KILL_1ROUND
	                     || c.type == MissionType.CONSEGUIR_KILL_RIFLE && weapon == 1000 
	                     || c.type == MissionType.CONSEGUIR_KILL_SUB && weapon == 2000 
	                     || c.type == MissionType.CONSEGUIR_KILL_SNIPER && weapon == 3000
	                     || c.type == MissionType.CONSEGUIR_KILL_SHOTGUN && weapon == 4000
	                     || c.type == MissionType.CONSEGUIR_KILL_PISTOLA && weapon == 6010 
	                     || c.type == MissionType.CONSEGUIR_KILL_FACA && weapon == 7020
	                     || c.type == MissionType.CONSEGUIR_KILL_GRANADA && weapon == 8030
	                     || c.type == MissionType.CONSEGUIR_KILL_K400 && kills.weapon == 803007001
	                     || c.type == MissionType.MASSKILL && mission == MissionEnum.MISSION_MASSKILL
	                     || c.type == MissionType.PIERCINGSHOT && mission == MissionEnum.MISSION_PIERCINGSHOT
	                     || c.type == MissionType.CHAINSLUGGER && mission == MissionEnum.MISSION_CHAINSLUGGER)
	            		 {
	            			 if (mission == MissionEnum.MISSION_KILL
	            			 || mission == MissionEnum.MISSION_DOUBLEKILL
	            			 || mission == MissionEnum.MISSION_TRIPLEKILL
	            			 || mission == MissionEnum.MISSION_CHAINKILLER
	            			 || mission == MissionEnum.MISSION_HEADSHOT
	            			 || mission == MissionEnum.MISSION_MASSKILL
	    	            	 || mission == MissionEnum.MISSION_PIERCINGSHOT
	            			 || mission == MissionEnum.MISSION_CHAINSLUGGER)
	            			 {
	            				 sucesso = true;
	            			 }
	            		 }
	                     else if ((c.type == MissionType.CONSEGUIR_DOUBLEKILL
	                     || c.type == MissionType.CONSEGUIR_DOUBLEKILL_RIFLE && weapon == 1000
	                     || c.type == MissionType.CONSEGUIR_DOUBLEKILL_SUB && weapon == 2000
	                     || c.type == MissionType.CONSEGUIR_DOUBLEKILL_SNIPER && weapon == 3000
	                     || c.type == MissionType.CONSEGUIR_DOUBLEKILL_1ROUND) && slot.oneTimeKills == 2)
	                     {
	                    	 sucesso = true;
	                     }
	                     else if ((c.type == MissionType.CONSEGUIR_HEADSHOT
	                     || c.type == MissionType.CONSEGUIR_HEADSHOT_1ROUND
	                     || c.type == MissionType.CONSEGUIR_HEADSHOT_RIFLE && weapon == 1000
	                     || c.type == MissionType.CONSEGUIR_HEADSHOT_SUB && weapon == 2000
	                     || c.type == MissionType.CONSEGUIR_HEADSHOT_SNIPER && weapon == 3000) && (slot.killMessage == FragValues.HEADSHOT || slot.killMessage == FragValues.CHAIN_HEADSHOT || slot.killMessage == FragValues.PIERCING_HEADSHOT || slot.killMessage == FragValues.PIERCING_CHAIN_HEADSHOT)
	                     || c.type == MissionType.CONSEGUIR_CHAINHEADSHOT && (slot.killMessage == FragValues.CHAIN_HEADSHOT || slot.killMessage == FragValues.PIERCING_CHAIN_HEADSHOT))
	                     {
	                    	 sucesso = true;
	                     }
	                     else if ((c.type == MissionType.CONSEGUIR_CHAINKILLER || c.type == MissionType.CONSEGUIR_CHAINKILLER_1ROUND) && slot.oneTimeKills == 4)
	                     {
	                    	 sucesso = true;
	                     }
	                     else if ((c.type == MissionType.CONSEGUIR_TRIPLEKILL_1ROUND
	                     || c.type == MissionType.CONSEGUIR_TRIPLEKILL
	                     || c.type == MissionType.CONSEGUIR_TRIPLEKILL_SUB && weapon == 2000) && slot.oneTimeKills == 3)
	                     {
	                    	 sucesso = true;
	                     }
	                     else if (c.type == MissionType.INVASION && invadir || c.type == MissionType.DEATH && dead || c.type == MissionType.ENTER && enter || c.type == MissionType.WINNER && winner)
	                     {
	                    	 sucesso = true;
	                     }
	                     else if (c.type == MissionType.MATAR_DONO_DA_SALA_1ROUND)
	                     {
	                    	 for (Frag f : kills.frags)
	                         {
	                    		 if (f.getDeatSlot() == room._getMaster())
	    	                     {
	                    			 sucesso = true;
	                    			 break;
	    	                     }
	                         }
	                     }
	                     else if (c.type == MissionType.USAR_DERROTAR_RIFLE && weapon == 1000)
	                     {
	                    	 for (Frag f : kills.frags)
	                         {
	                             if (room.getRoomSlot(f.getDeatSlot()).equipment.weapon_primary / 100000 == 1000)
	                             {
	                            	 sucesso = true;
	                            	 break;
	                             }
	                         }
	                     }
	                     else if ((c.type == MissionType.USAR_DERROTAR_SUB || c.type == MissionType.USAR_DERROTAR_SUB_1ROUND) && weapon == 2000)
	                     {
	                    	 for (Frag f : kills.frags)
	                    	 {
	                             if (room.getRoomSlot(f.getDeatSlot()).equipment.weapon_primary / 100000 == 2000)
	                             {
	                            	 sucesso = true;
	                            	 break;
	                             }
	                    	 }
	                     }
	                     else if (c.type == MissionType.USAR_DERROTAR_SNIPER && weapon == 3000)
	                     {
	                    	 for (Frag f : kills.frags)
	                    	 {
	                             if (room.getRoomSlot(f.getDeatSlot()).equipment.weapon_primary / 100000 == 3000)
	                             {
	                            	 sucesso = true;
	                            	 break;
	                             }
	                    	 }
	                     }
	                     else if (c.type == MissionType.USAR_DERROTAR_SHOTGUN && weapon == 4000)
	                     {
	                    	 for (Frag f : kills.frags)
	                    	 {
	                             if (room.getRoomSlot(f.getDeatSlot()).equipment.weapon_primary / 100000 == 4000)
	                             {
	                            	 sucesso = true;
	                            	 break;
	                             }
	                    	 }
	                     }
	    	             int cId = missao.getValue(c.id, c.mission_id);
	    	             if ((pS.missions.mission1[cId] + 1) > c.limit && pS.missions.active == 0 || (pS.missions.mission2[cId] + 1) > c.limit && pS.missions.active == 1 || (pS.missions.mission3[cId] + 1) > c.limit && pS.missions.active == 2 || (pS.missions.mission4[cId] + 1) > c.limit && pS.missions.active == 3)
	    	            	 continue;
	    	             if (sucesso)
	            		 {
	    	            	 int valor = 0;
	    	            	 if (pS.missions.active == 0) valor = ++pS.missions.mission1[cId];
	    	            	 else if (pS.missions.active == 1) valor = ++pS.missions.mission2[cId];
	    	            	 else if (pS.missions.active == 2) valor = ++pS.missions.mission3[cId];
	    	            	 else if (pS.missions.active == 3) valor = ++pS.missions.mission4[cId];
	                    	 if (valor >= c.limit)
	                    		 slot.missionClear = true;
	                         pS.connection.sendPacket(new MISSION_QUEST_COMPLETE_ACK(c.mission_id, valor, valor >= c.limit ? (0x0f << 4) : 0));
	                         if (slot.missions.containsKey(cId))
	                        	 slot.missions.get(cId).value = valor;
	                         else
	                        	 slot.missions.put(cId, new MissionUpdate(cId, valor, pS.missions.active));
	            		 }
	            	 }
	        	 }
	         }
	         card = null;
	         missions = null;
		}
	}
	public void MISSION_FINAL(Room room, RoomSlot slot, Player player, int win)
	{
		if (slot.id % 2 == win)
        	MISSION_COMPLETE(room, slot, new FragInfos(), false, false, true, false);
        if (slot.missions.isEmpty())
        	return;

		int MISSAO_COMPLETA = 0, CARTAO_COMPLETO = 0;
		int active = player.missions.active;
        int missionId = 0;
        int cardId = 0;

        if (active == 0) missionId = player.mission1;
        else if (active == 1) missionId = player.mission2;
        else if (active == 2) missionId = player.mission3;
        else if (active == 3) missionId = player.mission4;
        else return;

        for (Card c : missao.getCards(missionId))
        {
            int id = missao.getValue(c.id, c.mission_id);
            if (player.missions.mission1[id] >= c.limit && active == 0 || player.missions.mission2[id] >= c.limit && active == 1 || player.missions.mission3[id] >= c.limit && active == 2 || player.missions.mission4[id] >= c.limit && active == 3)
            {
            	CARTAO_COMPLETO++;
            	if (c.id == player.missions.card1 && active == 0 || c.id == player.missions.card2 && active == 1 || c.id == player.missions.card3 && active == 2 || c.id == player.missions.card4 && active == 3)
            	{
            		MISSAO_COMPLETA++;
            		cardId = c.id;
            	}
            }
        }
        if (CARTAO_COMPLETO >= 40)
        {
        	int blue_order = 0;
        	int brooch = 0;
        	int medal = 0;
        	int insignia = 0;
        	int gold = 0;
        	int exp = 0;
        	for (MissionAwards m : missao.getMissionAwards(missionId))
            {
        		blue_order += m.blue_order;
            	exp += m.exp;
            	gold += m.gp;
            	player.connection.sendPacket(new INVENTORY_ITEM_CREATE_ACK(player, m.item_id, m.count, 1, -1, true));
            }
        	for (CardAwards c : missao.getCardAwards(missionId, cardId))
        	{
        		brooch += c.brooch;
        		medal += c.medal;
                insignia += c.insignia;
                gold += c.gp;
                exp += c.exp;
        	}
        	player.blue_order += blue_order;
        	player.brooch += brooch;
        	player.medal += medal;
        	player.insignia += insignia;
        	player.gold += gold;
        	player.exp += exp;
        	player.connection.sendPacket(new MISSION_QUEST_UPDATE_CARD_ACK(player, 273, 4));
        	slot.missionActiveCompleted = player.missions.active;
        	if (brooch > 0) slot.updateBrooch = true;
        	if (medal > 0) slot.updateMedal = true;
        	if (insignia > 0) slot.updateInsignia = true;
        	if (blue_order > 0) slot.updateBlueOrder = true;
         }
         else if (MISSAO_COMPLETA == 4)
         {
        	int brooch = 0;
        	int medal = 0;
        	int insignia = 0;
        	int gold = 0;
        	int exp = 0;
        	for (CardAwards c : missao.getCardAwards(missionId, cardId))
        	{
        		brooch += c.brooch;
        		medal += c.medal;
                insignia += c.insignia;
                gold += c.gp;
                exp += c.exp;
        	}
        	player.brooch += brooch;
        	player.medal += medal;
        	player.insignia += insignia;
        	player.gold += gold;
        	player.exp += exp;
        	player.connection.sendPacket(new MISSION_QUEST_UPDATE_CARD_ACK(player, 1, 1));
        	if (brooch > 0) slot.updateBrooch = true;
        	if (medal > 0) slot.updateMedal = true;
        	if (insignia > 0) slot.updateInsignia = true;
         }
	}
	public List<Integer> DINOSSAUROS(Room r, int time)
	{
		Random n = new Random();
		List<Integer> dinos = new ArrayList<Integer>(8);
		try
		{
			for (int i : time % 2 == 0 ? r.RED_TEAM : r.BLUE_TEAM)
				if (r.getSlotState(i) == SlotState.BATTLE)
					dinos.add(i);
			if ((r.rexDino == -1 || r.getSlotState(r.rexDino).ordinal() != 13 || r.rexDino % 2 != time) && dinos.size() != 1)
			{
				try
				{
					int random = n.nextInt(dinos.size());
					for (int slot : dinos)
					{
						if (dinos.indexOf(slot) == random)
						{
							r.rexDino = slot;
							return dinos;
						}
					}
				}
				catch (Exception e)
				{
				}
				for (int slot : dinos)
				{
					r.rexDino = slot;
					break;
				}
			}
		}
		finally
		{
			n = null;
		}
		return dinos;
	}
}