package game.network.protocol.game.ACK;

public class PUSH_ITEM_ACK extends game.network.protocol.GamePacketACK
{
	public PUSH_ITEM_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
	}
}