package game.network.protocol.game.ACK;

public class BASE_SYSTEM_MESSAGE_ACK extends game.network.protocol.GamePacketACK
{
	protected String owner;
	protected String msg;
	protected int colored;
	public BASE_SYSTEM_MESSAGE_ACK(String owner, String msg, int colored)
	{
		super(true);
		this.owner = owner;
		this.msg = msg;
		this.colored = colored;
	}
	@Override
	public void writeImpl()
	{
		WriteS(owner, 33);
		WriteC(colored);
		WriteH(msg.length() + 1);
		WriteS(msg, msg.length() + 1);
	}
}