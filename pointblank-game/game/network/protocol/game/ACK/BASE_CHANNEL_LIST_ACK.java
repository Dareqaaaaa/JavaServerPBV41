package game.network.protocol.game.ACK;

import java.util.*;

import core.models.*;
import core.xml.*;

public class BASE_CHANNEL_LIST_ACK extends game.network.protocol.GamePacketACK
{
	protected List<Channel> channels;
	public BASE_CHANNEL_LIST_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		GameServerXML g = GameServerXML.gI();
		channels = g.getChannels(conn.serverIndex);
		WriteD(channels.size());
		WriteD(g.getServer(conn.serverIndex).channel_players);
		for (Channel c : channels)
			WriteD(c.CONTADOR_DE_JOGADORES());
		channels.clear();
	}
}