package game.network.protocol.game.ACK;

public class PLAYER_EXIT_GAME_ACK extends game.network.protocol.GamePacketACK
{
	public PLAYER_EXIT_GAME_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
	}
}