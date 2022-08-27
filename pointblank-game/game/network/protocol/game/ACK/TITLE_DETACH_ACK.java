package game.network.protocol.game.ACK;

public class TITLE_DETACH_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	public TITLE_DETACH_ACK(int error)
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