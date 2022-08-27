/*
 * Point Blank Emulador
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Authors: Henrique Rodrigues
 * Copyright (C) 2016-2018
 */

package auth.network.protocol.auth.ACK;

import java.util.*;

import core.enums.*;
import core.models.*;
import core.system.*;
import core.utils.*;
import core.xml.*;

public class BASE_GET_MYINFO_ACK extends auth.network.protocol.AuthPacketACK
{
	protected Player p;
	protected Clan c;
	protected EventVerification ev;
	protected ConfigurationLoader srv;
	protected MapsLoader mp;
	protected int error;
	protected int christmas;
	protected List<PlayerInventory> weapon;
	protected List<PlayerInventory> chara;
	protected List<PlayerInventory> coupon;
	public BASE_GET_MYINFO_ACK(Player conta, int error)
	{
		super(true);
		this.error = error;
		p = conta;
		srv = ConfigurationLoader.gI();
		mp = MapsLoader.gI();
		if (p != null)
		{
			int natal = p.event.christmas;
			EventPresent chrs = ChristimasXML.gI().EVENT_AVAILABLE();
			if (chrs != null && natal == 0)
				db.updateChristmas(p, (natal = (p.event.christmas = 1)));
			if (p.event.christmas == 1 && chrs == null)
				db.updateChristmas(p, (natal = (p.event.christmas = 0)));
			if (p.access_level == AccessLevel.MASTER_PLUS)
				if (p.buscarPeloItemId(1103003010) == null)
					db.adicionarItem(p, new PlayerInventory(0, 1103003010, 1, 3)); //Boina PBTN
			if (p.buscarPeloItemId(1103003016) == null && (p.rank > 46 || p.access_level == AccessLevel.MASTER_PLUS))
				db.adicionarItem(p, new PlayerInventory(0, 1103003016, 1, 3)); //Boina de General
			weapon = p.getItemByType(1);
			chara = p.getItemByType(2);
			coupon = p.getItemByType(3);
			if (natal != 2)
				christmas = natal;
			if (p.clan_id > 0)
				c = db.CARREGAR_CLAN(p.clan_id);
			else
				c = new Clan(0, true);
			EventVerification clone = CheckXML.gI().VERIFICATION_NOW();
			if (clone != null)
				if (clone.id != p.event.checks_id && clone.checks > p.event.last_check1 && date.getYearMouthDay(0) != p.event.check_day)
					ev = clone;
		}
		else
		{
			error = 0x80000000;
		}
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		if (error == 0 && p != null)
		{
			WriteC(p.client_version);
			WriteS(p.name, 33);
			WriteD(p.exp);
			WriteD(p.rank);
			WriteD(p.rank);
			WriteD(p.gold);
			WriteD(p.cash);
			WriteD(p.clan_id());
			WriteD(p.funcion());
			WriteQ(p.status());
			WriteC(p.vip.pc_cafe);
			WriteC(p.tourney_level);
			WriteC(p.color);
			WriteS(c.name, 17);
			WriteC(c.rank);
			WriteC(c.nivel().ordinal());
			WriteD(c.logo);
			WriteC(c.color);
	        WriteH(c.rating);
	        WriteH(c.top_rating);
			WriteC(p.unpolled());
			WriteD(p.unsigned());
			WriteD(p.lastup());
			WriteD(p.stats.partidas);
			WriteD(p.stats.ganhou);
			WriteD(p.stats.perdeu);
			WriteD(p.stats.empatou);
			WriteD(p.stats.matou);
			WriteD(p.stats.headshots);
			WriteD(p.stats.morreu);
			WriteD(p.stats.partidas);
			WriteD(p.stats.matou);
			WriteD(p.stats.kitou);
			WriteD(p.stats.partidas);
			WriteD(p.stats.ganhou);
			WriteD(p.stats.perdeu);
			WriteD(p.stats.empatou);
			WriteD(p.stats.matou);
			WriteD(p.stats.headshots);
			WriteD(p.stats.morreu);
			WriteD(p.stats.partidas);
			WriteD(p.stats.matou);
			WriteD(p.stats.kitou);	
			WriteD(p.equipment.char_red);
			WriteD(p.equipment.char_blue);
			WriteD(p.equipment.char_head);
			WriteD(p.equipment.char_beret);
			WriteD(p.equipment.char_dino);
			WriteD(p.equipment.weapon_primary);
			WriteD(p.equipment.weapon_secundary);
			WriteD(p.equipment.weapon_melee);
			WriteD(p.equipment.weapon_grenade);
			WriteD(p.equipment.weapon_special);
			WriteH(p.coupon.cor_mira > 0 ? 4 : 0);
	        WriteD(p.coupon.false_rank);
	        WriteD(p.coupon.false_rank);
	        WriteS(p.coupon.false_nick, 33);       
			WriteH(p.coupon.cor_mira);
			WriteC(p.country.value);
			if (p.client_version < 38)
			{
				WriteC(1);
				WriteD(chara.size());
				WriteD(weapon.size());
				WriteD(coupon.size());
				WriteD(0);
				for (int i = 0; i < chara.size(); i++)
				{
					PlayerInventory item = chara.get(i);
					WriteQ(item.object);
					WriteD(item.item_id);
					WriteC(item.equip);
					WriteD(item.count);
				}
				for (int i = 0; i < weapon.size(); i++)
				{
					PlayerInventory item = weapon.get(i);
					WriteQ(item.object);
					WriteD(item.item_id);
					WriteC(item.equip);
					WriteD(item.count);
				}
				for (int i = 0; i < coupon.size(); i++)
				{
					PlayerInventory item = coupon.get(i);
					WriteQ(item.object);
					WriteD(item.item_id);
					WriteC(item.equip);
					WriteD(item.count);
				}
			}
			WriteC(srv.outpost ? 1 : 0);
			WriteD(p.brooch);
			WriteD(p.insignia);
			WriteD(p.medal);
			WriteD(p.blue_order);
			WriteC(p.missions.active);
			WriteC(p.missions.card1);
			WriteC(p.missions.card2);
			WriteC(p.missions.card3);
			WriteC(p.missions.card4);
			for (int i = 0; i < 10; i++) WriteH(missao.getCard(p.mission1, i, p.missions.mission1));
			for (int i = 0; i < 10; i++) WriteH(missao.getCard(p.mission2, i, p.missions.mission2));
			for (int i = 0; i < 10; i++) WriteH(missao.getCard(p.mission3, i, p.missions.mission3));
			for (int i = 0; i < 10; i++) WriteH(missao.getCard(p.mission4, i, p.missions.mission4));
			WriteC(p.mission1);
			WriteC(p.mission2);
			WriteC(p.mission3);
			WriteC(p.mission4);
	        for (int i = 1; i < 41; i++) WriteC(p.missions.mission1[i]);
	        for (int i = 1; i < 41; i++) WriteC(p.missions.mission2[i]);
	        for (int i = 1; i < 41; i++) WriteC(p.missions.mission3[i]);
	        for (int i = 1; i < 41; i++) WriteC(p.missions.mission4[i]);
	        WriteC(p.title.pos1);
	        WriteC(p.title.pos2);
	        WriteC(p.title.pos3);
	        WriteC(p.title.pos4);
	        WriteC(p.title.pos5);
	        WriteC(p.title.pos6);
	        WriteC(p.title.pos7);
	        WriteC(p.title.pos8);
			WriteC(p.title.equip1);
			WriteC(p.title.equip2);
			WriteC(p.title.equip3);
			WriteD(p.title.slot);
			WriteD(mp.TUTORIAL);
			WriteD(mp.DEATHMACH);
			WriteD(mp.DESTRUICAO);
			WriteD(mp.SABOTAGEM);
			WriteD(mp.SUPRESSAO);
			WriteD(mp.DEFESA);
			WriteD(mp.CHALLENGE);
			WriteD(mp.DINO);
			WriteD(mp.SNIPER);
			WriteD(mp.SHOTGUN);
			WriteD(mp.HEADHUNTER);
			WriteD(mp.SOCO);
			WriteD(mp.CROSSCOUNTER);
			if (p.client_version > 34) WriteD(mp.CAOS);
			if (p.client_version == 38) WriteD(mp.ESCOLTA);
			WriteH(mapas.maps.size() + 1031);
			WriteH(mapas.mapList1);
			WriteH(mapas.mapList2);
			WriteH(mapas.mapList3);
			WriteH(mapas.mapList4);
			WriteH(mapas.mapList5);
			WriteH(mapas.mapList6);
			WriteH(mapas.mapList7);
			WriteH(mapas.mapList8);
			WriteH(mapas.mapList9);
			for (Maps maps : mapas.maps)
				WriteH(maps.mode);
			WriteH(4524);
			WriteH(4524);
			WriteH(0);
			WriteH(0);
			WriteH(4136);
			WriteH(8);
			WriteC(0);
			for (Maps maps : mapas.maps)
				WriteC(maps.tag);
			WriteC(0);
			WriteC(0);
			WriteC(1); 
			WriteC(1);
			WriteC(1);
			WriteC(1);
	        WriteC(srv.mission_active ? 1 : 0);
	        WriteD(missao.missionList);
	        WriteD(50);
	        WriteD(75);
	        WriteC(1);
	        WriteH(20);
	        WriteD(764677232);
	        WriteD(517802056);
	        WriteD(1747888);
	        WriteD(4357017);
	        WriteD(764677232);
	        WriteC(0);
	        WriteC(p.observing());
	        WriteC(0);
	        WriteC(0);
	        WriteC(christmas);
	        WriteD(0);
			WriteD(ev != null ? ev.id : 0);
			WriteC(ev != null ? p.event.last_check1 : 0);
			WriteC(ev != null ? p.event.last_check2 : 0);
			WriteH(0);
			WriteD(ev != null ? ev.inicio : 0);
			WriteT(ev != null ? ev.titulo : "", 60);
			WriteC(ev != null ? 2 : 0);
			WriteC(ev != null ? ev.checks : 0);
			WriteH(0);
			WriteD(ev != null ? ev.id : 0);
			WriteD(ev != null ? ev.inicio : 0);
			WriteD(ev != null ? ev.termino : 0);
			for (int i = 1; i < (p.client_version == 38 ? 9 : 8); i++)
			{
				EventGifts gf = ev != null ? ev.GIFT(i) : new EventGifts();
				if (i == 8)
					WriteC(gf.size);
				else
					WriteD(gf.size);
				WriteD(gf.gift1);
				WriteD(gf.gift2);
			}
	        WriteD(date.getDateTime());
	        WriteB(new byte[12]);
	        WriteB(NetworkUtil.hexStringToByteArray("9B AF 5D 6B 31 30 2E 31 32 30 2E 31 2E 34 34"));
	        WriteB(new byte[229]);
	        WriteH(8085);
	        WriteH(0);
	        WriteH(1);
	        WriteC(0);
	        WriteH(ShopTag.NEW.ordinal());
	        WriteC(ShopTag.NEW.ordinal());
	        WriteC(ShopTag.VIP_BASIC.ordinal());
	        WriteH(ShopTag.VIP_PLUS.ordinal());
	        WriteC(ShopTag.NEW.ordinal());
	        WriteC(ShopTag.HOT.ordinal());
	        WriteC(ShopTag.SALE.ordinal());
	        WriteC(ShopTag.EVENT.ordinal());
		}
		c = null;
		chara = null;
		weapon = null;
		coupon = null;
	}
}