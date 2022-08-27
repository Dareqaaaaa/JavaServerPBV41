package game.network.protocol.game.ACK;

public class MESSENGER_GIFT_RECEIVE_ACK extends game.network.protocol.GamePacketACK
{
	protected int item_id;
	protected int count;
	protected String name;
	public MESSENGER_GIFT_RECEIVE_ACK(int item_id, int count, String name)
	{
		super(true);
		this.item_id = item_id;
		this.count = count;
	}
	@Override
	public void writeImpl()
	{
		WriteD(item_id);
		WriteD(count);
		if (name == null)
		{
			WriteC(0);
			return;
		}
		WriteC(name.length() + 1);
		WriteS(name, name.length() + 1);
	}
}