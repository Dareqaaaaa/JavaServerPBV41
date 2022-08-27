package game.network.protocol.game.ACK;

public class SERVER_MESSAGE_GAMEGUARD_ERROR extends game.network.protocol.GamePacketACK
{
	public SERVER_MESSAGE_GAMEGUARD_ERROR()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
	}
}