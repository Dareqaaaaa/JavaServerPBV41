package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class ROOM_CLOSE_SLOT_REQ extends game.network.protocol.GamePacketREQ
{
	protected int slotId;
	protected int error;
	public ROOM_CLOSE_SLOT_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		slotId = ReadC();
		ReadC(); //0
		ReadC(); //0
		ReadC();
	}
	@Override
	public void runImpl()
	{
		Room r = client.getRoom();
		Player c = client.getPlayer();
		if (r != null && c != null && c.id == r.LIDER)
		{
			switch (r.getSlotState(slotId))
			{
				case EMPTY:
				{
					r.changeState(slotId, SlotState.CLOSE, true);
					break;
				}
				case CLOSE:
				{
					if (r.stage4v4 == 1 || r.special == 6 || r.special == 9)
					{
						int slots = 0;
						for (int i : slotId % 2 == 0 ? r.RED_TEAM : r.BLUE_TEAM)
							if (r.getSlotState(i).ordinal() != 1)
								slots++;
						if (((r.special == 6 || r.special == 9) && slotId < 8 && slots < 4) || slots < 4)
							r.changeState(slotId, SlotState.EMPTY, true);
						else
							error = 0x80000401;
					}
					else
					{
						r.changeState(slotId, SlotState.EMPTY, true);
					}
					break;
				}
	            case SHOP:
	            case INFO:
	            case CLAN:
	            case INVENTORY:
	            case OUTPOST:
	            case NORMAL:
				case READY:
				{
					Player p = r.getPlayerBySlot(slotId);
					if (p != null && p.room_id != -1)
					{
						Channel ch = client.getChannel();
						if (c.rank == 53 || c.access_level.ordinal() > 0 || p.rank < 53)
						{
							boolean sucess = r.REMOVER_JOGADOR(p, true, true);
							if (sucess)
							{
								p.connection.sendPacket(new SERVER_MESSAGE_KICK_PLAYER_ACK());
								if (ch != null)
									ch.ADICIONAR_JOGADOR(p);
								p.room_id = -1;
								r.changeState(slotId, SlotState.EMPTY, !sucess);
							}
						}
						else
						{
							error = 0x80000401;
						}
					}
					else
					{
						error = 0x80000401;
					}
					break;
				}
				case LOAD:
				case RENDEZVOUS:
				case PRESTART:
				case BATTLE_READY:
				case BATTLE:
				{
					error = 0x80000401; //EVENT_ERROR_ROOM_NO_AUTHORITY
					break;
				}
			}
		}
		sendPacket(new ROOM_CLOSE_SLOT_ACK(error)); 
	}
}