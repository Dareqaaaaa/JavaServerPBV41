package game.network.protocol.game.REQ;

import core.models.*;

public class CLAN_WAR_JOIN_TEAM_REQ  extends game.network.protocol.GamePacketREQ
{
	protected int indexOf;
	protected int channel;
	public CLAN_WAR_JOIN_TEAM_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		ReadC();
		indexOf = ReadC();
		channel = ReadH();
		ReadC();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		Channel c = client.getChannel();
		if (p != null && c != null)
		{
		}
	}
}