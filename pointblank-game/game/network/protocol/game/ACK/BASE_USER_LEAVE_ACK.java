package game.network.protocol.game.ACK;

public class BASE_USER_LEAVE_ACK extends game.network.protocol.GamePacketACK
{
	public BASE_USER_LEAVE_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
	}
}