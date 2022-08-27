package game.network.protocol.game.ACK;

public class FRIEND_INVITE_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public FRIEND_INVITE_ACK(int error)
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