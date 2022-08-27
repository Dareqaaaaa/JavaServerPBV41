package game.network.protocol.game.REQ;

import core.models.*;
import game.network.protocol.game.ACK.*;

public class CLAN_REQUEST_CONTEXT_REQ extends game.network.protocol.GamePacketREQ
{
	public CLAN_REQUEST_CONTEXT_REQ(int opcode)
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
		Player p = client.getPlayer();
		if (p != null)
			sendPacket(new CLAN_REQUEST_CONTEXT_ACK(p.clan_id));
	}
}