package game.network.protocol.game.ACK;

import core.enums.*;
import core.models.*;

public class INVENTORY_ITEM_CREATE_ACK extends game.network.protocol.GamePacketACK
{
	protected PlayerInventory item;
	protected int size;
	public INVENTORY_ITEM_CREATE_ACK(Player p, int item_id, int count, int equip, int dias, boolean insert)
	{
		super(true);
		runner = insert;
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
				item.count = date.getDateIncDate(String.valueOf(item.count), (dias != -1 ? dias : (count / 86400)));
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