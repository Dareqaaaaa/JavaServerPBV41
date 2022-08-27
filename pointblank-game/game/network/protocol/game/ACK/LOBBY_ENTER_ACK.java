package game.network.protocol.game.ACK;

public class LOBBY_ENTER_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public LOBBY_ENTER_ACK(int error)
	{
		super(true);
		this.error = error;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		WriteD(1);
		WriteD(0);
		WriteC(0);
		WriteD(0);
	}
}