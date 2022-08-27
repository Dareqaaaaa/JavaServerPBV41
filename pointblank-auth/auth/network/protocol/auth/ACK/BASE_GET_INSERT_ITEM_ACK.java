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

import core.enums.*;
import core.models.*;

public class BASE_GET_INSERT_ITEM_ACK extends auth.network.protocol.AuthPacketACK
{
	protected PlayerInventory item;
	protected int size;
	public BASE_GET_INSERT_ITEM_ACK(Player p, int item_id, int count, int equip)
	{
		super(true);
		item = p.buscarPeloItemId(item_id);
		if (item == null)
			item = db.adicionarItem(p, new PlayerInventory(0, item_id, count, equip));
		else
		{
			if (item.equip == 1)
			{
				item.count += count;
				size++;
			}
			else if (item.equip == 2)
			{
				item.count = date.getDateIncDate(String.valueOf(item.count), (count / 86400));
				size++;
			}
			if (size > 0) p.updateCountAndEquip(item);
		}
		if (item.full)
			runner = false;
	}
	@Override
	public void writeImpl()
	{
		if (item != null && runner)
		{
			WriteC(InventoryEnum.CREATE.ordinal());
			WriteD(item.slot > 5 && item.slot < 11 ? 1 : 0);
			WriteD(item.slot > 0 && item.slot < 6 ? 1 : 0);
			WriteD(item.slot == 11 ? 1 : 0);
			WriteQ(item.object);
			WriteD(item.item_id);
			WriteC(item.equip);
			WriteD(item.count);
		}
	}
}