package game.network.protocol.game.ACK;

import core.models.*;

public class TITLE_UPDATE_ACK extends game.network.protocol.GamePacketACK
{
	protected Player p;
	public TITLE_UPDATE_ACK(Player p)
	{
		super(true);
		this.p = p;
	}
	@Override
	public void writeImpl()
	{
        WriteC(p.title.pos1);
        WriteC(p.title.pos2);
        WriteC(p.title.pos3);
        WriteC(p.title.pos4);
        WriteC(p.title.pos5);
        WriteC(p.title.pos6);
        WriteC(p.title.pos7);
        WriteC(p.title.pos8);
        WriteD(p.brooch);
        WriteD(p.insignia);
        WriteD(p.medal);
        WriteD(p.blue_order);
	}
}