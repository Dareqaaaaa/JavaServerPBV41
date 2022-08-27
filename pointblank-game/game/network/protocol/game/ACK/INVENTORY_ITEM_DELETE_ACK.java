package game.network.protocol.game.ACK;

import core.models.*;

public class INVENTORY_ITEM_DELETE_ACK extends game.network.protocol.GamePacketACK
{
	protected long object;
	protected int error;
	public INVENTORY_ITEM_DELETE_ACK(long object, int itemId, int error, Player p)
	{
		super(true);
		this.object = object;
		this.error = error;
		if (p != null && error == 1)
			p.deleteItem(object, itemId);
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		if (error == 1)
			WriteQ(object);
	}
}