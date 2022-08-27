package game.network.protocol.game.ACK;

public class MESSENGER_NOTE_CHECK_READED_ACK extends game.network.protocol.GamePacketACK
{
	protected int object;
	protected int view;
	public MESSENGER_NOTE_CHECK_READED_ACK(int object, int view)
	{
		super(true);
		this.object = object;
		this.view = view;
	}
	@Override
	public void writeImpl()
	{
		WriteC(view);
		WriteD(object);
	}
}