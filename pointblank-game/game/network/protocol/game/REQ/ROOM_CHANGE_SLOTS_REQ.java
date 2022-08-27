package game.network.protocol.game.REQ;

import game.network.protocol.game.ACK.*;

import java.util.*;

import core.enums.*;
import core.models.*;

public class ROOM_CHANGE_SLOTS_REQ extends game.network.protocol.GamePacketREQ
{
	public ROOM_CHANGE_SLOTS_REQ(int opcode)
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
		synchronized (this)
		{
			Player p = client.getPlayer();
			Room r = client.getRoom();
			if (p != null && r != null)
			{
				if (r.rstate == RoomState.READY && r.LIDER == p.id)
				{
					List<Integer> slots = new ArrayList<Integer>();
					for (int i : r.RED_TEAM)
						slots.add(r.changeSlot(r.getNewSlot(i), i, true));
					if (slots.size() > 0)
					{
						int leader = r._getMaster();
						for (int i = 0; i < 16; i++)
						{
							Player m = r.getPlayerBySlot(i);
							if (m != null)
								m.connection.sendPacket(new ROOM_CHANGE_SLOTS_ACK(r, leader, slots));
						}
						r.updateInfo();
					}
					slots = null;
				}
			}
		}
	}
}