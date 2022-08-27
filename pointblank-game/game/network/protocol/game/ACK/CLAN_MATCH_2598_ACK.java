package game.network.protocol.game.ACK;

import core.models.*;
import core.utils.EssencialUtil;

public class CLAN_MATCH_2598_ACK extends game.network.protocol.GamePacketACK
{
	protected Clan c;
	public CLAN_MATCH_2598_ACK(Clan c)
	{
		super(true);
		this.c = c;
	}
	@Override
	public void writeImpl()
	{
        WriteD(c.id); //Clan_Id
        WriteC(0); //Clan_name
        WriteC(1); //Rank
        WriteS(EssencialUtil.gI().BUSCAR_NICK(c.owner), 33); //Lider do ClanFronto
	}
}