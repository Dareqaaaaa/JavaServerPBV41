package game.network.protocol.game.ACK;

public class SHOP_LIST_ACK extends game.network.protocol.GamePacketACK
{
	public SHOP_LIST_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(date.getDateTime()); 
	}
}