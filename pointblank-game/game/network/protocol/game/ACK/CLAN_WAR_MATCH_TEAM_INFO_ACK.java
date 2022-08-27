package game.network.protocol.game.ACK;

import core.models.*;
import core.utils.*;

public class CLAN_WAR_MATCH_TEAM_INFO_ACK extends game.network.protocol.GamePacketACK
{
	protected Clan c;
	protected int error;
	protected int rank;
	protected String name;
	public CLAN_WAR_MATCH_TEAM_INFO_ACK(Clan c)
	{
		super(true);
		this.c = c;
		if (c == null) error = 0x80000000;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		if (c != null)
		{
			WriteD(c.id);
			WriteS(c.name, 17);
			WriteC(c.rank);
			WriteC(c.membros.size());
			WriteC(c.vagas);
			WriteD(c.data);
			WriteD(c.logo);
			WriteC(c.color);
			WriteC(c.nivel().ordinal());
			WriteD(c.exp);
	        WriteH(c.rating);
	        WriteH(c.top_rating);
	        WriteQ(c.owner);
	        WriteS(EssencialUtil.gI().BUSCAR_NICK(c.owner), 33);
	        WriteC(EssencialUtil.gI().BUSCAR_RANK(c.owner));
	        WriteT(c.info, 255);
		}
	}
}