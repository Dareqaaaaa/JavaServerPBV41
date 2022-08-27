package game.manager;

import java.util.concurrent.*;

public class ShopFunction
{
	protected static final ShopFunction INSTANCE = new ShopFunction();
	public int shopNow;
	public ConcurrentHashMap<Integer, ShopSyncManager> list = new ConcurrentHashMap<Integer, ShopSyncManager>();
	public ShopFunction()
	{
	}
	public static ShopFunction gI()
	{
		return INSTANCE;
	}
	public void FONT()
	{
		shopNow++;
		ShopSyncManager shop = new ShopSyncManager(shopNow);
		shop.LOAD();
		list.put(shopNow, shop);
	}
	public ShopSyncManager GET(int idx)
	{
		if (list.containsKey(idx))
			return list.get(idx);
		else
			return null;
	}
	public ShopSyncManager NOW()
	{
		if (list.containsKey(shopNow))
			return list.get(shopNow);
		else
			return null;
	}
}