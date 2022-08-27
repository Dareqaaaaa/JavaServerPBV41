package game.network.protocol.game.ACK;

public class ROOM_CHATTING_ACK extends game.network.protocol.GamePacketACK
{
	protected int slot;
	protected int type;
	protected boolean access;
	protected String message;
	public ROOM_CHATTING_ACK(int slot, int type, boolean access, String message)
	{
		super(true);
		this.slot = slot;
		this.type = type;
		this.access = access;
		this.message = message;
	}
	@Override
	public void writeImpl()
	{
		WriteH(type);
		WriteD(slot);
		WriteC(access ? 1 : 0);
		WriteD(message.length() + 1);
		WriteS(message, message.length() + 1);
	}
}