package game.network.protocol.game.ACK;

public class BATTLE_TIMERSYNC_ACK extends game.network.protocol.GamePacketACK
{
	public BATTLE_TIMERSYNC_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
	}
}