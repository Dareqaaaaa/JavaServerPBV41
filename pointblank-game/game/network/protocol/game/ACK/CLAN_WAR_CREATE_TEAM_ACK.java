package game.network.protocol.game.ACK;

import core.models.*;

public class CLAN_WAR_CREATE_TEAM_ACK extends game.network.protocol.GamePacketACK
{
	protected ClanFronto cf;
	protected int error;
	public CLAN_WAR_CREATE_TEAM_ACK(ClanFronto cf, int error)
	{
		super(true);
		this.cf = cf;
		this.error = error;
		if (cf == null)
			error = 0x80001089;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		if (error == 0)
		{
			WriteH(cf.id);
			WriteH(cf.channel_id + 10);
			WriteH(cf.channel_id + 10);
			WriteH(cf.server_id);
			WriteC(cf.formacao);
			WriteC(cf.PLAYERS());
			WriteD(0);
			WriteC(0);
		}
	}
}