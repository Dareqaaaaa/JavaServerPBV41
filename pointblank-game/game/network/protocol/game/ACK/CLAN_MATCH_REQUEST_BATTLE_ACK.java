package game.network.protocol.game.ACK;

import core.models.*;
import core.utils.*;

public class CLAN_MATCH_REQUEST_BATTLE_ACK extends game.network.protocol.GamePacketACK
{
	protected ClanFronto cf;
	protected Clan clan;
	public CLAN_MATCH_REQUEST_BATTLE_ACK(ClanFronto cf)
	{
		super(true);
		this.cf = cf;
		if (cf != null)
		{
			clan = ck.getClanId(cf.clan_id);
			if (clan == null)
				runner = false;
		}
		else
		{
			runner = false;
		}
	}
	@Override
	public void writeImpl()
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
	    WriteC(EssencialUtil.gI().BUSCAR_RANK(cf.lider));
	    WriteS(EssencialUtil.gI().BUSCAR_NICK(cf.lider), 33);
		WriteQ(clan.owner);
		WriteC(1); //t
	}
}