package game.network.protocol.game.REQ;

import core.enums.*;
import core.log.*;
import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class OUTPOST_ENTER_REQ extends game.network.protocol.GamePacketREQ
{
	public OUTPOST_ENTER_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		Logger.gI().info("error", null, NetworkUtil.printData(String.format(" Outpost enter: 0x%02X [int: %d]", opcode, opcode), buf), getClass());
	}
	@Override
	public void runImpl()
	{
		Room r = client.getRoom();
		Player p = client.getPlayer();
		if (r != null && p != null && r.getSlotState(p).ordinal() < 9)
			r.changeState(p, SlotState.OUTPOST, true);
		sendPacket(new OUTPOST_ENTER_ACK());
	}
}