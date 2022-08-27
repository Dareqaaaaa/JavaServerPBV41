package game.network.protocol.game.ACK;

public class BATTLE_MISSION_BOMB_UNINSTALL_ACK extends game.network.protocol.GamePacketACK
{
	protected int slot;
	public BATTLE_MISSION_BOMB_UNINSTALL_ACK(int slot)
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