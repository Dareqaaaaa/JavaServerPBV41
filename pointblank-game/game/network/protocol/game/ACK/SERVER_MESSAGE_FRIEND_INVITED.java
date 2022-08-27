package game.network.protocol.game.ACK;

public class SERVER_MESSAGE_FRIEND_INVITED extends game.network.protocol.GamePacketACK
{
	public SERVER_MESSAGE_FRIEND_INVITED()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteC(0);
	}
}