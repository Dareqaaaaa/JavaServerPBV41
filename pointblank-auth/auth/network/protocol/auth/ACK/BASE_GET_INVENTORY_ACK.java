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

import core.models.*;

public class BASE_GET_INVENTORY_ACK extends auth.network.protocol.AuthPacketACK
{
	protected List<PlayerInventory> weapon = new ArrayList<PlayerInventory>();
	protected List<PlayerInventory> chara = new ArrayList<PlayerInventory>();
	protected List<PlayerInventory> coupon = new ArrayList<PlayerInventory>();
	public BASE_GET_INVENTORY_ACK(Player p)
	{
		super(true);
		if (p != null)
		{
			weapon = p.getItemByType(1);
			chara = p.getItemByType(2);
			coupon = p.getItemByType(3);
		}
	}
	@Override
	public void writeImpl()
	{
		WriteD(chara.size());
		for (int i = 0; i < chara.size(); i++)
		{
			PlayerInventory item = chara.get(i);
			WriteQ(item.object);
			WriteD(item.item_id);
			WriteC(item.equip);
			WriteD(item.count);
		}
		WriteD(weapon.size());
		for (int i = 0; i < weapon.size(); i++)
		{
			PlayerInventory item = weapon.get(i);
			WriteQ(item.object);
			WriteD(item.item_id);
			WriteC(item.equip);
			WriteD(item.count);
		}
		WriteD(coupon.size());
		for (int i = 0; i < coupon.size(); i++)
		{
			PlayerInventory item = coupon.get(i);
			WriteQ(item.object);
			WriteD(item.item_id);
			WriteC(item.equip);
			WriteD(item.count);
		}
		WriteD(0);
		chara = null;
		weapon = null;
		coupon = null;
	}
}