package game.network.protocol.game.ACK;

import core.models.*;
import core.utils.*;

public class LOBBY_GET_ROOMLIST_ACK extends game.network.protocol.GamePacketACK
{
	protected Channel ch;
	public LOBBY_GET_ROOMLIST_ACK(Channel ch)
	{
		super(true);
		this.ch = ch;
	}
	@Override
	public void writeImpl()
	{
		if (ch == null)
		{
			runner = false;
			return;
		}
		WriteD(ch.SALAS.size());
		WriteD(0);
		WriteD(ch.SALAS.size());
		for (Room r : ch.SALAS.values())
		{
			if (r != null)
			{
				WriteD(r.id);
				WriteS(r.name, 23);
				WriteH(r.map);
				WriteC(r.stage4v4);
				WriteC(r.type.ordinal());
				WriteC(r.rstate.ordinal() > 1 ? 1 : 0);
				WriteC(r.getPlayers().size());
				WriteC(r.slots());
				WriteC(r.ping);
				WriteC(r.allWeapons);
				WriteC(r.restrictions());
				WriteC(r.special);
			}
		}
		WriteD(ch.JOGADORES.size());
		WriteD(0);
		WriteD(ch.JOGADORES.size());
		for (long id : ch.JOGADORES)
		{
			Player p = AccountSyncer.gI().get(id);
			if (p != null && p.status() > 0)
			{
				Clan c = ck.getClanNotNull(p.clan_id);
				WriteD(p.channelIdx = ch.JOGADORES.indexOf(id));
				WriteD(c.logo);
				WriteS(c.name, 17);
	    		WriteH(p.rank());
				WriteS(p.name, 33);
				WriteC(p.color);
				WriteC(p.country.value);
				if (c.nuller) c = null;
			}
		}
	}
}