package game.network.protocol.game.ACK;

public class INVENTORY_ITEM_EQUIP2_ACK extends game.network.protocol.GamePacketACK
{
	protected long object;
	protected int error;
	public INVENTORY_ITEM_EQUIP2_ACK(long object, int error)
	{
		super(true);
		this.object = object;
		this.error = error;
	}
	@Override
	public void writeImpl()
	{
        WriteD(error);
        if (error == 1)
        {
            WriteD(date.getDateTime());
            WriteQ(object);
        }
	}
}