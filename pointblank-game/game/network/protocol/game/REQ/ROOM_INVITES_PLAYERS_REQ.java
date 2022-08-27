package game.network.protocol.game.REQ;

import core.enums.SlotState;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class ROOM_INVITES_PLAYERS_REQ extends game.network.protocol.GamePacketREQ
{
    public ROOM_INVITES_PLAYERS_REQ(int opcode)
    {
        super(opcode);
    }
    @Override
    public void readImpl()
    {
    	Player p = client.getPlayer();
    	Room r = client.getRoom();
    	if (p != null && r != null)
    	{
    		if (r.getSlotState(p) == SlotState.NORMAL)
    		{
	    		Channel ch = client.getChannel();
	    		if (ch != null && r.getSlotState(p).ordinal() < 9)
	    		{
			    	int jogadores = ReadD();
			    	for (int i = 0; i < jogadores; i++)
			    	{
			    		try
			    		{
				    		Player m = ch.BUSCAR_JOGADOR_LOBBY(ReadD());
				    		if (m != null && m.channel_id != -1 && m.room_id == -1)
				    			m.connection.sendPacket(new ROOM_INVITE_SHOW_ACK(p.name, r.id));
			    		}
			    		catch (Exception e)
			    		{
			    		}
			    	}
	    		}
    		}
    	}
    }
    @Override
    public void runImpl()
    {
        sendPacket(new ROOM_INVITE_RETURN_ACK(0));
    }
}