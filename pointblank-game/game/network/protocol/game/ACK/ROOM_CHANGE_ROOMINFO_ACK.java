package game.network.protocol.game.ACK;

import core.models.*;

public class ROOM_CHANGE_ROOMINFO_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	public ROOM_CHANGE_ROOMINFO_ACK(Room r)
	{
		super(true);
		this.r = r;
	}
	@Override
	public void writeImpl()
	{
		WriteD(r.id);
		WriteS(r.name, 23);
		WriteH(r.map);
		WriteC(r.stage4v4);
		WriteC(r.type.ordinal());
		WriteC(r.rstate.ordinal());
		WriteC(r.getPlayers().size());
		WriteC(r.slots());
		WriteC(r.ping);
		WriteC(r.allWeapons);
		WriteC(r.randomMap);
		WriteC(r.special);
		WriteS(r.getLeader().name, 33);
		WriteD(r.killMask);
        WriteC(r.limit);
        WriteC(r.seeConf);
        WriteH(r.balanceamento);
        if (r.special == 6 || r.special == 9)
        {
			WriteC(r.aiCount);
			WriteC(r.aiLevel);
        }
	}
}