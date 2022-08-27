package game.network.protocol.game.ACK;

import java.util.*;

import core.enums.*;
import core.models.*;

public class ROOM_JOIN_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	protected int slot_id;
	protected int error;
	protected List<Player> jogadores;
	public ROOM_JOIN_ACK(Room r, int slot_id, int error)
	{
		super(true);
		this.r = r;
		this.slot_id = slot_id;
		this.error = error;
		if (error == 0 && r != null && slot_id >= 0)
			jogadores = r.getPlayers();
	}
	@Override
	public void writeImpl()
	{
		if (error == 0 && r != null && slot_id >= 0)
		{
			WriteD(r.id);
	        WriteD(slot_id);
	        WriteD(r.id);
	        WriteS(r.name, 23);
	        WriteH(r.map);
	        WriteC(r.stage4v4);
	        WriteC(r.type.ordinal());
	        WriteC(RoomState.READY.ordinal());
	        WriteC(r.getPlayers().size());
	    	WriteC(r.slots());
			WriteC(r.ping);
	        WriteC(r.allWeapons);
	        WriteC(r.randomMap);
	        WriteC(r.special);
	        WriteS(r.getLeader().name, 33);
			WriteC(r.killMask);
			WriteC(r.redRounds + r.blueRounds);
			WriteH(r.getKillTime() * 60 - r.timeLost);
	        WriteC(r.limit);
	        WriteC(r.seeConf);
	        WriteH(r.balanceamento);
	        WriteS(r.passwd, 4);
	        WriteC(0);
	    	WriteD(r._getMaster());
			for (int i = 0; i < 16; i++)
			{
				RoomSlot s = r.getRoomSlot(i);
				if (s != null)
				{
		    		Player p = r.getPlayerBySlot(i);
					WriteC(s.state.ordinal());
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
						WriteS(c.name, 17);
						WriteH(0);
						WriteC(0);
						WriteC(p.country.value);
						if (c.nuller) c = null;
					}
				}
			}
			WriteC(jogadores.size());
			for (Player p : jogadores)
			{
				WriteC(p.slot);
				WriteC(33);
				WriteS(p.name, 33);
				WriteC(p.color);
			}
			WriteC(r.aiCount);
			WriteC(r.aiLevel);
			jogadores = null;
		}
        else if (error == 0x80001005)
        {
        	WriteB(new byte[] { 4, 0, 10, 12 });
            WriteD(error);
        }
        else
        {
        	WriteD(error);
        }
	}
}