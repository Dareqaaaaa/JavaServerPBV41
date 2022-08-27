package game.network.protocol.game.ACK;

public class BATTLE_SENDPING_ACK extends game.network.protocol.GamePacketACK
{
	protected byte[] LATENCY;
	public BATTLE_SENDPING_ACK(byte[] LATENCY)
	{
		super(true);
		this.LATENCY = LATENCY;
	}
	@Override
	public void writeImpl()
	{
		WriteB(LATENCY);
	}
}