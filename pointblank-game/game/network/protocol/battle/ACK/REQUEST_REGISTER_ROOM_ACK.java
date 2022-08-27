package game.network.protocol.battle.ACK;

import core.models.*;

public class REQUEST_REGISTER_ROOM_ACK extends game.network.protocol.BattlePacketACK
{
	protected Room r;
	protected int slot;
	public REQUEST_REGISTER_ROOM_ACK(Room r, int slot)
	{
		super(true);
		this.r = r;
		this.slot = slot;
	}
	@Override
	public void writeImpl()
	{
		WriteD(r.index);
		WriteD(r.id);
		WriteD(r.seed);
		WriteD(r.server_id);
		WriteD(r.channel_id);
		WriteD(r.map);
		WriteD(slot);
		WriteH(r.map_name.length());
		WriteS(r.map_name, r.map_name.length());
	}
}