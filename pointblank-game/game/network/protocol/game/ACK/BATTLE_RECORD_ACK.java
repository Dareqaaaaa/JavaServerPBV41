package game.network.protocol.game.ACK;

import core.models.*;

public class BATTLE_RECORD_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	public BATTLE_RECORD_ACK(Room r)
	{
		super(true);
		this.r = r;
	}
	@Override
	public void writeImpl()
	{
        WriteH(r.redKills);
        WriteH(r.blueKills);
        WriteH(r.blueKills);
        WriteH(r.redKills);
	    for (int i = 0; i < 16; i++)
        {
			WriteH(r.getRoomSlot(i).allKills);
			WriteH(r.getRoomSlot(i).allDeaths);
		}
	}
}