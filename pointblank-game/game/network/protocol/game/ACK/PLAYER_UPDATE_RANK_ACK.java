package game.network.protocol.game.ACK;

import core.models.*;

public class PLAYER_UPDATE_RANK_ACK extends game.network.protocol.GamePacketACK
{
	protected Player p; 	
	public PLAYER_UPDATE_RANK_ACK(Player p)
	{
		super(true);
		this.p = p;
	}
	@Override
	public void writeImpl()
	{
		WriteH(p.coupon.cor_mira > 0 ? 4 : 0);
        WriteD(p.rank);
        WriteD(p.rank);
        WriteS(p.coupon.false_nick, 33);
		WriteH(p.coupon.cor_mira);
	}
}