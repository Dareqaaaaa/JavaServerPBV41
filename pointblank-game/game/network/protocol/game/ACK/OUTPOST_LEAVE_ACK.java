package game.network.protocol.game.ACK;

public class OUTPOST_LEAVE_ACK extends game.network.protocol.GamePacketACK
{
	public OUTPOST_LEAVE_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
	}
}