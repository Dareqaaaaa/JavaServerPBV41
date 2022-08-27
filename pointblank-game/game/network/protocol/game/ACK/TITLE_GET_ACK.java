package game.network.protocol.game.ACK;

public class TITLE_GET_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	protected int slot;
	public TITLE_GET_ACK(int error, int slot)
	{
		super(true);
		this.error = error;
		this.slot = slot;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);	
		WriteD(slot);	
	}
}