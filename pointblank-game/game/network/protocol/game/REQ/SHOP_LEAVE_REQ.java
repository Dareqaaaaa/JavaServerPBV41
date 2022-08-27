package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class SHOP_LEAVE_REQ extends game.network.protocol.GamePacketREQ
{
	protected int type;
	public SHOP_LEAVE_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		type = ReadD();
		if (type == 1) { CHARA(20); }
		else if (type == 2) { WEAPON(20); }
		else if (type == 3) { CHARA(40); WEAPON(20); }
	}
	public void WEAPON(int length)
	{
		Player p = client.getPlayer();
		if (p != null && buf.readableBytes() == length)
		{
			p.equipment.weapon_primary = ReadD(); 
			p.equipment.weapon_secundary = ReadD(); 
			p.equipment.weapon_melee = ReadD(); 
			p.equipment.weapon_grenade = ReadD(); 
			p.equipment.weapon_special = ReadD();
			db.updateWeapons(p, p.equipment);
		}
	}
	public void CHARA(int length)
	{
		Player p = client.getPlayer();
		if (p != null && buf.readableBytes() == length)
		{
			p.equipment.char_red = ReadD(); 
			p.equipment.char_blue = ReadD();
			p.equipment.char_head = ReadD(); 
			p.equipment.char_beret = ReadD(); 
			p.equipment.char_dino = ReadD();
			db.updateChara(p, p.equipment);
		}
	}
	@Override
	public void runImpl()
	{
		Room r = client.getRoom();
		Player p = client.getPlayer();
		if (r != null && p != null && r.getSlotState(p).ordinal() < 9)
		{
			r.changeState(p, SlotState.NORMAL, true);
			p.clan_nome = "";
			p.novo_nome = "";
		}
		sendPacket(new SHOP_LEAVE_ACK(type));
	}
}