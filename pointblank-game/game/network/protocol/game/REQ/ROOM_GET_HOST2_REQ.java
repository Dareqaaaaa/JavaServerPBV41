package game.network.protocol.game.REQ;

import game.network.protocol.game.ACK.*;

public class ROOM_GET_HOST2_REQ extends game.network.protocol.GamePacketREQ
{
	public ROOM_GET_HOST2_REQ(int opcode)
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
		if (client.getPlayer() != null && client.getRoom() != null)
			sendPacket(new ROOM_GET_HOST2_ACK());
	}
}