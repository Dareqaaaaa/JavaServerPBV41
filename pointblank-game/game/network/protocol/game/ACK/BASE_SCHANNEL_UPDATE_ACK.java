package game.network.protocol.game.ACK;

import core.models.*;
import core.utils.*;
import core.xml.*;

public class BASE_SCHANNEL_UPDATE_ACK extends game.network.protocol.GamePacketACK
{
	protected boolean active;
	protected boolean access;
	protected int players;
	public BASE_SCHANNEL_UPDATE_ACK(boolean access)
	{
		super(true);
		this.access = access;
	}
	@Override
	public void writeImpl()
	{
		GameServerXML g = GameServerXML.gI();
		WriteD(g.servers.size());
		for (GameServerInfo srv : g.servers)
		{
			players = AccountSyncer.gI().SERVERSIZE(srv.id);
			if (players >= srv.max_players) active = false;
			else active = srv.active;
			if (access) active = srv.active;
			WriteD(active ? 1 : 0);
			WriteB(srv.ip);
			WriteH(srv.port);
			WriteC(srv.type.ordinal());
			WriteH(srv.max_players);
			WriteD(players);
		}
	}
}