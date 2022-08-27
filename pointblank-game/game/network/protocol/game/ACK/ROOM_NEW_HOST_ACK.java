package game.network.protocol.game.ACK;

public class ROOM_NEW_HOST_ACK extends game.network.protocol.GamePacketACK
{
	protected int slot;
	public ROOM_NEW_HOST_ACK(int slot)
	{
		super(true);
		this.slot = slot;
	}
	@Override
	public void writeImpl()
	{
		if (slot >= 0)
			WriteD(slot);
        else
        {
			WriteC(15);
			WriteD(0xFFFFFFFF);
        }
	}
}