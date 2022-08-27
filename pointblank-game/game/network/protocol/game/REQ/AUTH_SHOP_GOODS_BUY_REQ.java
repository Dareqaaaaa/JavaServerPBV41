package game.network.protocol.game.REQ;

import game.manager.*;
import game.network.protocol.game.ACK.*;

import java.util.*;

import core.enums.*;
import core.models.*;

public class AUTH_SHOP_GOODS_BUY_REQ extends game.network.protocol.GamePacketREQ
{
	protected List<PlayerInventory> list = new ArrayList<PlayerInventory>();
	protected ShopSyncManager shop;
	protected Good loja;
	public AUTH_SHOP_GOODS_BUY_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		shop = ShopFunction.gI().GET(client.shopId);
		if (shop != null)
		{
			ReadC(); //1
			loja = shop.BUSCARGOOD(ReadD());
			ReadC(); //type 3 do item?
		}
	}
	@Override
	public void runImpl()
	{
		Room r = client.getRoom();
		Player p = client.getPlayer();
		if (p != null)
		{
			if (r != null && r.getSlotState(p) != SlotState.SHOP)
			{
				sendPacket(new AUTH_SHOP_GOODS_BUY_ACK(null, null, 0x80001017));
				return;
			}
			try
			{
				if (loja == null || p.inventario.size() >= 500)
					sendPacket(new AUTH_SHOP_GOODS_BUY_ACK(null, null, 0x80001017)); //0x80001019
				else
				{
					if ((p.gold - loja.gold) < 0 || (p.cash - loja.cash) < 0)
						sendPacket(new AUTH_SHOP_GOODS_BUY_ACK(null, null, 0x80001018));
					else
					{
						if (loja.titulo > 0 && p.title.title[loja.titulo] == 0)
							sendPacket(new AUTH_SHOP_GOODS_BUY_ACK(null, null, 0x80001085));
						else
						{
							int last_gold = 0;
							int size = 0;
							p.gold -= loja.gold;
							p.cash -= loja.cash;
							if (loja.set)
							{
								for (Good it : shop.CONJUNTO(loja.id))
								{
									if (it.bonusGold == 0)
									{
										PlayerInventory item = p.buscarPeloItemId(it.item_id);
										if (item == null)
											item = db.adicionarItem(p, new PlayerInventory(0, it.item_id, it.count, 1));
										else
										{
											if (item.equip == 1)
											{
												item.count += it.count;
												size++;
											}
											else if (item.equip == 2)
											{
												item.count = date.getDateIncDate(String.valueOf(item.count), (it.count / 86400));
												size++;
											}
											if (size > 0) p.updateCountAndEquip(item);
										}
										if (item != null && !item.full)
											list.add(item);
									}
									else
									{
										p.gold += it.count;
										last_gold++;
									}
								}
							}
							else
							{
								PlayerInventory item = p.buscarPeloItemId(loja.item_id);
								if (item == null)
									item = db.adicionarItem(p, new PlayerInventory(0, loja.item_id, loja.count, 1));
								else
								{
									if (item.equip == 1)
									{
										item.count += loja.count;
										size++;
									}
									else if (item.equip == 2)
									{
										item.count = date.getDateIncDate(String.valueOf(item.count), (loja.count / 86400));
										size++;
									}
									if (size > 0) p.updateCountAndEquip(item);
								}
								if (item != null && !item.full)
									list.add(item);
							}
							sendPacket(new AUTH_SHOP_GOODS_BUY_ACK(list, p, 1));
							if (loja.gold > 0 || last_gold > 0) db.updateGold(p);
							if (loja.cash > 0) db.updateCash(p);
							list.clear();
						}
					}
				}
			}
			catch (Exception e)
			{
				sendPacket(new AUTH_SHOP_GOODS_BUY_ACK(null, null, 0x80001019)); //0x8000101A overload
			}
		}
		else
		{
			sendPacket(new AUTH_SHOP_GOODS_BUY_ACK(null, null, 0x80001017));
		}
	}
}