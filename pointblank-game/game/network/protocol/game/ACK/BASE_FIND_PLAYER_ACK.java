package game.network.protocol.game.ACK;

import core.models.*;
import core.utils.*;

public class BASE_FIND_PLAYER_ACK extends game.network.protocol.GamePacketACK
{
	protected long pId;
	protected PlayerStats stats;
	protected PlayerEquipment equipment;
	protected PlayerState skr;
	protected int error;
	protected int rank;
	protected int clan_id;
	public BASE_FIND_PLAYER_ACK(long pId, int error)
	{
		super(true);
		this.pId = pId;
		this.error = error;
		if (error == 0 && pId > 0)
			skr = EssencialUtil.gI().PLAYER_STATE(pId);
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		if (error == 0 && pId > 0)
		{
			Player p = AccountSyncer.gI().get(pId);
			if (p != null)
			{
				rank = p.rank;
				clan_id = p.clan_id;
				stats = p.stats;
				equipment = p.equipment;
			}
			else
			{
				rank = EssencialUtil.gI().BUSCAR_RANK(pId);
				clan_id = db.returnQueryValueI("SELECT clan_id FROM jogador WHERE id='" + pId + "'", "clan_id");
				stats = db.READ_STATS(pId);
				equipment = db.READ_EQUIPMENT(pId);
			}
			if (stats == null) stats = new PlayerStats();
			if (equipment == null) equipment = new PlayerEquipment();
			WriteD(rank);
			WriteC(skr.room_id);
			WriteC(skr.channel_id * 16);
			WriteC(skr.server_id * 16);
			WriteC(skr.state.value);
			WriteS(ck.getClanName(clan_id), 17);
			WriteD(stats.partidas);
			WriteD(stats.ganhou);
			WriteD(stats.perdeu);
			WriteD(stats.empatou);
			WriteD(stats.matou);
			WriteD(stats.headshots);
			WriteD(stats.morreu);
			WriteD(stats.partidas);
			WriteD(stats.matou);
			WriteD(stats.kitou);
			WriteD(stats.partidas);
			WriteD(stats.ganhou);
			WriteD(stats.perdeu);
			WriteD(stats.empatou);
			WriteD(stats.matou);
			WriteD(stats.headshots);
			WriteD(stats.morreu);
			WriteD(stats.partidas);
			WriteD(stats.matou);
			WriteD(stats.kitou);
			WriteD(equipment.weapon_primary);
			WriteD(equipment.weapon_secundary);
			WriteD(equipment.weapon_melee);
			WriteD(equipment.weapon_grenade);
			WriteD(equipment.weapon_special);
			WriteD(equipment.char_red);
			WriteD(equipment.char_blue);
			WriteD(equipment.char_head);
			WriteD(equipment.char_beret);
			WriteD(equipment.char_dino);
			WriteH(0);
			WriteC(0);
		}
	}
}