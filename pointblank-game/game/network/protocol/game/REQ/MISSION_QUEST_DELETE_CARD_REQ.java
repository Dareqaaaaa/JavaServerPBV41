package game.network.protocol.game.REQ;

import core.enums.SlotState;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class MISSION_QUEST_DELETE_CARD_REQ extends game.network.protocol.GamePacketREQ
{
	protected Player p;
	protected int cardId;
	protected int error;
	public MISSION_QUEST_DELETE_CARD_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		try
		{
			Room r = client.getRoom();
			p = client.getPlayer();
			if (p != null)
			{
				cardId = ReadC();
				if (cardId == 0)
				{
					if (r != null && r.getSlotState(p) != SlotState.INFO)
					{
						error = 0x80001050;
						return;
					}
					p.mission1 = 0;
					p.missions.card1 = 0;
	                p.missions.mission1 = new int[41];
	    			db.updateMission(p, 0, 1);
	    			db.updateCard(p, 1, 0);
	    			db.updateMissions(p, 1, new int[41]);
				}
				else if (cardId == 1)
				{
					if (r != null && r.getSlotState(p) != SlotState.INFO)
					{
						error = 0x80001050;
						return;
					}
					p.mission2 = 0;
					p.missions.card2 = 0;
	                p.missions.mission2 = new int[41];
	    			db.updateMission(p, 0, 2);
	    			db.updateCard(p, 2, 0);
	    			db.updateMissions(p, 2, new int[41]);
				}
				else if (cardId == 2)
				{
					if (r != null && r.getSlotState(p) != SlotState.INFO)
					{
						error = 0x80001050;
						return;
					}
					p.mission3 = 0;
					p.missions.card3 = 0;
	                p.missions.mission3 = new int[41];
	    			db.updateMission(p, 0, 3);
	    			db.updateCard(p, 3, 0);
	    			db.updateMissions(p, 3, new int[41]);
				}
				else if (cardId == 3)
				{
					if (r != null && r.getSlotState(p) != SlotState.INFO)
					{
						error = 0x80001050;
						return;
					}
					p.mission4 = 0;
					p.missions.card4 = 0;
	                p.missions.mission4 = new int[41];
	    			db.updateMission(p, 0, 4);
	    			db.updateCard(p, 4, 0);
	    			db.updateMissions(p, 4, new int[41]);
				}
			}
			else
			{
				error = 0x8000104F;
			}
		}
		catch (Exception e)
		{
			error = 0x80001050;
		}
	}
	@Override
	public void runImpl()
	{
        sendPacket(new MISSION_QUEST_DELETE_CARD_ACK(p, error, cardId));
	}
}