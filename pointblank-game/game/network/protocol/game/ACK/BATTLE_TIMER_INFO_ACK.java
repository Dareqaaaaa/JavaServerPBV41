package game.network.protocol.game.ACK;

import core.models.*;

public class BATTLE_TIMER_INFO_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	public BATTLE_TIMER_INFO_ACK(Room r)
	{
		super(true);
		this.r = r;
	}
	@Override
	public void writeImpl()
	{
		WriteD(r.type.ordinal());
		WriteD(r.getKillTime() * 60 - r.timeLost);
		WriteD(r.teamRound(0));
		WriteD(r.teamRound(1));
	}
}