package game.network.protocol.game.ACK;

import game.manager.*;

public class SHOP_TEST1_ACK extends game.network.protocol.GamePacketACK
{
	protected ShopSyncManager shop;
	public SHOP_TEST1_ACK(ShopSyncManager shop)
	{
		super(true);
		this.shop = shop;
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
		WriteD(0);
		WriteD(0);
		WriteD(shop.test_ack);
	}
}