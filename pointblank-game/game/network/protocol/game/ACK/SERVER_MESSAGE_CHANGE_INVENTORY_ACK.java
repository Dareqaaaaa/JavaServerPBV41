package game.network.protocol.game.ACK;

import core.models.*;

public class SERVER_MESSAGE_CHANGE_INVENTORY_ACK extends game.network.protocol.GamePacketACK
{
	protected PlayerEquipment e;
	protected int type;
	public SERVER_MESSAGE_CHANGE_INVENTORY_ACK(Player p, int type)
	{
		super(true);
		this.type = type;
		if (p.equipment == null)
			p.equipment = new PlayerEquipment();
		e = p.equipment;
	}
	@Override
	public void writeImpl()
	{
		WriteD(type);
		if (type == 1 || type == 3)
		{
			WriteD(e.char_red);
			WriteD(e.char_blue);
			WriteD(e.char_head);
			WriteD(e.char_beret);
			WriteD(e.char_dino);
		}
		if (type == 2 || type == 3)
		{
			WriteD(e.weapon_primary);
			WriteD(e.weapon_secundary);
			WriteD(e.weapon_melee);
			WriteD(e.weapon_grenade);
			WriteD(e.weapon_special);
		}
	}
}