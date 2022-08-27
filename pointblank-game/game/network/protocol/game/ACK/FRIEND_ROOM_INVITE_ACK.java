package game.network.protocol.game.ACK;

public class FRIEND_ROOM_INVITE_ACK extends game.network.protocol.GamePacketACK
{
	protected int indexOf;
	public FRIEND_ROOM_INVITE_ACK(int indexOf)
	{
		super(true);
		this.indexOf = indexOf;
	}
	@Override
	public void writeImpl()
	{
	    WriteC(indexOf);
	}
}