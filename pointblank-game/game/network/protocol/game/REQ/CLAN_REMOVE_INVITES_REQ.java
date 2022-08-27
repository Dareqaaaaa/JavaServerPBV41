package game.network.protocol.game.REQ;

import core.manager.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class CLAN_REMOVE_INVITES_REQ extends game.network.protocol.GamePacketREQ
{
	protected int error;
	public CLAN_REMOVE_INVITES_REQ(int opcode)
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
			if (!ClanInviteManager.gI().deleteInvite(p) && p.clan_invited > 0)
				error = 0x8000106D;
			else
				error = 0;
		}
		else
		{
			error = 0x8000106D;
		}
		sendPacket(new CLAN_REMOVE_INVITES_ACK(error));
	}
}