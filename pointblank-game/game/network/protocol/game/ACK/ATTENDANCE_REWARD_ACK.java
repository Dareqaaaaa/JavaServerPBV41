package game.network.protocol.game.ACK;

public class ATTENDANCE_REWARD_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public ATTENDANCE_REWARD_ACK(int error)
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