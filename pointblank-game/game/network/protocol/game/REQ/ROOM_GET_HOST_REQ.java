package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class ROOM_GET_HOST_REQ extends game.network.protocol.GamePacketREQ
{
	protected boolean requisito;
	public ROOM_GET_HOST_REQ(int opcode)
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
		Player p = client.getPlayer();
		Room r = client.getRoom();
		if (p != null && r != null)
		{
			requisito = p.rank == 53 || p.access_level == AccessLevel.GM_NORMAL || p.access_level == AccessLevel.MASTER_PLUS;
			if (r.LIDER != p.id && (r.rstate == RoomState.READY || requisito))
			{
				if (r.last_host != p.slot)
				{
					r.last_host = p.slot;
					if (!r.listHost.containsKey(p.id))
						r.listHost.put(p.id, p.slot);
					if (r.listHost.size() >= r.getPlayers().size())
						requisito = true;
					if (requisito)
						requisito = r.setNewLeader(p.slot, true);
					for (int i = 0; i < 16; i++)
					{
						Player m = r.getPlayerBySlot(i);
						if (m != null)
						{
							m.connection.sendPacket(new ROOM_GET_HOST_ACK(p.slot));
							if (requisito)
								m.connection.sendPacket(new ROOM_CHANGE_HOST_ACK(p.slot));
						}
					}
					if (requisito)
						r.updateInfo();
				}
			}
		}
	}
}