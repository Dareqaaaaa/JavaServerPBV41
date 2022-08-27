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

import java.net.*;
import java.util.*;
import java.util.concurrent.*;

import core.enums.*;
import core.network.*;
import core.pistola.*;
import core.sql.*;
import core.utils.*;
import core.xml.*;

public class Player implements Cloneable
{
	public long id, delay, delayTitle;
    public String name = "", login, clan_nome, novo_nome, addrEndPoint;
	public int rank,
		gold,
		cash,
		exp,
		color,
		brooch,
		insignia,
		medal,
		blue_order,
		tourney_level,
		clan_id,
		online,
		clanDate,
		last_up,
		clan_invited,
		channelIdx,
		espectador,
		channel_id = -1,
		server_id = -1,
		slot = -1,
		cf_slot = -1,
		cf_id = -1,
		last_fstate = -1,
		last_cstate = -1,
		room_id = -1,
		client_version,
		clan_logo,
		tentativa_erro,
		template;
	public int mission1, mission2, mission3, mission4;
	public byte[] localhost = new byte[4];
	public boolean changeSlot = false, sql = false, changeServer = false, shopList = false, firstEnter = false, checkou = false, reward_c = false;
	public CountryEnum country = CountryEnum.NOT;
	public ClanRole role = ClanRole.CLAN_MEMBER_LEVEL_UNKNOWN;
	public AccessLevel access_level = AccessLevel.OFF;
	public InetAddress address;
	public Date minutosJogados;
	public volatile PlayerEquipment equipment = new PlayerEquipment();
	public volatile PlayerConfig config = new PlayerConfig();
	public volatile PlayerTitles title = new PlayerTitles();
	public volatile PlayerStats stats = new PlayerStats();
	public volatile PlayerMission missions = new PlayerMission();
	public volatile PlayerKeyboard keyboard = new PlayerKeyboard();
	public volatile PlayerKeyboard2 mouse = new PlayerKeyboard2();
	public volatile PlayerEvent event = new PlayerEvent();
	public volatile PlayerCoupon coupon = new PlayerCoupon();
	public volatile PlayerVip vip = new PlayerVip();
	public volatile Connection connection;
	public volatile ConcurrentHashMap<Long, PlayerInventory> inventario = new ConcurrentHashMap<Long, PlayerInventory>(500);
	public volatile ConcurrentHashMap<Integer, List<Clan>> listClans = new ConcurrentHashMap<Integer, List<Clan>>();
	public volatile ConcurrentHashMap<Integer, List<Clan>> listClanFrontos = new ConcurrentHashMap<Integer, List<Clan>>();
	public volatile ConcurrentHashMap<Integer, Integer> quarent = new ConcurrentHashMap<Integer, Integer>();
	public volatile List<PlayerFriend> amigos = new ArrayList<PlayerFriend>(50);
	public volatile List<PlayerMessage> mensagens = new ArrayList<PlayerMessage>(100);
	public final PlayerSQL db = PlayerSQL.gI();
	public final DateTimeUtil date = DateTimeUtil.gI();
	public Player()
	{
	}
	public Player(Long pId)
	{
		Player PLAYER = TemplateXML.gI().account.clone();
		id = pId;
		name = "";
		rank = PLAYER.rank;
		gold = PLAYER.gold;
		cash = PLAYER.cash;
		vip.pc_cafe = PLAYER.vip.pc_cafe;
		vip.expire = PLAYER.vip.expire;
		access_level = PLAYER.access_level;
		brooch = PLAYER.brooch;
		insignia = PLAYER.insignia;
		medal = PLAYER.medal;
		blue_order = PLAYER.blue_order;
		last_up = PLAYER.last_up;
		tourney_level = PLAYER.tourney_level;
		mission1 = PLAYER.mission1;
		mission2 = PLAYER.mission2;
		mission3 = PLAYER.mission3;
		mission4 = PLAYER.mission4;
		missions = PLAYER.missions;
		country = PLAYER.country;
		online = 1;
	}
	public int unsigned()
	{
		int unsg = RankXML.gI().proxRankUp(rank) - exp; //3094 3142 9219
		if (unsg < 0) unsg = 0;
		return unsg;
	}
	public int lastup()
	{
		if (rank > 0 && last_up == 1010000)
			return date.getDateTime();
		return last_up;
	}
	public int unpolled()
	{
		return 0;
	}
	public int observing()
	{
		return rank == 53 || rank == 54 || access_level.ordinal() > 0 ? 1 : 0;
	}
	public long status()
	{
		return name.isEmpty() ? 0 : 1;
	}
	public int clan_id()
	{
		return clan_id > 0 ? clan_id : clan_invited;
	}
	public int funcion()
	{
		return clan_id > 0 ? role.ordinal() : 0;
	}
	public boolean removeMessage(int object)
	{
		for (PlayerMessage msg : mensagens)
		{
			if (msg.object == object)
			{
				if (!msg.special)
				{
					mensagens.remove(msg);
					db.deleteMsg(object);
					return true;
				}
			}
			else
			{
				if (db.queryExist("SELECT object FROM jogador_mensagem WHERE object='" + object + "'"))
				{
					db.deleteMsg(object);
					return true;
				}
			}
		}
		return false;
	}
	public boolean rolePermisse()
	{
		return role != ClanRole.CLAN_MEMBER_LEVEL_REGULAR && role != ClanRole.CLAN_MEMBER_LEVEL_UNKNOWN;
	}
	public boolean friendExist(long id)
	{
		for (PlayerFriend f : amigos)
			if (f.id == id)
				return true;
		return false;
	}
	public boolean isMission(int id, int missionId)
	{
		if (mission1 == missionId && id == 1 || mission2 == missionId && id == 2 || mission3 == missionId && id == 3 || mission4 == missionId && id == 4)
			if (missions.active == (id - 1))
				return true;
		return false;
	}
	public byte[] IP()
	{
		try
		{
			return NetworkUtil.parseIpToBytes(addrEndPoint);
		}
		catch (Exception e)
		{
			return new byte[] { 1, 0, 0, 127 };
		}
	}
	public int rank()
	{
		if (coupon == null)
			return rank;
		return coupon.false_rank == 55 ? rank : coupon.false_rank;
	}
	public void readItemsToDelete(Collection<PlayerInventory> list, List<PlayerInventory> deletar, boolean toClear)
	{
		for (PlayerInventory item : list)
			if (item.equip == 2 && item.count <= date.getDateTime() || item.count <= 0 && item.equip == 1)
				if (!deletar.contains(item))
					deletar.add(item);
		if (toClear)
			list = null;
	}
	public void resetEquipment(List<PlayerInventory> deletar)
	{
		try
		{
			for (int i = 0; i < deletar.size(); i++)
				db.EQUIPED_ITEMS(this, deletar.get(i).item_id);
		}
		catch (Exception e)
		{
		}
	}
	public void updateDictionaryInvent(PlayerInventory item)
	{
		if (item != null)
		{
			if (inventario.containsKey(item.object))
				inventario.replace(item.object, item);
			else
				inventario.put(item.object, item);
		}
	}
	public void updateCountAndEquip(PlayerInventory item)
	{
		if (item == null)
			return;
		updateDictionaryInvent(item);
		db.updateCountEquip(this, item);
	}
	public PlayerInventory buscarPeloItemId(int item_id)
	{
		for (PlayerInventory it : inventario.values())
			if (it.item_id == item_id)
				return it;
		PlayerInventory newItem = db.getItemByItemID(this, item_id);
		if (newItem != null)
			updateDictionaryInvent(newItem);
		return newItem;
	}
	public PlayerInventory buscarPeloObjeto(long object_id)
	{
		if (inventario.containsKey(object_id))
			return inventario.get(object_id);
		PlayerInventory newItem = db.getItemByObjectID(this, object_id);
		if (newItem != null)
			updateDictionaryInvent(newItem);
		return newItem;
	}
	public int buscarEquipPeloItemId(int item_id)
	{
		PlayerInventory invent = buscarPeloItemId(item_id);
		if (invent != null)
			return invent.equip;
		else
			return db.returnQueryValueI("SELECT equip FROM jogador_inventario WHERE item_id='" + item_id + "' AND player_id='" + id + "'", "equip");
	}
	public void deleteItem(long object, int itemId)
	{
		try
		{
			if (inventario.containsKey(object))
				inventario.remove(object);
			db.deleteItem(this, object);
			if (itemId > 1200000000 && itemId < 1300000000)
			{
	         	coupon.effects1 = CuponsPISTOLA.gI().couponCalcule(this, 1);
	        	coupon.effects2 = CuponsPISTOLA.gI().couponCalcule(this, 2);
	        	coupon.effects3 = CuponsPISTOLA.gI().couponCalcule(this, 3);
	        	coupon.effects4 = CuponsPISTOLA.gI().couponCalcule(this, 4);
	        	coupon.effects5 = CuponsPISTOLA.gI().couponCalcule(this, 5);
			}
		}
		catch (Exception e)
		{
		}
	}
	public List<PlayerInventory> getItemByType(int type)
    {
    	List<PlayerInventory> list = new ArrayList<PlayerInventory>();
        for (PlayerInventory m : inventario.values())
        {
            if (m.slot > 0 && m.slot < 6 && type == 1 || m.slot > 5 && m.slot < 11 && type == 2 || m.slot == 11 && type == 3)
            {
            	list.add(m);
            }
        }
        return list;
    }
	public List<Integer> todosOsItemsDoInventario(int type)
    {
    	List<Integer> list = new ArrayList<Integer>();
        for (PlayerInventory m : inventario.values())
        {
        	 if (m.slot > 0 && m.slot < 6 && type == 1 || m.slot > 5 && m.slot < 11 && type == 2 || m.slot == 11 && type == 3)
        	 {
        		 list.add(m.item_id);
        	 }
        }
        return list;
    }
	public void finalize()
	{
		try
		{
			super.finalize();
		}
		catch (Throwable e)
		{
		}
	}
	@Override
	public Player clone()
	{
		try
		{
			return (Player) super.clone();
		}
		catch (CloneNotSupportedException e)
		{
			return null;
		}
	}
}