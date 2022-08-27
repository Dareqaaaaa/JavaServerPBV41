package game.network.protocol.game.ACK;

import java.util.*;

import core.enums.*;
import core.models.*;

public class INVENTORY_ITEMS_UPDATE_ACK extends game.network.protocol.GamePacketACK
{
	protected List<PlayerInventory> weapon = new ArrayList<PlayerInventory>();
	protected List<PlayerInventory> chara = new ArrayList<PlayerInventory>();
	protected List<PlayerInventory> coupon = new ArrayList<PlayerInventory>();
    public INVENTORY_ITEMS_UPDATE_ACK(List<PlayerInventory> items)
    {
        super(true);
		if (items != null)
		{
			for (PlayerInventory m : items)
		    {
			   if (m.slot > 0 && m.slot < 6)
		       {
				   weapon.add(m);
		       }
		       else if (m.slot > 5 && m.slot < 11)
		       {
		    	   chara.add(m);
		       }
		       else if (m.slot == 11)
		       {
		    	   coupon.add(m);
		       }
		    }
		}
    }
    @Override
    public void writeImpl()
    {
        WriteC(InventoryEnum.UPDATEALL.ordinal());
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
    	chara = null;
    	weapon = null;
    	coupon = null;
    }
}