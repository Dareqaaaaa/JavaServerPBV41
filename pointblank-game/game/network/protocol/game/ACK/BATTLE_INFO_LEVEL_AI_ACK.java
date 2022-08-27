package game.network.protocol.game.ACK;

import core.models.*;

public class BATTLE_INFO_LEVEL_AI_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	public BATTLE_INFO_LEVEL_AI_ACK(Room r)
	{
		super(true);
		this.r = r;
	}
	@Override
	public void writeImpl()
	{
		WriteC(r.aiLevel);
		for (int i = 0; i < 16; i++)
			WriteD(1);
	}
}