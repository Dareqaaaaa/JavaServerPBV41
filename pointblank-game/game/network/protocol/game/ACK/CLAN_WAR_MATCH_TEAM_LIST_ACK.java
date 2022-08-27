package game.network.protocol.game.ACK;

import java.util.*;

import core.models.*;
import core.utils.*;

public class CLAN_WAR_MATCH_TEAM_LIST_ACK extends game.network.protocol.GamePacketACK
{
	protected List<ClanFronto> match;
	protected int error;
	public CLAN_WAR_MATCH_TEAM_LIST_ACK(List<ClanFronto> match, int error)
	{
		super(true);
		this.match = match;
		this.error = error;
	}
	@Override
	public void writeImpl()
	{
		WriteH(match.size()); //Quantidades de clans na lista
		WriteD(error);
		for (ClanFronto cf : match)
		{
			Clan clan = ck.getClanId(cf.clan_id);
			WriteC(match.indexOf(cf)); //id?
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
            WriteH(0);
            WriteH(17513); //???
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
}