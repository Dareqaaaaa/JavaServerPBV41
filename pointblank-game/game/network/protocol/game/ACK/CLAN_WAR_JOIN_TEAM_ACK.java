package game.network.protocol.game.ACK;

import core.models.*;
import core.utils.*;

public class CLAN_WAR_JOIN_TEAM_ACK extends game.network.protocol.GamePacketACK
{
	protected Clan clan;
	protected ClanFronto cf;
	protected int error;
	public CLAN_WAR_JOIN_TEAM_ACK(ClanFronto cf, int error)
	{
		super(true);
		this.cf = cf;
		this.error = error;
		if (cf != null) clan = ck.getClanId(cf.clan_id);
		if (clan == null) error = 0x8000105B;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		if (error == 0)
		{
			WriteH(cf.id);
			WriteH(cf.channel_id + 10);
			WriteH(cf.channel_id + 10);
			WriteH(cf.server_id);
			WriteC(cf.formacao);
			WriteC(cf.PLAYERS());
			WriteD(0);
			WriteC(0);
			WriteD(clan.id);
			WriteC(clan.rank);
			WriteD(clan.logo);
			WriteS(clan.name, 17);
			WriteH(0); //?
			WriteH(17513); //?
			WriteC(0);
	        WriteC(EssencialUtil.gI().BUSCAR_RANK(cf.lider));
		    WriteS(EssencialUtil.gI().BUSCAR_NICK(cf.lider), 33);
			for (RoomSlot sM : cf.SLOT)
			{
				Player pC = AccountSyncer.gI().get(sM.player_id);
				if (pC != null && pC.connection != null && sM.player_id > 0)
				{
					WriteQ(sM.player_id);
					WriteC(sM.id);
					WriteC(pC.rank);
					WriteS(pC.name, 33);
				}
				else
				{
					WriteB(new byte[43]);
				}
			}
		}
	}
}