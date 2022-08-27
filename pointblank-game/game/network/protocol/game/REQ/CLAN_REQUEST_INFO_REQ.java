package game.network.protocol.game.REQ;

import core.models.*;
import game.network.protocol.game.ACK.*;

public class CLAN_REQUEST_INFO_REQ extends game.network.protocol.GamePacketREQ
{
	protected long pId;
	public CLAN_REQUEST_INFO_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		pId = ReadQ();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		if (p != null && p.clan_id != 0)
			sendPacket(new CLAN_REQUEST_INFO_ACK(pId, p.clan_id));
	}
}