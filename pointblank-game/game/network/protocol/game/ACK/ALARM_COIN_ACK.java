package game.network.protocol.game.ACK;

public class ALARM_COIN_ACK extends game.network.protocol.GamePacketACK
{
	public ALARM_COIN_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
	}
}