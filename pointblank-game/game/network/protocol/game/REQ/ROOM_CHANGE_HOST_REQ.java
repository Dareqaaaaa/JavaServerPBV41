package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class ROOM_CHANGE_HOST_REQ extends game.network.protocol.GamePacketREQ
{
	protected int slot;
	public ROOM_CHANGE_HOST_REQ(int opcode)
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
		Room r = client.getRoom();
		if (r != null)
		{
			if (r.LIDER == client.pId && r._getMaster() != slot && r.rstate == RoomState.READY)
			{
				if (r.setNewLeader(slot, true))
				{
					for (int i = 0; i < 16; i++)
					{
						Player m = r.getPlayerBySlot(i);
						if (m != null)
							m.connection.sendPacket(new ROOM_CHANGE_HOST_ACK(slot));
					}
					r.updateInfo();
				}
			}
		}
	}
}