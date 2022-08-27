package game.network.protocol.game.ACK;

import java.util.*;

import core.models.*;

public class ROOM_CHANGE_SLOTS_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	protected int leader;
	protected List<Integer> slots;
	public ROOM_CHANGE_SLOTS_ACK(Room r, int leader, List<Integer> slots)
	{
		super(true);
		this.r = r;
		this.leader = leader;
		this.slots = slots;
	}
	@Override
	public void writeImpl()
	{
        WriteC(2);
        WriteC(leader);
        WriteC(slots.size());
        for (int i : slots)
        {
        	WriteC(r.getNewSlot(i));
        	WriteC(i);
        	WriteC(r.getSlotState(r.getNewSlot(i)).ordinal());
        	WriteC(r.getSlotState(i).ordinal());
        }
	}
}