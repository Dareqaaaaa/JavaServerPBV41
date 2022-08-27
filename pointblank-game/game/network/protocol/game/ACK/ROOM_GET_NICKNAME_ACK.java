package game.network.protocol.game.ACK;

import core.models.*;

public class ROOM_GET_NICKNAME_ACK extends game.network.protocol.GamePacketACK
{
	protected Player p;
	public ROOM_GET_NICKNAME_ACK(Player p)
	{
		super(true);
		this.p = p;
	}
	@Override
	public void writeImpl()
	{
		WriteD(p.slot);
		WriteS(p.name, 33);
		WriteC(p.color);
	}
}