package game.network.protocol.battle.ACK;

public class REQUEST_BATTLE_CONNECTION_ACK extends game.network.protocol.BattlePacketACK
{
	protected int value;
	protected String key = "131f636e03f0192dd35700f0fe102a1cc03d3d9";
	public REQUEST_BATTLE_CONNECTION_ACK(int value)
	{
		super(true);
		this.value = value;
	}
	@Override
	public void writeImpl()
	{
		WriteC(value);
		WriteH(key.length());
		WriteS(key, key.length());
	}
}