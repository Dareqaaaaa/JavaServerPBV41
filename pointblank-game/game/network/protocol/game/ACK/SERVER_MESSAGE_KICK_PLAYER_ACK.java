package game.network.protocol.game.ACK;

public class SERVER_MESSAGE_KICK_PLAYER_ACK extends game.network.protocol.GamePacketACK
{
	public SERVER_MESSAGE_KICK_PLAYER_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteC(0);
	}
}