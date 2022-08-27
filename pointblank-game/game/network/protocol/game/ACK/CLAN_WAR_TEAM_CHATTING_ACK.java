package game.network.protocol.game.ACK;

import core.models.*;

public class CLAN_WAR_TEAM_CHATTING_ACK extends game.network.protocol.GamePacketACK 
{
	protected Player p;
	protected String msg;
	public CLAN_WAR_TEAM_CHATTING_ACK(Player p, String msg) 
	{
		super(true);
		this.p = p;
		this.msg = msg;
	}
	@Override
	public void writeImpl()
	{
		WriteC(0);
        WriteC(p.name.length() + 1);
        WriteS(p.name, p.name.length() + 1);
        WriteC(msg.length() + 1);
        WriteS(msg, msg.length() + 1);
	}
}