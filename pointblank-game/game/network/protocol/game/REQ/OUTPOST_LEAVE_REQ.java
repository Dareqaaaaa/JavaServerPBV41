package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class OUTPOST_LEAVE_REQ extends game.network.protocol.GamePacketREQ
{
	public OUTPOST_LEAVE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
	}
	@Override
	public void runImpl()
	{
		Room r = client.getRoom();
		Player p = client.getPlayer();
		if (r != null && p != null && r.getSlotState(p).ordinal() < 9)
			r.changeState(p, SlotState.NORMAL, true);
		sendPacket(new OUTPOST_LEAVE_ACK());
	}
}