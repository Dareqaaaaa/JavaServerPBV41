package game.network.protocol.game.ACK;

import core.models.*;

public class ROOM_CHANGE_SLOT_ACK extends game.network.protocol.GamePacketACK
{
	protected RoomSlot l;
	protected RoomSlot o;
	protected RoomSlot n;
	public ROOM_CHANGE_SLOT_ACK(RoomSlot l, RoomSlot o, RoomSlot n)
	{
		super(true);
		this.l = l;
		this.o = o;
		this.n = n;
	}
	@Override
	public void writeImpl()
	{
		WriteC(0); //0 - NORMAL | 1 - OS TIMES FORAM AJUSTADOS PARA IGUALAR OS JOGADORES | 2 - O DONO DA SALA TROCOU DE TIME
        WriteC(l.id);
        WriteC(1);
        WriteC(o.id);
        WriteC(n.id);
        WriteC(o.state.ordinal());
        WriteC(n.state.ordinal());
	}
}