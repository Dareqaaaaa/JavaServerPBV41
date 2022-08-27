package game.network.protocol.game.ACK;

import core.enums.*;
import core.models.*;

public class BATTLE_MISSION_ROUND_END_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	protected WinnerRound type;
	protected TimeEnum team;
	public BATTLE_MISSION_ROUND_END_ACK(Room r, TimeEnum team, WinnerRound type)
	{
		super(true);
		this.r = r;
		this.team = team;
		this.type = type;
	}
	@Override
	public void writeImpl()
	{
		WriteC(team.ordinal());
		WriteC(type.ordinal());
		WriteH(r.teamRound(0));
		WriteH(r.teamRound(1));
	}
}