package game.network.protocol.game.REQ;

import core.enums.SlotState;
import core.models.*;
import core.pistola.*;
import game.network.protocol.game.ACK.*;

public class TITLE_GET_REQ extends game.network.protocol.GamePacketREQ
{
	protected int titleIdx;
	protected int error;
	protected int slot;
	public TITLE_GET_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		titleIdx = ReadC();
	}
	@Override
	public void runImpl()
	{
		Room r = client.getRoom();
		Player p = client.getPlayer();
		TitleV t = TitlesPISTOLA.gI().titles.get(titleIdx);
		if (p != null && t != null)
		{
			if (p.rank >= t.rank && p.title.title[t.reqT1] == 1 && p.title.title[t.reqT2] == 1 && p.brooch >= t.brooch && p.medal >= t.medals && p.blue_order >= t.blue_order && p.insignia >= t.insignia)
			{
				if (p.title.title[t.id] == 0)
				{
					if (r != null && r.getSlotState(p) != SlotState.INFO)
					{
						sendPacket(new TITLE_GET_ACK(0x80000000, 0));
						return;
					}
					slot = t.slot;
					if (t.pos == 1) p.title.pos1 += t.pos_v;
					else if (t.pos == 2) p.title.pos2 += t.pos_v;
					else if (t.pos == 3) p.title.pos3 += t.pos_v;
					else if (t.pos == 4) p.title.pos4 += t.pos_v;
					else if (t.pos == 5) p.title.pos5 += t.pos_v;
					else if (t.pos == 6) p.title.pos6 += t.pos_v;
					else if (t.pos == 7) p.title.pos7 += t.pos_v;
					else if (t.pos == 8) p.title.pos8 += t.pos_v;
					p.title.title[t.id] = 1;
		            p.brooch -= t.brooch;
		            p.medal -= t.medals;
		            p.blue_order -= t.blue_order;
		            p.insignia -= t.insignia;
		            if (p.brooch < 0) p.brooch = 0;
		            if (p.medal < 0) p.medal = 0;
		            if (p.blue_order < 0) p.blue_order = 0;
		            if (p.insignia < 0) p.insignia = 0;
		            if (p.title.slot > slot)
		            	slot = p.title.slot;
		            else
		            {
		            	p.title.slot = slot;
		            	db.executeQuery("UPDATE jogador_titulos SET slot='" + p.title.slot + "' WHERE player_id='" + p.id + "'");
		            }
		            for (PlayerInventory it : t.rewards)
		            	sendPacket(new INVENTORY_ITEM_CREATE_ACK(p, it.item_id, it.count, it.equip, -1, true));
		            if (t.brooch > 0) db.updateBrooch(p);
		            if (t.medals > 0) db.updateMedal(p);
		            if (t.insignia > 0) db.updateInsignia(p);
		            if (t.blue_order > 0) db.updateBlueOrder(p);
		            db.executeQuery("UPDATE jogador_titulos SET title" + t.id + "='1' WHERE player_id='" + p.id + "'");
				}
				else
				{
					slot = p.title.slot;
				}
			}
			else
			{
				error = 0x80001083;
			}
		}
		else
		{
			error = 0x80000000;
		}
		sendPacket(new TITLE_GET_ACK(error, slot)); //0x80001084 - Titulo já foi adquirido.
		if (p != null && error == 0)
			sendPacket(new TITLE_UPDATE_ACK(p));
	}
}