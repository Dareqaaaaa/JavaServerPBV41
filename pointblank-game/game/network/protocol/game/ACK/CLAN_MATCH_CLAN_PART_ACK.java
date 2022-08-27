package game.network.protocol.game.ACK;

import java.util.*;

import core.models.*;
import core.utils.*;

public class CLAN_MATCH_CLAN_PART_ACK extends game.network.protocol.GamePacketACK
{
	protected List<ClanFronto> match;
	protected int error;
	public CLAN_MATCH_CLAN_PART_ACK(List<ClanFronto> match, int error)
	{
		super(true);
		this.match = match;
		this.error = error;
	}
	@Override
	public void writeImpl()
	{
		WriteC(match.size());
		WriteH(error); //1
		WriteH(match.size());
		for (ClanFronto cf : match)
		{
			Clan clan = ck.getClanId(cf.clan_id);
			WriteC(match.indexOf(cf));
			WriteH(cf.channel_id + 10);
			WriteH(cf.channel_id + 10);
			WriteH(cf.server_id);
			WriteC(cf.formacao);
			WriteC(cf.PLAYERS());
			WriteD(0); //state?
			WriteC(0);
		    WriteC(EssencialUtil.gI().BUSCAR_RANK(cf.lider));
		    WriteS(EssencialUtil.gI().BUSCAR_NICK(cf.lider), 33);
            WriteC(0x55); //Skill
            WriteS(clan.name, 17);
            WriteQ(cf.lider);
            WriteC(1);
		}
	}
}