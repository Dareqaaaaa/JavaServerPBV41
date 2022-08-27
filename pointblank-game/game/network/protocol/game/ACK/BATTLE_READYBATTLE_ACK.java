package game.network.protocol.game.ACK;

import core.models.*;
import game.network.protocol.*;

public class BATTLE_READYBATTLE_ACK extends GamePacketACK
{
	protected Room r;
	protected int count;
	public BATTLE_READYBATTLE_ACK(Room r)
	{
		super(true);
		if (r != null)
		{
			for (int i = 0; i < 16; i++)
				if (r.getSlotState(i).ordinal() > 7)
					count++;
		}
		this.r = r;
	}
	@Override
	public void writeImpl()
	{
		WriteH(r.map);
		WriteC(r.stage4v4);
		WriteC(r.type.ordinal());
		WriteC(count);
		for (int i = 0; i < 16; i++)
		{
			Player p = r.getPlayerBySlot(i);
			if (p != null && r.getSlotState(i).ordinal() > 7)
			{
				WriteC(i);
				WriteD(p.equipment.char_red);
				WriteD(p.equipment.char_blue);
				WriteD(p.equipment.char_head);
				WriteD(p.equipment.char_beret);
				WriteD(p.equipment.char_dino);
				WriteD(p.equipment.weapon_primary);
				WriteD(p.equipment.weapon_secundary);
				WriteD(p.equipment.weapon_melee);
				WriteD(p.equipment.weapon_grenade);
				WriteD(p.equipment.weapon_special);
				WriteD(0);
				WriteC(p.title.equip1);
				WriteC(p.title.equip2);
				WriteC(p.title.equip3);
			}
		}
	}
}