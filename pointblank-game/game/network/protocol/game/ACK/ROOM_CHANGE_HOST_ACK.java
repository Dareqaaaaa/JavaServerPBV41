package game.network.protocol.game.ACK;

public class ROOM_CHANGE_HOST_ACK extends game.network.protocol.GamePacketACK
{
	protected int slot;
	public ROOM_CHANGE_HOST_ACK(int slot)
	{
		super(true);
		this.slot = slot;
	}
	@Override
	public void writeImpl()
	{
		WriteD(slot);
	}
}