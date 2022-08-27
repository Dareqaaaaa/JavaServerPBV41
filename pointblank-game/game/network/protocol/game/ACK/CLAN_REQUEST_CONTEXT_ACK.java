package game.network.protocol.game.ACK;

import core.manager.*;

public class CLAN_REQUEST_CONTEXT_ACK extends game.network.protocol.GamePacketACK
{
	protected int invites;
	public CLAN_REQUEST_CONTEXT_ACK(int clan_id)
	{
		super(true);
		invites = ClanInviteManager.gI().getInvitesClan(clan_id).size();
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
		WriteC(invites);
		WriteC(13);
		WriteC(invites);
		WriteB(new byte[] { 0x17, 0x1E, 0x69, 0x42 });
	}
}