package game.network.protocol.game.ACK;

import core.manager.*;
import core.models.*;
import core.utils.*;

public class CLAN_REQUEST_INFO_ACK extends game.network.protocol.GamePacketACK
{
	protected long pId;
	protected int cId;
	protected int rank;
	protected String texto;
	protected String name;
	protected PlayerStats s;
	public CLAN_REQUEST_INFO_ACK(long pId, int cId)
	{
		super(true);
		this.pId = pId;
		this.cId = cId;
		Player p = AccountSyncer.gI().get(pId);
		if (p != null)
		{
			name = p.name;
			rank = p.rank;
			if (p.stats != null) s = p.stats;
		}
		else
		{
			name = EssencialUtil.gI().BUSCAR_NICK(pId);
			rank = EssencialUtil.gI().BUSCAR_RANK(pId);
		}
		if (s == null) s = db.READ_STATS(pId);
		if (s == null) s = new PlayerStats();
		texto = ClanInviteManager.gI().textoByPlayerClan(pId, cId);
	}
	@Override
	public void writeImpl()
	{
		WriteD(0);
		WriteQ(pId);
		WriteS(name, 33);
		WriteC(rank);
		WriteD(s.matou);
		WriteD(s.morreu);
		WriteD(s.partidas);
		WriteD(s.ganhou);
		WriteD(s.perdeu);
		WriteT(texto, texto.length() + 1);
	}
}