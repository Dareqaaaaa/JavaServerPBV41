package game.network.protocol.game.ACK;

import core.models.*;

public class TESTE_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	protected int slot;
	public TESTE_ACK(Room r, int slot)
	{
		super(true);
		this.r = r;
		this.slot = slot;
	}
	@Override
	public void writeImpl()
	{
		if (r != null && r.getLeader() != null)
		{
			WriteD(r._getMaster());	 
			for (int i = 0; i < 16; i++)
			{
				if (i == slot)
				{
					WriteC(8);
					WriteC(51);
					WriteD(0);
					WriteD(0);
				    WriteC(0);
					WriteD(0xFFFFFFFF);
					WriteC(0);
					WriteC(0);
					WriteC(0);
					WriteC(0);
					WriteC(0);
					WriteC(0);
					WriteC(0);
					WriteS("", 16);
					WriteD(0);
					WriteC(0);
				}
				else
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
				            WriteB(new byte[28]);
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
							WriteS(c.name, 16);
							WriteD(0);
							WriteC(p.country.value);
							if (c.nuller) c = null;
						}
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