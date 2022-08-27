package game.network.protocol.game.REQ;

import core.enums.SlotState;
import core.models.*;
import core.pistola.*;
import game.network.protocol.game.ACK.*;

public class MISSION_QUEST_BUY_CARD_REQ extends game.network.protocol.GamePacketREQ
{
	protected Player p;
	protected int error;
	protected int price;
	protected int missionId;
	protected int active;
	public MISSION_QUEST_BUY_CARD_REQ(int opcode)
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
				missionId = ReadC();
				price = MissionsPISTOLA.gI().BUY_CARD(missionId);
				if (0 > (p.gold - price))
					 error = 0x8000104D;
				else
				{
					if (p.mission1 == 0)
		            {
						if (r != null && r.getSlotState(p) != SlotState.INFO)
						{
							error = 0x8000104E;
							return;
						}
						p.mission1 = missionId;
						p.missions.card1 = 0;
		                p.missions.mission1 = new int[41];
		    			db.updateMission(p, missionId, 1);
		    			db.updateCard(p, 1, 0);
		    			db.updateMissions(p, 1, new int[41]);
		                active = 0;
		            }
		            else if (p.mission2 == 0)
		            {
						if (r != null && r.getSlotState(p) != SlotState.INFO)
						{
							error = 0x8000104E;
							return;
						}
		            	p.mission2 = missionId;
		            	p.missions.card2 = 0;
		                p.missions.mission2 = new int[41];
		                db.updateMission(p, missionId, 2);
		                db.updateCard(p, 2, 0);
		    			db.updateMissions(p, 2, new int[41]);
		                active = 1;
		            }
		            else if (p.mission3 == 0)
		            {
						if (r != null && r.getSlotState(p) != SlotState.INFO)
						{
							error = 0x8000104E;
							return;
						}
		            	p.mission3 = missionId;
		            	p.missions.card3 = 0;
		                p.missions.mission3 = new int[41];
		                db.updateMission(p, missionId, 3);
		                db.updateCard(p, 3, 0);
		    			db.updateMissions(p, 3, new int[41]);
		                active = 2;
		            }
		            else
		            {
		            	error = 0x8000104C;
		            }
					if (error == 0)
						p.gold -= price;
					if (p.gold < 0)
						p.gold = 0;
					if (error == 0)
						db.updateGold(p);
				}
			}
			else
			{
				error = 0x8000104E;
			}
		}
		catch (Exception e)
		{
			error = 0x8000104E;
		}
	}
	@Override
	public void runImpl()
	{
		sendPacket(new MISSION_QUEST_BUY_CARD_ACK(p, error, active));
	}
}