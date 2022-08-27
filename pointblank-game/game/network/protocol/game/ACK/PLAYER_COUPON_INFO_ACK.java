package game.network.protocol.game.ACK;

import core.models.*;

public class PLAYER_COUPON_INFO_ACK extends game.network.protocol.GamePacketACK
{
	protected Player p; 	
	public PLAYER_COUPON_INFO_ACK(Player p)
	{
		super(true);
		this.p = p;
	}
	@Override
	public void writeImpl()
	{
		WriteH(p.coupon.cor_mira > 0 ? 4 : 0);
        WriteD(p.coupon.false_rank);
        WriteD(p.coupon.false_rank);
        WriteS(p.coupon.false_nick, 33);
		WriteH(p.coupon.cor_mira);
	}
}