package game.network.protocol.game.ACK;

public class FRIEND_ACCEPT_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public FRIEND_ACCEPT_ACK(int error)
	{
		super(true);
		this.error = error;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
	}
}