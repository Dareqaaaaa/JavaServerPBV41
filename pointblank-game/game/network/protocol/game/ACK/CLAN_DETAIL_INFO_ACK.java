package game.network.protocol.game.ACK;

import core.models.*;
import core.utils.*;

public class CLAN_DETAIL_INFO_ACK extends game.network.protocol.GamePacketACK
{
	protected Clan c;
	protected int error;
	public CLAN_DETAIL_INFO_ACK(Clan c, int mask)
	{
		super(true);
		this.c = c;
		error = mask;
		if (c == null)
			error = 0x8000105B;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		if (error != 0x8000105B)
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
		}
	}
}