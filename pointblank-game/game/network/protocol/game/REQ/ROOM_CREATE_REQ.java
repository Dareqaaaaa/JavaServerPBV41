package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.manager.*;
import game.network.protocol.game.ACK.*;

public class ROOM_CREATE_REQ extends game.network.protocol.GamePacketREQ
{
	protected Player p;
	protected Room r;
	protected int mask;
	protected int slot;
	protected int slots;
	public ROOM_CREATE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		p = client.getPlayer();
		if (p != null && p.status() > 0 && client.getRoom() == null && (setting.room_create || p.access_level == AccessLevel.MASTER_PLUS))
		{
			Channel c = client.getChannel();
			if (c != null)
			{
				if (c.SALAS.size() >= c.max_rooms)
				{
					sendPacket(new SERVER_MESSAGE_ANNOUNCE_ACK("Room limit has been reached, try again later. '" + c.SALAS.size() + "'"));
					return;
				}
				else if (!c.LIDER_NA_SALA(p.id))
				{
					for (int i = 0; i < c.max_rooms; i++)
					{
						if (c.BUSCAR_SALA(i) == null)
						{
							mask = ReadD();
							if (mask == 0)
							{
								if (p.delay == 0)
									p.delay = System.currentTimeMillis();
								else
								{
									long interval = System.currentTimeMillis() - p.delay;
									if (interval <= 500)
									{
										p.tentativa_erro++;
										if (p.tentativa_erro >= 4)
										{
											client.close(new BASE_KICK_ACCOUNT_ACK(p.connection, KickType.O_JOGO_SERA_FINALIZADO_POR_SOLICITAÇÃO_DO_SERVIDOR));
											db.updateAccountStatusAndBanExpirates(p.id, false, date.getMinutesNow(10));
										}
										break;
									}
									else
									{
										p.delay = 0;
									}
								}
								r = new Room(i, c.id, c.server_id, client.id);
								r.name = ReadS(23);
								r.map = ReadH();
								r.stage4v4 = ReadC();
								r.type = ModesEnum.values()[ReadC()];								
								ReadC();
								ReadC();
								slots = ReadC(); //8-10-16
								r.DEFINIR_SLOTS(r.stage4v4 == 1 ? 8 : slots);
								ReadC();
								r.allWeapons = ReadC();
								r.randomMap = ReadC();
								r.special = ReadC();
								ReadS(33);
								r.killMask = ReadC();
								ReadC();
								ReadC();
								ReadC();
								r.limit = ReadC();
								r.seeConf = ReadC();
								r.balanceamento = ReadH();
								r.passwd = ReadS(4);
								if (r.special == 6 || r.special == 9) 
								{
									if (buf.isReadable())
									{
										r.aiCount = ReadC();
										r.aiLevel = ReadC();
									}
									else
									{
										r.aiCount = 8;
										r.aiLevel = 1;
									}
								}
								if (c.type == ChannelServerEnum.CHANNEL_TYPE_CLAN)
									if (r.special == 6 || r.special == 9)
										return;
								slot = r.ADICIONAR_JOGADOR(p);
								if (slot >= 0)
								{
									r.LIDER = p.id;
									p.room_id = i;
									if (r.allWeapons == 128)
										r.isPorrada = true;
									r.badName();
									r.badConfig();
									c.SALAS.put(i, r);
									BattleServerManager.gI().ADD_ROOM(r, slot);
								}
								else
								{
									r = null;
								}
							}
							break;
						}
					}
				}
			}
		}
	}
	@Override
	public void runImpl()
	{
		if (r != null)
		{
			sendPacket(new ROOM_CREATE_ACK(r, 0));
			sendPacket(new ROOM_GET_SLOT_PLAYER_ACK(p, r.getRoomSlot(slot)));
			sendPacket(new ROOM_GET_SLOTS_ACK(r));
		}
		else
		{
			sendPacket(new ROOM_CREATE_ACK(null, 0x80000000));
		}
	}
}