package game.network.protocol.battle.REQ;

import core.models.*;
import core.xml.*;
import game.manager.*;
import game.network.protocol.*;


public class REQUEST_BATTLE_PRESTART_REQ extends BattlePacketREQ
{
	protected int roomId;
	protected int serverId;
	protected int channelId;
	protected int slot;
	protected int session;
	protected int event;
	public REQUEST_BATTLE_PRESTART_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		roomId = ReadD();
		serverId = ReadD();
		channelId = ReadD();
		slot = ReadD();
		session = ReadD();
		event = ReadD();
	}
	@Override
	public void runImpl()
	{
		Channel ch = GameServerXML.gI().getChannel(channelId, serverId);
		if (ch != null)
		{
			Room r = ch.BUSCAR_SALA(roomId);
			if (r != null)
			{
				Player p = r.getPlayerBySlot(slot);
				if (p != null && p.connection != null)
				{
					if (r.prepared1.containsKey(slot))
						r.prepared2.put(slot, p.id);
					else
					{
						r.prepared1.put(slot, p.id);
						r.prepared2.put(slot, p.id);
					}
					
					for (int i = 0; i < 16; i++)
					{
						Player m = r.getPlayerBySlot(i);
						if (m != null && r.getSlotState(i).ordinal() > 10)
							
					
					BattleServerManager.gI().PREPARE_PLAYER(r, slot);
					RoomSlot s = r.getRoomSlot(slot);
					if (s != null)
					{
						s.espectador = r.isGhostMode(p.espectador);
						s.death = r.isGhostMode(p.espectador);
						s.battleAccept = true;
					}
				}
			}
		}
	}
}
}