package game.network.protocol.game.ACK;

import core.models.*;

public class PLAYER_UPDATE_NICK_ACK extends game.network.protocol.GamePacketACK
{
	protected Player p;
	public PLAYER_UPDATE_NICK_ACK(Player p)
	{
		super(true);
		this.p = p;
	}
	@Override
	public void writeImpl()
	{
		WriteC(33);
		WriteS(p.name, 33);
		WriteC(p.color);
	}
}