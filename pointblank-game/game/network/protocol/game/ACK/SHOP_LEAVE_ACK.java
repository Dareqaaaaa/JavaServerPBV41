package game.network.protocol.game.ACK;

public class SHOP_LEAVE_ACK extends game.network.protocol.GamePacketACK
{
	protected int type;
	public SHOP_LEAVE_ACK(int type)
	{
		super(true);
		this.type = type;
	}
	@Override
	public void writeImpl()
	{
		WriteD(type);
		WriteD(0);
	}
}