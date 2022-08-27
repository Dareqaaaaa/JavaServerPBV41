package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class SHOP_ENTER_REQ extends game.network.protocol.GamePacketREQ
{
	public SHOP_ENTER_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
	}
	@Override
	public void runImpl()
	{
		Room r = client.getRoom();
		Player p = client.getPlayer();
		if (r != null && p != null && r.getSlotState(p).ordinal() < 9)
		{
			r.changeState(p, SlotState.SHOP, true);
			p.clan_nome = "";
			p.novo_nome = "";
		}
		sendPacket(new SHOP_ENTER_ACK());
	}
}