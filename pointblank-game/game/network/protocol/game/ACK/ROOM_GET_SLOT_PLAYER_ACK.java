package game.network.protocol.game.ACK;

import core.info.*;
import core.models.*;

public class ROOM_GET_SLOT_PLAYER_ACK extends game.network.protocol.GamePacketACK
{
	protected RoomSlot s;
	protected Player p;
	protected Clan c;
	public ROOM_GET_SLOT_PLAYER_ACK(Player p, RoomSlot s)
	{
		super(true);
		this.s = s;
		this.p = p;
		c = ck.getClanNotNull(p != null ? p.clan_id : 0);
	}
	@Override
	public void writeImpl()
	{
		if (p != null && s != null)
		{
			WriteD(s.id);
			WriteC(s.state.ordinal());
			WriteC(p.rank());
			WriteD(p.clan_id());
			WriteD(p.funcion());
		    WriteC(c.rank);
	        WriteD(c.logo);
			WriteC(p.vip.pc_cafe);
			WriteC(p.coupon.effects1);
			WriteC(p.coupon.effects2);
			WriteC(p.coupon.effects3);
			WriteC(p.coupon.effects4);
			WriteC(p.coupon.effects5);
			WriteS(c.name, 17);
			WriteH(0);
			if (Software.rev != 9)
				WriteC(0);
			WriteC(p.country.value);
			WriteC(33);
			WriteS(p.name, 33);
			WriteC(p.color);
		}
		else
		{
			runner = false;
		}
		if (c.nuller) c = null;
	}
}