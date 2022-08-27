package game.network.protocol.game.ACK;

import game.network.protocol.*;

import java.util.*;

import core.models.*;
import core.utils.*;

public class BATTLE_RESPAWN_ACK extends GamePacketACK
{
	protected Room r;
	protected RoomSlot s;
	protected int respawn;
	protected int local_respawn;
	public BATTLE_RESPAWN_ACK(Room r, RoomSlot s, int respawn, int local_respawn)
	{
		super(true);
		this.r = r;
		this.s = s;
		this.respawn = respawn;
		this.local_respawn = local_respawn;
	}
	@Override
	public void writeImpl()
	{
		WriteD(s.id);
		WriteD(respawn);
		WriteD(local_respawn);
		WriteD(s.equipment.weapon_primary);
		WriteD(s.equipment.weapon_secundary);
		WriteD(s.equipment.weapon_melee);
		WriteD(s.equipment.weapon_grenade);
		WriteD(s.equipment.weapon_special);
		WriteD(s.equipment.unk_item);
		WriteB(new byte[] { 0x64, 0x64, 0x64, 0x64, 0x64 });
		WriteC(1);
		WriteD(s.equipment.char_red);
		WriteD(s.equipment.char_blue);
		WriteD(s.equipment.char_head);
		WriteD(s.equipment.char_beret);
		WriteD(s.equipment.char_dino);	
		if (r.isDino(2))
	    {
			List<Integer> pL = EssencialUtil.gI().DINOSSAUROS(r, r.dinossaur());
			WriteC((pL.size() == 1 || r.isDino(0)) ? 0xFF : r.rexDino);
			for (int slot : pL)
				if (slot != r.rexDino && r.isDino(1) || r.isDino(0))
					WriteC(slot);
			for (int i = 0; i < (7 - pL.size()); i++)
				WriteC(0xFF);
			WriteC(0xFF);
			WriteC(0xFF);
			WriteC(0xFF);
			pL = null;
		}
	}
}