package game.network.protocol.game.ACK;

import core.models.*;

public class BATTLE_DINO_ESCAPE_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	protected RoomSlot s;
	public BATTLE_DINO_ESCAPE_ACK(Room r, RoomSlot s)
	{
		super(true);
		this.r = r;
		this.s = s;
	}
	@Override
	public void writeImpl()
	{
		WriteH(r.redDino);
		WriteH(r.blueDino);
		WriteD(s.id); //slot
		WriteC(s.dinoOnLife); //total escapes
		WriteC(0); //message
	}
}