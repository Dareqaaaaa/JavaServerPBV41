package game.network.protocol.game.ACK;

import core.enums.*;
import core.network.*;

public class BASE_KICK_ACCOUNT_ACK extends game.network.protocol.GamePacketACK
{
	protected KickType type;
	public BASE_KICK_ACCOUNT_ACK(Connection conn, KickType type)
	{
		super(true);
		this.type = type;
		if (conn != null)
			conn.LEAVEP2P = type.ordinal();
	}
	@Override
	public void writeImpl()
	{
		WriteD(type.ordinal());
	}
}