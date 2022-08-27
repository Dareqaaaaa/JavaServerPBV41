package game.network.protocol.game.ACK;

import core.models.*;

public class ROOM_GET_PLAYERINFO_ACK extends game.network.protocol.GamePacketACK
{	
	protected Player p;
	protected Clan c;
	protected int slot;
	public ROOM_GET_PLAYERINFO_ACK(Room r, int slot)
	{
		super(true);
		this.slot = slot;
		if (r != null)
		{
			p = r.getPlayerBySlot(slot);
			c = ck.getClanNotNull(p != null ? p.clan_id : 0);
		}
	}
	@Override
	public void writeImpl()
	{
		WriteD(slot);
		if (p != null)
		{
			WriteS(p.name, 33);
			WriteD(p.exp);
			WriteD(p.rank());
			WriteD(p.rank);
			WriteD(p.gold);
			WriteD(p.cash);
			WriteD(p.clan_id());
			WriteD(p.funcion());
			WriteQ(p.status());
			WriteC(p.vip.pc_cafe);
			WriteC(p.tourney_level);
			WriteC(p.color);
			WriteS(c.name, 17);
			WriteC(c.rank);
			WriteC(c.nivel().ordinal());
			WriteD(c.logo);
			WriteC(c.color);
	        WriteH(c.rating);
	        WriteH(c.top_rating);
			WriteC(p.unpolled());
			WriteD(p.unsigned());
			WriteD(p.lastup());
			WriteD(p.stats.partidas);
			WriteD(p.stats.ganhou);
			WriteD(p.stats.perdeu);
			WriteD(p.stats.empatou);
			WriteD(p.stats.matou);
			WriteD(p.stats.headshots);
			WriteD(p.stats.morreu);
			WriteD(p.stats.partidas);
			WriteD(p.stats.matou);
			WriteD(p.stats.kitou);
			WriteD(p.stats.partidas);
			WriteD(p.stats.ganhou);
			WriteD(p.stats.perdeu);
			WriteD(p.stats.empatou);
			WriteD(p.stats.matou);
			WriteD(p.stats.headshots);
			WriteD(p.stats.morreu);
			WriteD(p.stats.partidas);
			WriteD(p.stats.matou);
			WriteD(p.stats.kitou);
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
		}
	}
}