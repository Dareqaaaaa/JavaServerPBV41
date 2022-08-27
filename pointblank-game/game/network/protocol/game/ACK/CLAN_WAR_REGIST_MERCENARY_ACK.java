package game.network.protocol.game.ACK;

import core.models.*;
import core.utils.*;

public class CLAN_WAR_REGIST_MERCENARY_ACK extends game.network.protocol.GamePacketACK
{
	protected ClanFronto cf;
	protected Clan clan;
	public CLAN_WAR_REGIST_MERCENARY_ACK(ClanFronto cf)
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
		WriteH(cf.channel_id + 10);
		WriteH(cf.server_id);
		WriteC(cf.formacao);
		WriteC(cf.PLAYERS());
		WriteD(0);
		WriteC(0);
	    WriteS(EssencialUtil.gI().BUSCAR_NICK(cf.lider), 33);
        WriteC(EssencialUtil.gI().BUSCAR_RANK(cf.lider));
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