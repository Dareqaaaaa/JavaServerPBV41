package game.network.protocol.game.ACK;

public class INVENTORY_NICK_CHECK_ACK extends game.network.protocol.GamePacketACK 
{
	protected int error;
	public INVENTORY_NICK_CHECK_ACK(int error)
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