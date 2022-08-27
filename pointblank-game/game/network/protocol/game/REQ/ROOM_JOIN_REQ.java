package game.network.protocol.game.REQ;

import core.models.*;
import game.network.protocol.game.ACK.*;

public class ROOM_JOIN_REQ extends game.network.protocol.GamePacketREQ
{
	protected int roomId;
	protected String passwd;
	public ROOM_JOIN_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		roomId = ReadD();
		passwd = ReadS(4);
	}
	@Override
	public void runImpl()
	{
		try
		{
			Player p = client.getPlayer();
    		Channel c = client.getChannel();
			if (p == null || c == null)
			{
				sendPacket(new ROOM_JOIN_ACK(null, -1, 0x80001004));
				return;
			}
			Room r = c.BUSCAR_SALA(roomId);
			if (r == null)
			{
				sendPacket(new ROOM_JOIN_ACK(null, -1, 0x80001004));
				return;
			}
			if (r.getLeader() == null)
			{
				sendPacket(new ROOM_JOIN_ACK(null, -1, 0x80001004));
				return;
			}
			if (r.kikados.contains(client.pId) || client.getRoom() != null || r.LIDER == p.id)
			{
				sendPacket(new ROOM_JOIN_ACK(null, -1, 0x8000100C));
				return;
			}
			if (r.passwd.length() > 0 && !r.passwd.equals(passwd) && p.rank != 53 && p.rank != 54 && p.access_level.ordinal() == 0)
			{
				sendPacket(new ROOM_JOIN_ACK(null, -1, 0x80001005));
				return;
			}
			if (r.limit == 1 && r.rstate.ordinal() > 1 && p.access_level.ordinal() == 0)
			{
				sendPacket(new ROOM_JOIN_ACK(null, -1, 0x80001013)); //0x80001014 - Rank insuficiente
				return;
			}
			int slot = r.ADICIONAR_JOGADOR(p);
			if (slot >= 0)
			{
				RoomSlot s = r.getRoomSlot(slot);
				if (s != null)
				{
					for (int i = 0; i < 16; i++)
					{
						Player m = r.getPlayerBySlot(i);
						if (m != null && i != slot)
							m.connection.sendPacket(new ROOM_GET_SLOT_PLAYER_ACK(p, s));
					}
					sendPacket(new ROOM_JOIN_ACK(r, slot, 0));
					return;
				}
				else
				{
					sendPacket(new ROOM_JOIN_ACK(null, -1, 0x80001003));
					return;
				}
			}
			else
			{
				sendPacket(new ROOM_JOIN_ACK(null, -1, 0x80001003));
				return;
			}
		}
		catch (Exception e)
		{
			sendPacket(new ROOM_JOIN_ACK(null, -1, 0x80001004));
		}
	}
}