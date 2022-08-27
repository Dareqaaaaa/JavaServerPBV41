package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class PROFILE_ENTER_REQ extends game.network.protocol.GamePacketREQ
{
	public PROFILE_ENTER_REQ(int opcode)
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
			r.changeState(p, SlotState.INFO, true);
		sendPacket(new PROFILE_ENTER_ACK());
	}
}