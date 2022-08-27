package game.network.protocol.game.ACK;

import java.util.*;

import core.models.*;

public class AUTH_SHOP_GOODS_BUY_ACK extends game.network.protocol.GamePacketACK
{
	protected List<PlayerInventory> weapon = new ArrayList<PlayerInventory>();
	protected List<PlayerInventory> chara = new ArrayList<PlayerInventory>();
	protected List<PlayerInventory> coupon = new ArrayList<PlayerInventory>();
	protected Player p;
	protected int error;
	public AUTH_SHOP_GOODS_BUY_ACK(List<PlayerInventory> items, Player p, int error)
	{
		super(true);
		if (error == 1)
		{
	        for (PlayerInventory m : items)
	        {
	        	 if (m.slot > 0 && m.slot < 6) weapon.add(m);
	        	 if (m.slot > 5 && m.slot < 11) chara.add(m);
	        	 if (m.slot == 11) coupon.add(m);
	        }
	        items.clear();
		}
		this.p = p;
		this.error = error;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		if (error == 1)
		{
			WriteD(date.getDateTime());
			WriteD(chara.size());
			WriteD(weapon.size());
			WriteD(coupon.size());
			for (int i = 0; i < chara.size(); i++)
			{
				PlayerInventory item = chara.get(i);
				WriteQ(item.object);
				WriteD(item.item_id);
				WriteC(item.equip);
				WriteD(item.count);
			}
			for (int i = 0; i < weapon.size(); i++)
			{
				PlayerInventory item = weapon.get(i);
				WriteQ(item.object);
				WriteD(item.item_id);
				WriteC(item.equip);
				WriteD(item.count);
			}
			for (int i = 0; i < coupon.size(); i++)
			{
				PlayerInventory item = coupon.get(i);
				WriteQ(item.object);
				WriteD(item.item_id);
				WriteC(item.equip);
				WriteD(item.count);
			}
			WriteD(p.gold);
			WriteD(p.cash);
		}
		chara = null;
		weapon = null;
		coupon = null;
	}
}