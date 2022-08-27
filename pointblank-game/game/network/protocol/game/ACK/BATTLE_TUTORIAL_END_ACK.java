package game.network.protocol.game.ACK;

import core.models.*;

public class BATTLE_TUTORIAL_END_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	public BATTLE_TUTORIAL_END_ACK(Room r)
	{
		super(true);
		this.r = r;
	}
	@Override
	public void writeImpl()
	{
        WriteC(10);
        WriteC(11);
		WriteD(r.timeLost);
	}
}