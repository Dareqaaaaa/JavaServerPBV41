package game.network.protocol.game.ACK;

public class INVENTORY_ENTER_ACK extends game.network.protocol.GamePacketACK
{
	public INVENTORY_ENTER_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(date.getDateTime()); 
	}
}