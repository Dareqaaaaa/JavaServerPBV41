package game.network.protocol.game.REQ;

import core.enums.RoomState;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class ROOM_CHANGE_PASSWD_REQ extends game.network.protocol.GamePacketREQ
{
	protected String passwd;
	public ROOM_CHANGE_PASSWD_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		passwd = ReadS(4);
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		Room r = client.getRoom();
		if (p != null && r != null)
		{
			if (p.id == r.LIDER && (r.rstate == RoomState.READY || r.rstate == RoomState.COUNTDOWN))
			{
				r.passwd = passwd;
				for (int i = 0; i < 16; i++)
				{
					Player m = r.getPlayerBySlot(i);
					if (m != null)
						m.connection.sendPacket(new ROOM_CHANGE_PASSWD_ACK(passwd));
				}
			}
		}
	}
}