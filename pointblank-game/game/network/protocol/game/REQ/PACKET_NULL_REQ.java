package game.network.protocol.game.REQ;

public class PACKET_NULL_REQ extends game.network.protocol.GamePacketREQ
{
	public PACKET_NULL_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
	}
	@Override
	public void runImpl()
	{
	}
}