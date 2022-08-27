package game.network.protocol.game.ACK;

import core.enums.*;
import core.models.*;
import core.utils.*;
import game.network.protocol.*;

public class CLAN_MEMBER_INFO_CHANGE_ACK extends GamePacketACK
{
	protected long pId;
	protected CommState status;
	protected PlayerState skr;
	public CLAN_MEMBER_INFO_CHANGE_ACK(Player p, int real_status)
	{
		super(true);
		pId = p.id;
		skr = EssencialUtil.gI().PLAYER_STATE(pId);
		if (real_status == 0)
			status = skr.state;
		else
			status = CommState.valueOf(real_status);
		p.last_cstate = status.value;
	}
	@Override
	public void writeImpl()
	{
		WriteQ(pId);
		WriteC(skr.room_id);
		WriteC(skr.channel_id * 16);
		WriteC(skr.server_id * 16);
		WriteC(status.value);
		WriteD(0);
	}
}