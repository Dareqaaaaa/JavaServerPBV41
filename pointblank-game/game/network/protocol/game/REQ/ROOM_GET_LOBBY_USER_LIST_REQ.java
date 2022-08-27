package game.network.protocol.game.REQ;

import game.network.protocol.game.ACK.*;

import java.util.*;

import core.models.*;
import core.utils.*;

public class ROOM_GET_LOBBY_USER_LIST_REQ extends game.network.protocol.GamePacketREQ
{
    public ROOM_GET_LOBBY_USER_LIST_REQ(int opcode)
    {
        super(opcode);
    }
    @Override
    public void readImpl()
    {
    }
    @Override
    public void runImpl()
    {
    	List<Player> list = new ArrayList<Player>(8);
    	Channel c = client.getChannel();
    	if (c != null)
    	{
    		for (long id : c.JOGADORES)
    		{
    			Player p = AccountSyncer.gI().get(id);
    			if (p != null && p.status() > 0 && p.channel_id != -1 && p.room_id == -1)
    			{
    				list.add(p);
    			}
    		}
    	}
    	if (list.size() > 8)
    	{
    		List<Player> sub = new ArrayList<Player>(8);
    		for (Player p : list)
    		{
    			if (sub.size() + 1 <= 8)
    				sub.add(p);
    			else
    				break;
    		}
    		list.clear();
    		list.addAll(sub);
    		sub.clear();
    	}
		sendPacket(new ROOM_GET_LOBBY_USER_LIST_ACK(list));
    }
}