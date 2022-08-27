package game.network.protocol.game.ACK;

public class ROOM_GET_HOST2_ACK extends game.network.protocol.GamePacketACK
{
	public ROOM_GET_HOST2_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteC(29);
		WriteC(15);
		WriteD(0xFFFFFFFF);
	}
}