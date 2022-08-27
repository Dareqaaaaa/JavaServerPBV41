package game.network.protocol.game.ACK;

public class ROOM_INVITE_SHOW_ACK extends game.network.protocol.GamePacketACK
{
	protected String inviter;
	protected int room_id;
	public ROOM_INVITE_SHOW_ACK(String inviter, int room_id)
	{
		super(true);
		this.inviter = inviter;
		this.room_id = room_id;
	}
	@Override
	public void writeImpl()
	{
		WriteS(inviter, 33);
		WriteD(room_id);
	}
}