package game.network.protocol.game.REQ;

import core.models.*;
import game.network.protocol.game.ACK.*;

public class CLAN_MEMBER_CONTEXT_REQ extends game.network.protocol.GamePacketREQ
{
	public CLAN_MEMBER_CONTEXT_REQ(int opcode)
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
		{
			Clan c = ck.getClanId(p.clan_id);
			if (c != null)
				sendPacket(new CLAN_MEMBER_CONTEXT_ACK(0, c.membros.size()));
			else
				sendPacket(new CLAN_MEMBER_CONTEXT_ACK(0x8000105B, 0));
		}
		else
		{
			sendPacket(new CLAN_MEMBER_CONTEXT_ACK(0x8000105B, 0));
		}
	}
}