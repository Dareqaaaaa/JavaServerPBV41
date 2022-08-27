package game.network.protocol.game.ACK;

import core.enums.*;
import core.models.*;

public class INVENTORY_ITEM_UPDATE_ACK extends game.network.protocol.GamePacketACK
{
	protected PlayerInventory item;
    public INVENTORY_ITEM_UPDATE_ACK(PlayerInventory item)
    {
        super(true);
        this.item = item;
    }
    @Override
    public void writeImpl()
    {
        WriteC(InventoryEnum.UPDATE.ordinal());
		WriteD(item.slot > 5 && item.slot < 11 ? 1 : 0);
		WriteD(item.slot > 0 && item.slot < 6 ? 1 : 0);
		WriteD(item.slot == 11 ? 1 : 0);
		WriteQ(item.object);
        WriteD(item.item_id);
        WriteC(item.equip);
        WriteD(item.count);
    }
}