package game.network.protocol.game.ACK;

import game.manager.*;

import java.util.*;

import core.models.*;

public class AUTH_SHOP_AUTH_GIFT_ACK extends game.network.protocol.GamePacketACK
{
	protected ShopSyncManager shop;
	protected List<Good> goods;
	protected int MOSTROU;
	public AUTH_SHOP_AUTH_GIFT_ACK(ShopSyncManager shop, List<Good> goods, int MOSTROU)
	{
		super(true);
		this.shop = shop;
		this.goods = goods;
		this.MOSTROU += MOSTROU;
	}
	@Override
	public void writeImpl()
	{
		WriteD(shop.GOODSALL.size() + shop.SETSALL.size() + shop.GIFTALL.size());
		WriteD(goods.size());
		WriteD(MOSTROU);
		for (Good loja : goods)
		{
			WriteD(loja.id);
			WriteD(loja.item_id);
			WriteD(loja.count);
		}
		WriteD(shop.match_ack);
	}
}