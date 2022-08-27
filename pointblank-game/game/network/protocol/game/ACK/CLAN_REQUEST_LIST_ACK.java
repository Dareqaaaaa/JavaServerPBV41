package game.network.protocol.game.ACK;

import java.util.*;

import core.manager.*;
import core.models.*;
import core.utils.*;

public class CLAN_REQUEST_LIST_ACK extends game.network.protocol.GamePacketACK
{
	protected List<PlayerInvites> invites;
	public CLAN_REQUEST_LIST_ACK(int clan_id)
	{
		super(true);
		invites = ClanInviteManager.gI().getInvitesClan(clan_id);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
		WriteC(0); //limite?
		WriteC(invites.size());
		for (PlayerInvites inv : invites)
		{
			WriteQ(inv.player_id);
			WriteS(EssencialUtil.gI().BUSCAR_NICK(inv.player_id), 33);
			WriteC(EssencialUtil.gI().BUSCAR_RANK(inv.player_id));
			WriteD(inv.date);
		}
		invites = null;
	}
}