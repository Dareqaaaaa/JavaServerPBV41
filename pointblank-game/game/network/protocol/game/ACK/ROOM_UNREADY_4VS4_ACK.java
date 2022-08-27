package game.network.protocol.game.ACK;

public class ROOM_UNREADY_4VS4_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public ROOM_UNREADY_4VS4_ACK(int error)
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