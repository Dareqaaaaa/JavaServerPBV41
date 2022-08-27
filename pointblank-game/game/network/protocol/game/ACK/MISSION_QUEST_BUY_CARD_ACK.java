package game.network.protocol.game.ACK;

import core.models.*;

public class MISSION_QUEST_BUY_CARD_ACK extends game.network.protocol.GamePacketACK
{
	protected Player p;
	protected int active;
	protected int error;
	public MISSION_QUEST_BUY_CARD_ACK(Player p, int error, int active)
	{
		super(true);
		this.p = p;
		this.error = error;
		this.active = active;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		if (error == 0 && p != null)
		{
			WriteD(p.gold);
			WriteC(active);
			WriteC(active);
			WriteC(p.missions.card1);
			WriteC(p.missions.card2);
			WriteC(p.missions.card3);
			WriteC(p.missions.card4);
			for (int i = 0; i < 10; i++) WriteH(missao.getCard(p.mission1, i, p.missions.mission1));
			for (int i = 0; i < 10; i++) WriteH(missao.getCard(p.mission2, i, p.missions.mission2));
			for (int i = 0; i < 10; i++) WriteH(missao.getCard(p.mission3, i, p.missions.mission3));
			for (int i = 0; i < 10; i++) WriteH(missao.getCard(p.mission4, i, p.missions.mission4));		
			WriteC(p.mission1);
			WriteC(p.mission2);
			WriteC(p.mission3);
			WriteC(p.mission4);
		}
	}
}