package game.network.protocol.game.ACK;

import core.models.*;

public class BATTLE_MISSION_GENERATOR_INFO_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	public BATTLE_MISSION_GENERATOR_INFO_ACK(Room r)
	{
		super(true);
		this.r = r;
	}
	@Override
	public void writeImpl()
	{
        WriteH(r.bar1);
        WriteH(r.bar2);
        for (int i = 0; i < 16; i++) WriteH(r.getRoomSlot(i).bar1);
	}
}