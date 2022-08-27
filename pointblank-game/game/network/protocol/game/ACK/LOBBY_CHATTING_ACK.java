package game.network.protocol.game.ACK;

import core.models.*;

public class LOBBY_CHATTING_ACK extends game.network.protocol.GamePacketACK
{
	protected Player p;
	protected String message;
	protected String owner;
	protected int color;
	public LOBBY_CHATTING_ACK(Player p, String message, String owner)
	{
		super(true);
		this.p = p;
		this.message = message;
		this.owner = owner;
		if (p != null && p.coupon != null && p.coupon.cor_chat != 0)
			color = p.coupon.cor_chat;
		else
			color = p.color;
	}
	@Override
	public void writeImpl()
	{
		WriteD(p.channelIdx);
		WriteC(owner.length() + 1);
		WriteS(owner, owner.length() + 1);
		WriteC(color);
		WriteC(p.rank == 53 || p.rank == 54 ? 1 : 0);
		WriteH(message.length() + 1);
		WriteS(message, message.length() + 1);
	}
}