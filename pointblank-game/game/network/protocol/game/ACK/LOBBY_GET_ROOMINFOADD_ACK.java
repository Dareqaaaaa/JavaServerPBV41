package game.network.protocol.game.ACK;

import core.models.*;

public class LOBBY_GET_ROOMINFOADD_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	public LOBBY_GET_ROOMINFOADD_ACK(Room r)
	{
		super(true);
		this.r = r;
	}
	@Override
	public void writeImpl()
	{
		WriteS(r.getLeader().name, 33);
		WriteC(r.killMask);
		WriteC(r.redRounds + r.blueRounds);
		WriteH(r.getKillTime() * 60 - r.timeLost);
		WriteC(r.limit);
		WriteC(r.seeConf);
		WriteH(r.balanceamento);
	}
}