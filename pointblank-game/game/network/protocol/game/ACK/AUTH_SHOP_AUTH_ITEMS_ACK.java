package game.network.protocol.game.ACK;

import game.manager.*;

import java.util.*;

import core.models.*;

public class AUTH_SHOP_AUTH_ITEMS_ACK extends game.network.protocol.GamePacketACK
{
	protected ShopSyncManager shop;
	protected List<Stock> items;
	protected int MOSTROU;
	public AUTH_SHOP_AUTH_ITEMS_ACK(ShopSyncManager shop, List<Stock> items, int MOSTROU)
	{
		super(true);
		this.shop = shop;
		this.items = items;
		this.MOSTROU = MOSTROU;
		MOSTROU += items.size();
	}
	@Override
	public void writeImpl()
	{
		WriteD(shop.ITEMSALL.size());
		WriteD(items.size());
		WriteD(MOSTROU);
		for (Stock loja : items)
		{
			WriteD(loja.item_id);
			WriteC(loja.tipo2);
			WriteC(loja.tipo1);
			WriteC(loja.tipo3);
			WriteC(loja.titulo);
		}
		WriteD(shop.items_ack);
	}
}