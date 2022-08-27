package game.network.protocol.game.ACK;

import core.enums.*;
import core.models.*;
import core.utils.*;

public class FRIEND_INFO_ACK extends game.network.protocol.GamePacketACK
{
	protected Player p;
	protected String name;
	protected int rank;
	public FRIEND_INFO_ACK(Player p)
	{
		super(true);
		this.p = p;
	}
	@Override
	public void writeImpl()
	{
		WriteC(p.amigos.size());
		for (PlayerFriend f : p.amigos)
		{
			PlayerState skr = EssencialUtil.gI().PLAYER_STATE(f.id);
			CommState status = skr.state;
			if (f.status != 0) status = CommState.valueOf(f.status);
			Player p = AccountSyncer.gI().get(f.id);
			if (p != null)
			{
				name = p.name;
				rank = p.rank;
			}
			else
			{
				name = EssencialUtil.gI().BUSCAR_NICK(f.id);
				rank = EssencialUtil.gI().BUSCAR_RANK(f.id);
			}
			WriteC(name.length() + 1);
			WriteS(name, name.length() + 1);
			WriteQ(f.id);
			WriteC(skr.state.value >= 18 && skr.state.value <= 48 ? 0 : skr.room_id);
			WriteC(skr.state.value >= 18 && skr.state.value <= 48 ? 0 : skr.channel_id * 16);
			WriteC(skr.state.value >= 18 && skr.state.value <= 48 ? 0 : skr.server_id * 16);
			WriteC(status.value);
			WriteC(rank);
			WriteH(32768);
			WriteC(255);
		}
	}
}