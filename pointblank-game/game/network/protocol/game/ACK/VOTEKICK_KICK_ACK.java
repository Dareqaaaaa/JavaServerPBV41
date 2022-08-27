package game.network.protocol.game.ACK;

public class VOTEKICK_KICK_ACK extends game.network.protocol.GamePacketACK
{
	public VOTEKICK_KICK_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteC(0);
	}
}