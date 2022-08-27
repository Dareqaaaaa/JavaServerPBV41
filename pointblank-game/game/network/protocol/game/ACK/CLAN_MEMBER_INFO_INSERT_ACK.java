package game.network.protocol.game.ACK;

import core.models.*;
import core.utils.*;
import game.network.protocol.*;

public class CLAN_MEMBER_INFO_INSERT_ACK extends GamePacketACK
{
	protected Player p;
	protected PlayerState skr;
	public CLAN_MEMBER_INFO_INSERT_ACK(Player p)
	{
		super(true);
		this.p = p;
		skr = EssencialUtil.gI().PLAYER_STATE(p.id);
		p.last_cstate = skr.state.value;
	}
	@Override
	public void writeImpl()
	{
		WriteC(p.name.length() + 1);
		WriteS(p.name, p.name.length() + 1);
		WriteQ(p.id);
		WriteC(skr.room_id);
		WriteC(skr.channel_id * 16);
		WriteC(skr.server_id * 16);
		WriteC(skr.state.value);
		WriteD(0);
		WriteC(p.rank);
	}
}