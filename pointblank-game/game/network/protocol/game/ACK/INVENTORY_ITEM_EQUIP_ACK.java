package game.network.protocol.game.ACK;

import core.models.*;

public class INVENTORY_ITEM_EQUIP_ACK extends game.network.protocol.GamePacketACK
{
	protected PlayerInventory item;
	protected int error;
    public INVENTORY_ITEM_EQUIP_ACK(PlayerInventory item, Player player, int error, boolean descount)
    {
        super(true);
        this.item = item;
        this.error = error;
        if (item != null && player != null && descount && error == 1)
        {
        	item.count--;
			if (item.count > 0)
				player.updateCountAndEquip(item);
			else
			{
				player.deleteItem(item.object, item.item_id);
				item.item_id = 0;
				item.count = 0;
			}
			player.novo_nome = "";
			player.clan_nome = "";
        }
    }
	@Override
    public void writeImpl()
    {
    	WriteD(error);
    	if (error == 1 && item != null)
    	{
	    	WriteD(date.getDateTime());
		    WriteQ(item.object);
	       	WriteD(item.item_id);
	        WriteC(item.equip);
	        WriteD(item.count);
    	}
    }
}