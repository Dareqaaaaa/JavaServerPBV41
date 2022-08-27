package game.network.protocol.game.ACK;

public class BASE_CHANNEL_PASSWD_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public BASE_CHANNEL_PASSWD_ACK(int error)
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