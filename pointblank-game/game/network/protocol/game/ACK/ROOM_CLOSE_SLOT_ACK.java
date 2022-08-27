package game.network.protocol.game.ACK;

public class ROOM_CLOSE_SLOT_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public ROOM_CLOSE_SLOT_ACK(int error)
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