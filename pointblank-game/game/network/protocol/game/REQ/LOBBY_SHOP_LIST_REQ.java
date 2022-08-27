package game.network.protocol.game.REQ;

import core.models.*;
import game.manager.*;
import game.network.protocol.game.ACK.*;

public class LOBBY_SHOP_LIST_REQ extends game.network.protocol.GamePacketREQ
{
	protected int error;
	public LOBBY_SHOP_LIST_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		error = ReadD();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		if (p != null)
		{
			ShopSyncManager shop = ShopFunction.gI().NOW();
			client.shopId = shop.idx;
			p.shopList = true;
			int lastItem = 0, lastGood = 0, lastMatch = 0;
			for (int i = 0; i < shop.ITEMS.size(); i++)
			{
				sendPacket(new AUTH_SHOP_AUTH_ITEMS_ACK(shop, shop.ITEMS.get(i + 1), lastItem));
			}
			for (int i = 0; i < shop.GOODS.size(); i++)
			{
				sendPacket(new AUTH_SHOP_AUTH_GOODS_ACK(shop, shop.GOODS.get(i + 1), lastGood));
			}
			sendPacket(new SHOP_TEST1_ACK(shop));
			sendPacket(new SHOP_TEST2_ACK(shop));
			for (int i = 0; i < shop.MATCHING.size(); i++)
			{
				sendPacket(new AUTH_SHOP_AUTH_GIFT_ACK(shop, shop.MATCHING.get(i + 1), lastMatch));
			}
		}
		sendPacket(new SHOP_LIST_ACK());
	}
}