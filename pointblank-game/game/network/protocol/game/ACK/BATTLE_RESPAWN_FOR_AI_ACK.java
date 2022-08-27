package game.network.protocol.game.ACK;

public class BATTLE_RESPAWN_FOR_AI_ACK extends game.network.protocol.GamePacketACK
{
	protected int slot;
	public BATTLE_RESPAWN_FOR_AI_ACK(int slot)
	{
		super(true);
		this.slot = slot;
	}
	@Override
	public void writeImpl()
	{
		WriteD(slot);
	}
}