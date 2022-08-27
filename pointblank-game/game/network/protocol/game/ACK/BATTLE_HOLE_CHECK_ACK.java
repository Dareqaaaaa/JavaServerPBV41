package game.network.protocol.game.ACK;

public class BATTLE_HOLE_CHECK_ACK extends game.network.protocol.GamePacketACK
{
	public BATTLE_HOLE_CHECK_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
	}
}