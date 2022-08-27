package game.network.protocol.game.ACK;

import core.models.*;

public class MISSION_QUEST_UPDATE_CARD_ACK extends game.network.protocol.GamePacketACK
{
	protected Player p;
	protected int error;
	protected int type;
	public MISSION_QUEST_UPDATE_CARD_ACK(Player p, int error, int type)
	{
		super(true);
		this.p = p;
		this.error = error;
		this.type = type;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		WriteC(type); //6
		WriteD(p.exp);
		WriteD(p.gold);
		WriteD(p.brooch);
        WriteD(p.insignia);
        WriteD(p.medal);
        WriteD(p.blue_order);
        WriteD(p.rank);
	}
}