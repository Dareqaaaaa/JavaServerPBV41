package game.network.protocol.game.ACK;

public class PUSH_PRESENT_ITEM_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public PUSH_PRESENT_ITEM_ACK(int error)
	{
		super(true); //516
		this.error = error;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
	}
}