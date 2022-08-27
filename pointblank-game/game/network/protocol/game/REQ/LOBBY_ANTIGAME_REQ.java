package game.network.protocol.game.REQ;

import game.network.protocol.game.ACK.*;

public class LOBBY_ANTIGAME_REQ extends game.network.protocol.GamePacketREQ
{
	public LOBBY_ANTIGAME_REQ(int opcode)
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
		sendPacket(new LOBBY_ANTIGAME_ACK(0));
	}
}