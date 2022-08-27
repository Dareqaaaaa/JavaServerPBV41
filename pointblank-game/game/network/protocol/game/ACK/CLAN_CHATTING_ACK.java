package game.network.protocol.game.ACK;

import core.models.*;

public class CLAN_CHATTING_ACK extends game.network.protocol.GamePacketACK 
{
	protected Player p;
	protected String message;
	public CLAN_CHATTING_ACK(Player p, String message) 
	{
		super(true);
		this.p = p;
		this.message = message;
	}
	@Override
	public void writeImpl()
	{
		WriteC(0);
        WriteC(p.name.length() + 1);
        WriteS(p.name, p.name.length() + 1);
        WriteC(p.rank == 53 || p.rank == 54 ? 1 : 0);
        WriteC(message.length() + 1);
        WriteS(message, message.length() + 1);
	}
}