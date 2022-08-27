package game.network.protocol.battle.REQ;

import core.models.*;
import core.xml.*;
import game.network.protocol.*;
import game.network.protocol.game.ACK.*;

public class REQUEST_GAME_SEND_REQ extends BattlePacketREQ
{
	protected int roomId;
	protected int serverId;
	protected int channelId;
	protected int slot;
	protected String aviso;
	public REQUEST_GAME_SEND_REQ(int opcode)
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
		aviso = ReadS(ReadD());
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
					p.connection.sendPacket(new ROOM_CHATTING_ACK(slot, 1, true, aviso));
				}
			}
		}
	}
}