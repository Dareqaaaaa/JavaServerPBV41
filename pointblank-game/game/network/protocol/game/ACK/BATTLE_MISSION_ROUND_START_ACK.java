package game.network.protocol.game.ACK;

import core.models.*;
import game.network.protocol.*;

public class BATTLE_MISSION_ROUND_START_ACK extends GamePacketACK
{
	protected Room r;
	protected int time;
	public BATTLE_MISSION_ROUND_START_ACK(Room r, int time)
	{
		super(true);
		this.r = r;
		this.time = time;
	}
	@Override
	public void writeImpl()
	{
		WriteC(r.rodadas);
		WriteD(time == 0 ? r.getKillTime() * 60 : r.timeLost);
		WriteH(r.getMaskSlotBattle(true, false, false));
	}
}