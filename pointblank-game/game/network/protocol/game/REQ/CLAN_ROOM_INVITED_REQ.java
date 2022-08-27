package game.network.protocol.game.REQ;

import core.models.*;
import core.utils.*;
import game.network.protocol.game.ACK.*;

public class CLAN_ROOM_INVITED_REQ  extends game.network.protocol.GamePacketREQ
{
	protected Player p;
	public CLAN_ROOM_INVITED_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		p = AccountSyncer.gI().get(ReadQ());
	}
	@Override
	public void runImpl()
	{
		if (p != null && p.connection != null)
			p.connection.sendPacket(new CLAN_ROOM_INVITED_RESULT_ACK(client.pId));
	}
}