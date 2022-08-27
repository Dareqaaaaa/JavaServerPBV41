package game.network.protocol.game.ACK;

public class LOBBY_LEAVE_ACK extends game.network.protocol.GamePacketACK
{
	public LOBBY_LEAVE_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
	}
}