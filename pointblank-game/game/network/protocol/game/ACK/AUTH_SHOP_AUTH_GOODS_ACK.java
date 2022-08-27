package game.network.protocol.game.ACK;

import game.manager.*;

import java.util.*;

import core.enums.*;
import core.models.*;

public class AUTH_SHOP_AUTH_GOODS_ACK extends game.network.protocol.GamePacketACK
{
	protected ShopSyncManager shop;
	protected List<Good> goods;
	protected int MOSTROU;
	public AUTH_SHOP_AUTH_GOODS_ACK(ShopSyncManager shop, List<Good> goods, int MOSTROU)
	{
		super(true);
		this.shop = shop;
		this.goods = goods;
		this.MOSTROU = MOSTROU;
		MOSTROU += goods.size();
	}
	@Override
	public void writeImpl()
	{
		int pc_cafe = conn.getPlayer().vip.pc_cafe;
		WriteD(shop.GOODSALL.size() + shop.SETStoGOOD.size());
		WriteD(goods.size());
		WriteD(MOSTROU);
		for (Good loja : goods)
		{
			WriteD(loja.id);
			WriteC(1);
			if (loja.tag == ShopTag.VIP_PLUS && pc_cafe < 2 || loja.tag == ShopTag.VIP_BASIC && pc_cafe < 1)
				WriteC(4);
			else
				WriteC(loja.type);
			WriteD(loja.gold);
            WriteD(loja.cash);
            WriteC(loja.getTag());
		}
		WriteD(shop.goods_ack);
	}
}