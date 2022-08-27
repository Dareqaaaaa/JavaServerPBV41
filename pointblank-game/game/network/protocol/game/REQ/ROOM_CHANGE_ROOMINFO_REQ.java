package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;

public class ROOM_CHANGE_ROOMINFO_REQ extends game.network.protocol.GamePacketREQ
{
	protected Room r;
	protected ModesEnum type;
	protected int map, weapon;
	protected boolean autorized, camp;
	public ROOM_CHANGE_ROOMINFO_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		r = client.getRoom();
		if (r != null && r.rstate == RoomState.READY && r.LIDER == client.pId)
		{
			String name = r.name;
			ReadD();
			r.name = ReadS(23);
			map = r.map;
			type = r.type;
			weapon = r.allWeapons;
			r.map = ReadH();
			r.stage4v4 = ReadC();
			r.type = ModesEnum.values()[ReadC()];
			ReadC();
			ReadC();
			ReadC();
			r.ping = ReadC();
			if (!r.isPorrada)
			{
				r.allWeapons = ReadC();
			}
			else
			{
				ReadC();
			}
			r.randomMap = ReadC(); 
			r.special = ReadC(); 
			r.aiCount = ReadC();
			r.aiLevel = ReadC();
			r.badName();
			r.badConfig();
			autorized = true;
			if (!(name.contains("@Camp") || name.contains("@camp") || name.contains("@CAMP")))
			{
				if (r.block())
					camp = true;
			}
		}
		else
		{
			autorized = false;
		}
	}
	@Override
	public void runImpl()
	{
		if (autorized)
		{
			final boolean upInfo = r.contarPeloState(SlotState.READY) > 0;
			if (r.rstate == RoomState.READY)
				if (map != r.map || type != r.type || weapon != r.allWeapons || camp)
					for (int i = 0; i < 16; i++)
						if (r.getSlotState(i) == SlotState.READY)
							r.changeStateInfo(i, SlotState.NORMAL, false);
			r.updateBInfo();
			if (upInfo)
				r.updateInfo();
		}
	}
}