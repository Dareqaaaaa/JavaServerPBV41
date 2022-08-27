package game.network.protocol.game.REQ;

import core.models.*;
import game.network.protocol.game.ACK.*;

public class CLAN_WAR_CREATE_TEAM_REQ extends game.network.protocol.GamePacketREQ
{
	protected ClanFronto MATCH; 
	protected int formacao;
	public CLAN_WAR_CREATE_TEAM_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		formacao = ReadC();
	}
	@Override
	public void runImpl()
	{
		try
		{
			Player p = client.getPlayer();
			Channel ch = client.getChannel();
			if (p != null && ch != null)
			{
				synchronized (this)
				{
					if (!ch.JOGADOR_EXISTECF(p.id))
					{
						for (int i = 0; i < ch.max_cf; i++)
						{
							if (ch.BUSCAR_CF(i) == null)
							{
								MATCH = new ClanFronto(i, formacao, p.clan_id, p.channel_id, p.server_id, p.id);
								p.cf_id = MATCH.id;
								p.cf_slot = MATCH.ADICIONAR_JOGADOR(p.id);
								ch.CLANFRONTOS.put(MATCH.id, MATCH);
								break;
							}
						}
						if (MATCH != null)
							sendPacket(new CLAN_WAR_CREATE_TEAM_ACK(MATCH, 0));
						else
							sendPacket(new CLAN_WAR_CREATE_TEAM_ACK(null, 0x80001088));
					}
					else
					{
						sendPacket(new CLAN_WAR_CREATE_TEAM_ACK(null, 0x80001089));
					}
				}
			}
			else
			{
				sendPacket(new CLAN_WAR_CREATE_TEAM_ACK(null, 0x80001089));
			}
		}
		catch (Exception e)
		{
			sendPacket(new CLAN_WAR_CREATE_TEAM_ACK(null, 0x80001089));
		}
	}
}