package game.network.protocol.game.ACK;

import core.models.*;
import core.utils.*;

public class CLAN_CREATE_ACK extends game.network.protocol.GamePacketACK
{
	protected Clan c;
	protected int error;
	protected int gold;
	public CLAN_CREATE_ACK(Clan c, int error, int gold)
	{
		super(true);
		this.c = c;
		this.error = error;
		this.gold = gold;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		if (error == 0 && c != null)
		{
			WriteD(c.id);
			WriteS(c.name, 17);
			WriteC(c.rank);
			WriteC(c.membros.size());
			WriteC(c.vagas);
			WriteD(c.data);
			WriteD(c.logo);
			WriteC(c.color);
			WriteC(c.nivel().ordinal());
			WriteD(c.exp);
	        WriteH(c.rating);
	        WriteH(c.top_rating);
	        WriteQ(c.owner);
	        WriteS(EssencialUtil.gI().BUSCAR_NICK(c.owner), 33);
	        WriteC(EssencialUtil.gI().BUSCAR_RANK(c.owner));
	        WriteT(c.info, 255);
	        WriteT(c.url, 21);
	        WriteC(c.limite_rank);
	        WriteC(c.limite_idade);
	        WriteC(c.limite_idade2);
	        WriteC(c.autoridade);
	        WriteT(c.notice, 255);
	        WriteD(c.partidas);
	        WriteD(c.vitorias);
	        WriteD(c.derrotas);
	        WriteD(c.partidas);
	        WriteD(c.vitorias);
	        WriteD(c.derrotas);
	        WriteQ(c.player_exp);
	        WriteQ(c.player_participacao);
	        WriteQ(c.player_vitorias);
	        WriteQ(c.player_matou);
	        WriteQ(c.player_headshots);
	        WriteQ(c.player_exp);
	        WriteQ(c.player_participacao);
	        WriteQ(c.player_vitorias);
	        WriteQ(c.player_matou);
	        WriteQ(c.player_headshots);
	        WriteF(c.pontos);
	        WriteD(gold);
		}
	}
}