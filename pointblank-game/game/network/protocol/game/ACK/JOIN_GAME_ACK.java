package game.network.protocol.game.ACK;

public class JOIN_GAME_ACK extends game.network.protocol.GamePacketACK
{
	public JOIN_GAME_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
	}
}