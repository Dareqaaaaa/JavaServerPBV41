package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class ROOM_CHANGE_SLOT_REQ extends game.network.protocol.GamePacketREQ
{
	protected int team;
	public ROOM_CHANGE_SLOT_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		team = ReadD();
	}
	@Override
	public void runImpl()
	{
		Room r = client.getRoom();
		Player p = client.getPlayer();
		if (r != null && p != null)
		{
			RoomSlot o = r.getSlotByPID(p.id);
			if (o != null && o.id % 2 != team && o.state != SlotState.READY)
			{
				synchronized (o)
				{
					if (!p.changeSlot)
		            {
						p.changeSlot = true;
						RoomSlot n = r.changeSlot(p, o, SlotState.NORMAL, team), l = r.getSlotByPID(r.LIDER);
						if (n != null && l != null)
						{
							for (int i = 0; i < 16; i++)
							{
								Player m = r.getPlayerBySlot(i);
								if (m != null)
									m.connection.sendPacket(new ROOM_CHANGE_SLOT_ACK(l, o, n));
							}
						}
						p.changeSlot = false;
		            }
					else
					{
						p.changeSlot = false;
					}
				}
			}
		}
	}
}