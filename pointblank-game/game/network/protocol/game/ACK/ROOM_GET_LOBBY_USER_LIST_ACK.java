package game.network.protocol.game.ACK;

import java.util.*;

import core.models.*;

public class ROOM_GET_LOBBY_USER_LIST_ACK extends game.network.protocol.GamePacketACK
{
    protected List<Player> list;
    public ROOM_GET_LOBBY_USER_LIST_ACK(List<Player> list)
    {
        super(true);
        this.list = list;
    }
    @Override
    public void writeImpl()
    {
    	WriteD(list.size());
    	for (Player p : list)
    	{
    		WriteD(p.channelIdx);
    		WriteD(p.rank());
			WriteC(p.name.length() + 1);
			WriteS(p.name, p.name.length() + 1);
    	}
    	list = null;
    }
}