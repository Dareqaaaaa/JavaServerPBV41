package game.network.protocol.game.REQ;

import game.network.protocol.game.ACK.*;

import java.util.*;

import core.models.*;

public class LOBBY_QUICKJOIN_ROOM_REQ extends game.network.protocol.GamePacketREQ
{
	protected Player p;
	protected Channel ch;
	public LOBBY_QUICKJOIN_ROOM_REQ(int opcode)
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
		try
		{
			p = client.getPlayer();
			ch = client.getChannel();
			if (p != null && ch != null && client.getRoom() == null)
			{
				BUSCAR_SALA();
			}
			else
			{
				sendPacket(new LOBBY_QUICKJOIN_ACK(0x80000000));
			}
		}
		catch (Exception e)
		{
			sendPacket(new LOBBY_QUICKJOIN_ACK(0x80000000));
		}
	}
	public void BUSCAR_SALA() throws Exception
	{
		if (ch.SALAS.size() > 0)
		{
			Room r = ch.BUSCAR_SALA(new Random().nextInt(ch.SALAS.size()));
			if (r != null && !r.kikados.contains(p.id) && r.limit == 0 && r.passwd.isEmpty())
			{
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
			else
			{
				sendPacket(new LOBBY_QUICKJOIN_ACK(0x80000000));
				return;
			}
		}
		else
		{
			sendPacket(new LOBBY_QUICKJOIN_ACK(0x80000000));
			return;
		}
	}
}