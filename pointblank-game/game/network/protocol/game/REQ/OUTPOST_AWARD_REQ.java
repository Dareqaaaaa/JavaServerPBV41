package game.network.protocol.game.REQ;

import game.network.protocol.game.ACK.*;

public class OUTPOST_AWARD_REQ extends game.network.protocol.GamePacketREQ
{
	public OUTPOST_AWARD_REQ(int opcode)
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
		sendPacket(new OUTPOST_AWARD_ACK(0));
	}
}