package game.network.protocol.game.ACK;

public class BASE_USER_ENTER_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public BASE_USER_ENTER_ACK(int error)
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