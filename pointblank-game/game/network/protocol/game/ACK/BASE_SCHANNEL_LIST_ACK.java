package game.network.protocol.game.ACK;

import core.models.*;
import core.utils.*;
import core.xml.*;
import game.network.protocol.*;

public class BASE_SCHANNEL_LIST_ACK extends GamePacketACK
{
	public BASE_SCHANNEL_LIST_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		GameServerXML g = GameServerXML.gI();
		WriteD(conn.id);
		WriteB(conn.getIPBytes());
		WriteH(conn.SECURITY_KEY);
		WriteH(conn.HASHCODE);
		for (Channel ch : g.getChannels(conn.serverIndex))
			WriteC(ch.type.ordinal());
		WriteC(1);
		WriteD(g.servers.size());
		for (GameServerInfo srv : g.servers)
		{
			WriteD(srv.active ? 1 : 0);
			WriteB(srv.ip);
			WriteH(srv.port);
			WriteC(srv.type.ordinal());
			WriteH(srv.max_players);
			WriteD(AccountSyncer.gI().SERVERSIZE(srv.id));
		}
		WriteB(NetworkUtil.hexStringToByteArray("00 00 01 00 00 00 00 00 00"));
	}
}