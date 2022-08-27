package game.network.protocol.game.REQ;

import core.models.*;
import game.network.protocol.game.ACK.*;

public class CLAN_MEMBER_LIST_REQ extends game.network.protocol.GamePacketREQ
{
	public CLAN_MEMBER_LIST_REQ(int opcode)
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
			sendPacket(new CLAN_MEMBER_LIST_ACK(ck.getClanId(p.clan_id)));
	}
}