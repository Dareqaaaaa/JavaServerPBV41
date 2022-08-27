package game.network.protocol.game.ACK;

import java.util.*;

import core.models.*;

public class ROOM_BALANCE_TEAM_ACK extends game.network.protocol.GamePacketACK
{
	protected int leader;
	protected int type;
	protected List<RoomSlot> sT;
	public ROOM_BALANCE_TEAM_ACK(int leader, int type, List<RoomSlot> sT)
	{
		super(true);
		this.leader = leader;
		this.type = type;
		this.sT = sT;
	}
	@Override
	public void writeImpl()
	{
        WriteC(type);
        WriteC(leader);
        WriteC(sT.size());
        for (RoomSlot slot : sT)
        {
        	WriteC(slot.oldSlot.id);
        	WriteC(slot.newSlot.id);
        	WriteC(slot.oldSlot.state.ordinal());
        	WriteC(slot.newSlot.state.ordinal());
        }
	}
}