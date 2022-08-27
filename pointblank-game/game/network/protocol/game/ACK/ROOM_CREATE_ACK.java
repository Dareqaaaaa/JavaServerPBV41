package game.network.protocol.game.ACK;

import core.models.*;

public class ROOM_CREATE_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	protected int error;
	public ROOM_CREATE_ACK(Room r, int error)
	{
		super(true);
		this.r = r;
		this.error = error;
	}
	@Override
	public void writeImpl()
	{
		if (error == 0 && r != null)
		{
			WriteD(r.id);
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
		}
		else
		{
			WriteD(error);
		}
	}
}