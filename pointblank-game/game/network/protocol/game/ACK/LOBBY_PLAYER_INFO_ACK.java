package game.network.protocol.game.ACK;

import core.models.*;

public class LOBBY_PLAYER_INFO_ACK extends game.network.protocol.GamePacketACK
{
	protected PlayerStats s;
	public LOBBY_PLAYER_INFO_ACK(PlayerStats s)
	{
		super(true);
		if (s == null)
			s = new PlayerStats();
		this.s = s;
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