package game.network.protocol.game.ACK;

import core.models.*;

public class BASE_GET_EQUIPMENT_INFO_ACK extends game.network.protocol.GamePacketACK
{
	protected PlayerEquipment e;
	public BASE_GET_EQUIPMENT_INFO_ACK(Player p)
	{
		super(true);
		if (p.equipment == null)
			p.equipment = new PlayerEquipment();
		e = p.equipment;
	}
	@Override
	public void writeImpl()
	{
		WriteD(e.weapon_primary);
		WriteD(e.weapon_secundary);
		WriteD(e.weapon_melee);
		WriteD(e.weapon_grenade);
		WriteD(e.weapon_special);
		WriteD(e.char_red);
		WriteD(e.char_blue);
		WriteD(e.char_head);
		WriteD(e.char_beret);
		WriteD(e.char_dino);
	}
}