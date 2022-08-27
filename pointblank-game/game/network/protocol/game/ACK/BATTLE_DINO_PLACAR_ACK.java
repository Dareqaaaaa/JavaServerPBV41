package game.network.protocol.game.ACK;

import core.models.*;

public class BATTLE_DINO_PLACAR_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	public BATTLE_DINO_PLACAR_ACK(Room r)
	{
		super(true);
		this.r = r;
	}
	@Override
	public void writeImpl()
	{
		WriteH(r.redDino);
		WriteH(r.blueDino);
	}
}