package game.network.protocol.game.ACK;

import core.models.*;

public class ROOM_CHANGE_OPTIONINFO_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	protected String leader_name;
	public ROOM_CHANGE_OPTIONINFO_ACK(Room r, String leader_name)
	{
		super(true);
		this.r = r;
		this.leader_name = leader_name;
	}
	@Override
	public void writeImpl()
	{
		WriteS(leader_name, 33);
		WriteD(r.killMask);
		WriteC(r.limit);
		WriteC(r.seeConf);
		WriteH(r.balanceamento);
	}
}