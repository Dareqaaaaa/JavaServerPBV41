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

package game.manager;

import java.sql.*;
import java.util.*;
import java.util.concurrent.*;

import core.enums.*;
import core.jdbc.*;
import core.models.*;

public class ShopSyncManager
{
	public int idx;

	public int limitItems = 1111;
	public int limitGoods = 592;
	public int limitMatchg = 741;

	public int items_ack = 356; //13-46-353-356-1590-1594
	public int goods_ack = 13; //13-46-353-356-1590-1594
	public int match_ack = 356; //13-46-353-356-1590-1594
	public int test_ack = 13; //13-46-353-356-1590-1594

	public ConcurrentHashMap<Integer, List<Good>> GOODS = new ConcurrentHashMap<Integer, List<Good>>();
	public ConcurrentHashMap<Integer, List<Good>> MATCHING = new ConcurrentHashMap<Integer, List<Good>>();
	public ConcurrentHashMap<Integer, List<Stock>> ITEMS = new ConcurrentHashMap<Integer, List<Stock>>();

	public List<Good> GOODSALL = new ArrayList<Good>();
	public List<Good> SETSALL = new ArrayList<Good>();
	public List<Good> GIFTALL = new ArrayList<Good>();
	public List<Good> SETStoGOOD = new ArrayList<Good>();
	public List<Stock> ITEMSALL = new ArrayList<Stock>();

	public ShopSyncManager(int idx)
	{
		this.idx = idx;
	}
	public void PUT()
	{
		for (Stock g : ITEMSALL)
		{
			int limit = 0;
			for (int i = 0; i < ITEMS.size(); i++)
			{
				if (ITEMS.get(i + 1).size() + 1 <= limitItems)
				{
					ITEMS.get(i + 1).add(g);
					limit = 1;
				}
			}
			if (limit == 1)
				continue;
			System.out.println(" [!] ShopSyncManager: Storage limite de items [" + ITEMSALL.size() + "/" + limitItems + "]");
		}

		List<Good> list = new ArrayList<Good>();
		list.addAll(GOODSALL);
		list.addAll(SETStoGOOD);
		for (Good g : list)
		{
			int limit = 0;
			for (int i = 0; i < GOODS.size(); i++)
			{
				if (GOODS.get(i + 1).size() + 1 <= limitGoods)
				{
					GOODS.get(i + 1).add(g);
					limit = 1;
				}
			}
			if (limit == 1)
				continue;
			System.out.println(" [!] ShopSyncManager: Goods/Sets limite de items [" + list.size() + "/" + limitGoods + "]");
		}
		list.clear();

		list.addAll(GOODSALL);
		list.addAll(SETSALL);
		list.addAll(GIFTALL);
		for (Good g : list)
		{
			int limit = 0;
			for (int i = 0; i < MATCHING.size(); i++)
			{
				if (MATCHING.get(i + 1).size() + 1 <= limitMatchg)
				{
					MATCHING.get(i + 1).add(g);
					limit = 1;
				}
			}
			if (limit == 1)
				continue;
			System.out.println(" [!] ShopSyncManager: Matching limite de items [" + list.size() + "/" + limitMatchg + "]");
		}
		list.clear();
	}
	public synchronized void LOAD()
	{
		try
		{
			LOADSYNCER();
			for (Good sets : core.pistola.SetsPISTOLA.gI().sets)
				SETSALL.add(sets);

			for (Good shop : SETSALL)
				if (shop.show)
					SETStoGOOD.add(shop);

			int goodsSize = (int)Math.ceil((double)(GOODSALL.size() + SETStoGOOD.size()) / limitGoods);
			for (int i = 0; i < goodsSize; i++)
				GOODS.put(i + 1, new ArrayList<Good>(limitGoods));

			int matchSize = (int)Math.ceil((double)(GOODSALL.size() + SETSALL.size() + GIFTALL.size()) / limitMatchg);
			for (int i = 0; i < matchSize; i++)
				MATCHING.put(i + 1, new ArrayList<Good>(limitMatchg));

			int itemsSize = (int)Math.ceil((double)ITEMSALL.size() / limitItems);
			for (int i = 0; i < itemsSize; i++)
				ITEMS.put(i + 1, new ArrayList<Stock>(limitItems));

			PUT();
			for (Good g : GOODSALL)
				if (sizeITEM(g.item_id) > 3)
					System.out.println(" [!] ShopSyncManager: Good repetindo 3x itemId: " + g.item_id + " (" + g.id + ")");
			System.out.flush();
		}
		catch (Exception e)
		{
			System.err.println(" [!] ShopSyncManager: \n" + e.toString());
			System.err.flush();
		}
	}
	public Good BUSCARGOOD(int good_id)
	{
		for (Good it : SETSALL)
			if (it.id == good_id && it.show)
				return it;
		for (Good it : GOODSALL)
			if (it.id == good_id)
				return it;
		return null;
	}
	public List<Good> CONJUNTO(int good_id)
	{
		List<Good> list = new ArrayList<Good>();
		for (Good it : SETSALL)
			if (it.id == good_id)
				list.add(it);
		return list;
	}
	public void LOADSYNCER()
	{
		Connection con = null;
		PreparedStatement statement = null;
		ResultSet rs = null;
		try
		{
			con = DatabaseFactory.gI().newConnection();
			statement = con.prepareStatement("SELECT * FROM loja");
			rs = statement.executeQuery();
			while (rs.next())
			{
				Good good = new Good();
				good.id = rs.getInt("id");
				good.item_id = rs.getInt("item_id");
				good.name = rs.getString("name");
				good.gold = rs.getInt("gold");
				good.cash = rs.getInt("cash");
				good.count = rs.getInt("count");
				good.tag = ShopTag.valueOf(rs.getString("tag"));
				good.type = rs.getInt("type");
				GOODSALL.add(good);
			}
			statement.close();
			rs.close();
			statement = con.prepareStatement("SELECT * FROM storage");
			rs = statement.executeQuery();
			while (rs.next())
			{
				Stock stock = new Stock();
				stock.id = rs.getInt("id");
				stock.item_id = rs.getInt("item_id");
				String type = rs.getString("type");
				if (stock.item_id > 1200000000 && stock.item_id < 1300000000)
				{
					stock.tipo1 = 1;
					stock.tipo2 = 2;
					stock.tipo3 = 1;
				}
				else if (stock.item_id > 1300000000 && stock.item_id < 1400000000)
				{
					stock.tipo1 = 1;
					stock.tipo2 = 1;
					if (stock.item_id == 1301114000 || stock.item_id == 1301115000 || stock.item_id == 1301116000 || stock.item_id == 1301117000 || stock.item_id == 1301118000)
						stock.tipo3 = 3;
					else
						stock.tipo3 = 2;
				}
				else
				{
					stock.tipo1 = 1;
					stock.tipo2 = type.equals("UNIDADES") ? 1 : type.equals("DIAS") ? 2 : type.equals("PERMANENTE") ? 3 : 0;
					stock.tipo3 = 2;
					stock.titulo = rs.getInt("titulo");
				}
				for (Good g : GOODSALL)
				{
					if (g.item_id == stock.item_id)
					{
						g.titulo = stock.titulo;
						if (g.count >= 86400 && stock.tipo2 != 2 || g.count == 100 && stock.tipo2 != 1)
							System.out.println(" [!] ShopSyncManager: Tipo de item da loja nao foi especificado corretamente (" + g.id + ")");
						break;
					}
				}
				for (Stock center : ITEMSALL)
				{
					if (center.item_id == stock.item_id)
					{
						System.out.println(" [!] ShopSyncManager: Item repetido no Stock (" + stock.id + "; " + stock.item_id + ")");
						break;
					}
				}
				ITEMSALL.add(stock);
			}
			statement.close();
			rs.close();
			statement = con.prepareStatement("SELECT * FROM loja_gifts");
			rs = statement.executeQuery();
			while (rs.next())
			{
				if (rs.getBoolean("enable"))
				{
					Good gif = new Good();
					gif.id = rs.getInt("id");
					gif.item_id = rs.getInt("item_id");
					gif.count = 1;
					GIFTALL.add(gif);
				}
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			DatabaseFactory.gI().closeConnection(con, statement, rs);
		}
	}
	public int sizeITEM(int id)
	{
		int size = 0;
		for (Good g : GOODSALL)
			if (g.item_id == id)
				size++;
		return size;
	}
}