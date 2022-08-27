package game.network.protocol.game.REQ;

import game.network.protocol.game.ACK.*;

public class ROOM_GET_PLAYERINFO_REQ extends game.network.protocol.GamePacketREQ
{
	protected int slot;
	public ROOM_GET_PLAYERINFO_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		slot = ReadD();
	}
	@Override
	public void runImpl()
	{
		sendPacket(new ROOM_GET_PLAYERINFO_ACK(client.getRoom(), slot));
	}
}