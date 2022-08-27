package game.network.protocol.game.ACK;

import core.models.*;

public class AUTH_GET_REMAIN_MONEY_ACK extends game.network.protocol.GamePacketACK
{
	protected Player p;
	public AUTH_GET_REMAIN_MONEY_ACK(Player p)
	{
		super(true);
		this.p = p;
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
        WriteD(p.gold);
        WriteD(p.cash);
	}
}