package game.network.protocol.game.ACK;

public class PROFILE_ENTER_ACK extends game.network.protocol.GamePacketACK
{
	public PROFILE_ENTER_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
	}
}