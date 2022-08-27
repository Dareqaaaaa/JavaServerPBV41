package game.network.protocol.game.ACK;

public class LOBBY_CREATE_NICK_NAME_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public LOBBY_CREATE_NICK_NAME_ACK(int error)
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