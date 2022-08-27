package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class CLAN_PROMOTE_MASTER_REQ extends game.network.protocol.GamePacketREQ
{
	protected Player p;
	protected int error = 1; //0x80001060
	public CLAN_PROMOTE_MASTER_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		p = client.getPlayer();
		if (p != null)
		{
			try
			{
				Clan c = ck.getClanId(p.clan_id);
				if (c != null && p.id == c.owner)
				{
					Player mS = EssencialUtil.gI().CARREGAR_JOGADOR_ID(ReadQ(), false, false, false, false);
					if (mS != null)
					{
						if (mS.rank > setting.clan_requerits_rank)
						{
							if (mS.role == ClanRole.CLAN_MEMBER_LEVEL_STAFF)
							{
								mS.clan_id = c.id;
								mS.role = ClanRole.CLAN_MEMBER_LEVEL_MASTER;
								c.owner = mS.id;
								db.updateClanID(mS);
								db.updateRole(mS.id, mS.role.ordinal());
								db.updateClanOwner(c.id, mS.id);
								sendMessage(c, mS, true);
								EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(mS, true, false, true);
								AccountSyncer.gI().UPDATE(mS);					
								for (Player f : ck.getPlayers(c))
								{
									try
									{
										if (f.role == ClanRole.CLAN_MEMBER_LEVEL_MASTER && f.id != mS.id)
										{
											f.role = ClanRole.CLAN_MEMBER_LEVEL_REGULAR;
											db.updateRole(f.id, f.role.ordinal());
											sendMessage(c, f, false);
											EssencialUtil.gI().ATUALIZAR_SALA_AMIGOS_CLAN(f, true, false, true);
											AccountSyncer.gI().UPDATE(f);
										}
										if (f.connection != null)
											f.connection.sendPacket(new CLAN_CREATE_ACK(c, 0, f.gold));
									}
									catch (Exception e)
									{
									}
								}
							}
							else
							{
								error = 0x80001060; //0x80001061
							}
						}
						else
						{
							error = 0x800010B8;
						}
					}
					else
					{
						error = 0x800010B8;
					}
				}
				else
				{
					error = 0x8000105B;
				}
			}
			catch (Exception e)
			{
				error = 0x8000105E;
			}
		}
		else
		{
			error = 0x8000105E;
		}
	}
	@Override
	public void runImpl()
	{
		sendPacket(new CLAN_COMMISSION_MASTER_ACK(error));
		if (p != null && error == 1)
			sendPacket(new CLAN_LEAVE_ACK());
	}
	public void sendMessage(Clan c, Player p, boolean leader)
	{
		if (c != null && p != null)
		{
			PlayerMessage msg = new PlayerMessage(p.id, c.id, 15, NoteType.WEB, leader ? NoteReceive.LIDER_CLAN : NoteReceive.MEMBRO_CLAN, false);
			msg.name = c.name;
			msg.owner_name = p.name;
			msg.texto = "";
			db.CRIAR_MENSAGEM(msg);
			if (msg != null && p.connection != null)
				p.connection.sendPacket(new MESSENGER_NOTE_RECEIVE_ACK(msg, AccountSyncer.gI().get(p.id)));
			msg = null;
		}
	}
}