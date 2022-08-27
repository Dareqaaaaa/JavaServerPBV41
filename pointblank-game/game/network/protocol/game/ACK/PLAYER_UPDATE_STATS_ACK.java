package game.network.protocol.game.ACK;

import core.models.*;

public class PLAYER_UPDATE_STATS_ACK extends game.network.protocol.GamePacketACK
{
	protected PlayerStats s;
	public PLAYER_UPDATE_STATS_ACK(PlayerStats s)
	{
		super(true);
		this.s = s;
		if (s == null)
			s = new PlayerStats();
	}
	@Override
	public void writeImpl()
	{
		WriteD(s.partidas);
		WriteD(s.ganhou);
		WriteD(s.perdeu);
		WriteD(s.empatou);
		WriteD(s.matou);
		WriteD(s.headshots);
		WriteD(s.morreu);
		WriteD(s.partidas);
		WriteD(s.matou);
		WriteD(s.kitou);
		WriteD(s.partidas);
		WriteD(s.ganhou);
		WriteD(s.perdeu);
		WriteD(s.empatou);
		WriteD(s.matou);
		WriteD(s.headshots);
		WriteD(s.morreu);
		WriteD(s.partidas);
		WriteD(s.matou);
		WriteD(s.kitou);
	}
}