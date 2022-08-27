package game.network.protocol.game.ACK;

import core.models.*;
import core.utils.*;

public class CLAN_MEMBER_LIST_ACK extends game.network.protocol.GamePacketACK
{
	protected Clan c;
	public CLAN_MEMBER_LIST_ACK(Clan clan)
	{
		super(true);
		c = clan;
		if (c == null)
			c = new Clan(0, true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
		WriteC(0); //Descartar?
		WriteC(c.membros.size());
		for (Player f : ck.getPlayers(c))
		{
			PlayerState skr = EssencialUtil.gI().PLAYER_STATE(f.id);
			WriteQ(f.id);
			WriteS(f.name, 33);
			WriteC(f.rank);
			WriteC(f.role.ordinal());
			WriteC(skr.room_id);
			WriteC(skr.channel_id * 16);
			WriteC(skr.server_id * 16);
			WriteC(skr.state.value);
			WriteD(skr.clan_fronto);
			WriteD(f.clanDate);
			WriteC(f.color);
		}
		if (c.nuller) c = null;
	}
}