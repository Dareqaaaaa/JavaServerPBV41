package game.network.protocol.game.REQ;

import core.models.*;

public class MISSION_QUEST_UPDATE_CARD_REQ extends game.network.protocol.GamePacketREQ
{
	protected int missionId;
	protected int cardId;
	public MISSION_QUEST_UPDATE_CARD_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		missionId = ReadC();
        cardId = ReadC();
        ReadH();
	}
	@Override
	public void runImpl()
	{
		Player p = client.getPlayer();
		if (p != null)
		{
			if (missionId == 0)
			{
				p.missions.card1 = cardId;
				db.updateCard(p, 1, cardId);
			}
			else if (missionId == 1)
			{
				p.missions.card2 = cardId;
				db.updateCard(p, 2, cardId);
			}
			else if (missionId == 2)
			{
				p.missions.card3 = cardId;
				db.updateCard(p, 3, cardId);
			}
			else if (missionId == 3)
			{
				p.missions.card4 = cardId;
				db.updateCard(p, 4, cardId);
			}
			p.missions.active = missionId;
			db.updateActive(p, missionId);
		}
	}
}