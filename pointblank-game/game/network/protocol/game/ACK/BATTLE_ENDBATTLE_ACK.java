package game.network.protocol.game.ACK;

import core.models.*;

public class BATTLE_ENDBATTLE_ACK extends game.network.protocol.GamePacketACK
{
	protected Player p;
	protected Room r;
	protected Clan c;
	protected int slot_player;
	protected int slot_mission;
	protected int winner;
	public BATTLE_ENDBATTLE_ACK(Player p, Room r, int slot_player, int slot_mission, int winner)
	{
		super(true);
		this.p = p;
		this.r = r;
		this.slot_player = slot_player;
		this.slot_mission = slot_mission;
		this.winner = winner;
		c = ck.getClanNotNull(p != null ? p.clan_id : 0);
	}
	@Override
	public void writeImpl()
	{
		WriteC(winner);
		WriteH(slot_player);
		WriteH(slot_mission);
	    for (int i = 0; i < 16; i++) WriteH(r.getRoomSlot(i).exp);
	    for (int i = 0; i < 16; i++) WriteH(r.getRoomSlot(i).gold);
	    for (int i = 0; i < 16; i++) WriteH(r.getRoomSlot(i).exp_bonus);
	    for (int i = 0; i < 16; i++) WriteH(r.getRoomSlot(i).gold_bonus);
	    for (int i = 0; i < 16; i++) WriteC(r.getRoomSlot(i).tag);
		WriteS(p.name, 33);
		WriteD(p.exp);
		WriteD(p.rank);
		WriteD(p.rank());
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
		if (r.special == 6 || r.special == 9)
		{
		    for (int i = 0; i < 16; i++)
		    	WriteH(r.getRoomSlot(i).score);
		}
		else if (r.isRoundMap() || r.isDino(2))
		{
			WriteH(r.teamRound(0));
			WriteH(r.teamRound(1));
		    for (int i = 0; i < 16; i++)
		    	WriteC(r.getRoomSlot(i).objetivo);
		}
		else if (r.isCaos())
		{
			WriteH(r.redKills);
			WriteB(new byte[21 - 2]);
		}
		else
		{
			WriteB(new byte[21]);
		}
		if (c.nuller) c = null;
	}
}