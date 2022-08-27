package game.network.protocol.game.ACK;

import core.models.*;
import core.utils.*;
import game.network.protocol.*;

public class CLAN_READ_MEMBERS_ACK extends GamePacketACK
{
	protected Clan c;
	public CLAN_READ_MEMBERS_ACK(Clan c)
	{
		super(true);
		this.c = c;
	}
	@Override
	public void writeImpl()
	{
		WriteC(c.membros.size() > 0 ? c.membros.size() - 1 : 0);
		for (Player f : ck.getPlayers(c))
		{
			if (f != null && f.id != conn.pId)
			{
				PlayerState skr = EssencialUtil.gI().PLAYER_STATE(f.id);
				WriteC(f.name.length() + 1);
				WriteS(f.name, f.name.length() + 1);
				WriteQ(f.id);
				WriteC(skr.room_id);
				WriteC(skr.channel_id * 16);
				WriteC(skr.server_id * 16);
				WriteC(skr.state.value);
				WriteD(skr.clan_fronto);
				WriteC(f.rank);
			}
		}
		if (c.nuller) c = null;
	}
}