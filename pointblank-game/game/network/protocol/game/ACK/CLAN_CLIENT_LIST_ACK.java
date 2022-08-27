package game.network.protocol.game.ACK;

import java.util.*;

import core.models.*;

public class CLAN_CLIENT_LIST_ACK extends game.network.protocol.GamePacketACK
{
	protected List<Clan> clans;
	protected int error;
	protected int clan_id;
	public CLAN_CLIENT_LIST_ACK(List<Clan> clans, int error, int clan_id)
	{
		super(true);
		this.clans = clans;
		this.error = error;
		this.clan_id = clan_id;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		WriteC(clans.size());
		for (Clan c : clans)
		{
			if (c.id != clan_id)
			{
				WriteD(c.id);
				WriteS(c.name, 17);
				WriteC(c.rank);
				WriteC(c.membros.size());
				WriteC(c.vagas);
				WriteD(c.data);
				WriteD(c.logo);
				WriteC(c.color);
			}
		}
	}
}