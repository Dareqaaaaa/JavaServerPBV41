package game.network.protocol.game.ACK;

import core.enums.*;

public class FRIEND_UPDATE2_ACK extends game.network.protocol.GamePacketACK
{
	protected FriendState type;
	protected int indexOf;
	public FRIEND_UPDATE2_ACK(FriendState type, int indexOf)
	{
		super(true);
		this.type = type;
		this.indexOf = indexOf;
	}
	@Override
	public void writeImpl()
	{
		WriteC(type.value);
		WriteC(indexOf);
		WriteB(new byte[17]);
	}
}