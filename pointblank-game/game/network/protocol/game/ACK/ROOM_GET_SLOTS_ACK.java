package game.network.protocol.game.ACK;

import core.info.*;
import core.models.*;

public class ROOM_GET_SLOTS_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	public ROOM_GET_SLOTS_ACK(Room r)
	{
		super(true);
		this.r = r;
	}
	@Override
	public void writeImpl()
	{
		if (r != null && r.getLeader() != null)
		{
			WriteD(r._getMaster());	 
			for (int i = 0; i < 16; i++)
			{
				RoomSlot s = r.getRoomSlot(i);
				if (s != null)
				{
					WriteC(s.state.ordinal());
					Player p = r.getPlayerBySlot(i);
					if (p == null)
					{
						WriteB(new byte[10]);
			            WriteD(0xFFFFFFFF);
			            WriteB(new byte[Software.rev == 9 ? 27 : 28]);
					}
					else
					{
						Clan c = ck.getClanNotNull(p.clan_id);
						WriteC(p.rank());
						WriteD(p.clan_id());
						WriteD(p.funcion());
					    WriteC(c.rank);
						WriteD(c.logo);
						WriteC(p.vip.pc_cafe);
						WriteC(p.tourney_level);
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
						if (c.nuller) c = null;
					}
				}
			}
		}
		else
		{
			runner = false;
		}
	}
}