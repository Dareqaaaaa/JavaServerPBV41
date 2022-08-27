package game.network.protocol.game.ACK;

public class BASE_ACCOUNT_LOG_ACK extends game.network.protocol.GamePacketACK
{
	public BASE_ACCOUNT_LOG_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
	}
}