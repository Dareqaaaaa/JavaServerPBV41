package game.network.protocol.game.ACK;

import core.models.*;

public class BATTLE_GIVEUPBATTLE_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	protected int leader;
	public BATTLE_GIVEUPBATTLE_ACK(Room r, int leader)
	{
		super(true);
		this.r = r;
		this.leader = leader;
	}
	@Override
	public void writeImpl()
	{
		WriteD(leader);
		for (int i = 0; i < 16; i++)
		{
			Player p = r.getPlayerBySlot(i);
			WriteB(p != null ? p.IP() : new byte[4]);
			WriteH(p != null ? conn.SECURITY_KEY : 0);
			WriteB(p != null ? p.localhost : new byte[4]);
			WriteH(p != null ? conn.SECURITY_KEY : 0);
			WriteC(0);
		}
	}
}