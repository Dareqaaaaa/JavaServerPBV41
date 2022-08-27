package game.network.protocol.game.ACK;

import core.models.*;

public class BATTLE_READYBATTLE2_ACK extends game.network.protocol.GamePacketACK
{
	protected Player p;	
	protected int slot;
	public BATTLE_READYBATTLE2_ACK(Player p, int slot)
	{
		super(true);
		this.p = p;
		this.slot = slot;
	}
	@Override
	public void writeImpl()
	{
		WriteC(slot);
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