package game.network.protocol.game.ACK;

import core.enums.*;
import core.models.*;
import core.utils.*;

public class FRIEND_UPDATE_ACK extends game.network.protocol.GamePacketACK
{
	protected Player p;
	protected FriendState type;
	protected CommState status;
	protected PlayerState skr;
	protected int indexOf;
	public FRIEND_UPDATE_ACK(Player p, FriendState type, int indexOf, int realstatus, int real_status)
	{
		super(true);
		this.p = p;
		this.type = type;
		this.indexOf = indexOf;
		skr = EssencialUtil.gI().PLAYER_STATE(p.id);
		if (realstatus == 0)
		{
			if (real_status == 0)
				status = skr.state;
			else
				status = CommState.valueOf(real_status);
		}
		else
		{
			status = CommState.valueOf(realstatus);
		}
		p.last_fstate = status.value;
	}
	@Override
	public void writeImpl()
	{		
		WriteC(type.value);
		WriteC(indexOf);
		if (type == FriendState.INSERIR || type == FriendState.ATUALIZAR)
		{
			WriteC(p.name.length() + 1);
			WriteS(p.name, p.name.length() + 1);
			WriteQ(p.id);
			WriteC(skr.state.value >= 18 && skr.state.value <= 48 ? 0 : skr.room_id);
			WriteC(skr.state.value >= 18 && skr.state.value <= 48 ? 0 : skr.channel_id * 16);
			WriteC(skr.state.value >= 18 && skr.state.value <= 48 ? 0 : skr.server_id * 16);
			WriteC(status.value);
			WriteC(p.rank);
			WriteH(32768);
			WriteC(255);
		}
		else
		{
			WriteB(new byte[17]);
		}
	}
}