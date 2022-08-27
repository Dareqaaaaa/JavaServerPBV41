package game.network.protocol.battle.ACK;

import core.models.*;

public class REQUEST_ADD_PLAYER_ACK extends game.network.protocol.BattlePacketACK
{
	protected Room r;
	protected int slot;
	public REQUEST_ADD_PLAYER_ACK(Room r, int slot)
	{
		super(true);
		this.r = r;
		this.slot = slot;
	}
	@Override
	public void writeImpl()
	{
		WriteD(r.index);
		WriteD(slot);
	}
}