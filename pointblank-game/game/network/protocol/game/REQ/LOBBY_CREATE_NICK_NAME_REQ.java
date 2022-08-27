package game.network.protocol.game.REQ;

import core.models.*;
import core.utils.*;
import core.xml.*;
import game.network.protocol.game.ACK.*;

public class LOBBY_CREATE_NICK_NAME_REQ extends game.network.protocol.GamePacketREQ
{
	protected String nick;
	public LOBBY_CREATE_NICK_NAME_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		nick = ReadS(ReadC() - 1);
	}
	@Override
	public void runImpl()
	{
		try
		{
			if (AccountSyncer.gI().get(nick) == null && db.playerExist(nick) == 0 && !EssencialUtil.gI().VERIFICAR_APELIDO_NA_DATABASE(nick))
			{
				Player p = client.getPlayer();
				Channel ch = client.getChannel();
				if (p != null && ch != null && p.status() == 0 && !p.name.equals(nick) && nick.length() >= 3 && p.firstEnter)
				{
					p.name = nick;
					ch.ADICIONAR_JOGADOR(p);
					if (BONUS(p))
						sendPacket(new PUSH_PRESENT_ITEM_ACK(0));
					sendPacket(new LOBBY_CREATE_NICK_NAME_ACK(0));
					sendPacket(new MISSION_QUEST_GET_INFO_ACK(p));
					db.updateNick(p, nick);
					db.REPLACE_NICK(p.id, nick);
				}
				else
				{
					sendPacket(new LOBBY_CREATE_NICK_NAME_ACK(0x80000112)); //0x80000114
				}
			}
			else
			{
				sendPacket(new LOBBY_CREATE_NICK_NAME_ACK(0x80000113));
			}
		}
		catch (Exception e)
		{
			sendPacket(new LOBBY_CREATE_NICK_NAME_ACK(0x80000112));
		}
	}
	public boolean BONUS(Player p)
	{
		int size = 0;
		for (PlayerInventory it : TemplateXML.gI().items)
		{
			if (!it.starter && p.buscarPeloItemId(it.item_id) == null)
			{
				sendPacket(new INVENTORY_ITEM_CREATE_ACK(p, it.item_id, it.count, it.equip, -1, true));
				size++;
			}
		}
		return size > 0;
	}
}