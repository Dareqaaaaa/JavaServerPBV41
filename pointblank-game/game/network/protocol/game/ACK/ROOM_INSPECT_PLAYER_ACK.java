package game.network.protocol.game.ACK;

import java.util.*;

import core.models.*;

public class ROOM_INSPECT_PLAYER_ACK extends game.network.protocol.GamePacketACK
{
	protected PlayerEquipment e;
	protected List<Integer> cupons = new ArrayList<Integer>();
	public ROOM_INSPECT_PLAYER_ACK(Player p)
	{
		super(true);
		e = p.equipment;
		List<Integer> list = p.todosOsItemsDoInventario(3);
		for (int i = 0; i < list.size(); i++)
			if (p.buscarEquipPeloItemId(list.get(i)) == 2)
				cupons.add(list.get(i));
		if (e == null)
			e = new PlayerEquipment();
		list = null;
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
		WriteD(cupons.size());
		for (int i = 0; i < cupons.size(); i++)
			WriteD(cupons.get(i));
		cupons = null;
	}
}