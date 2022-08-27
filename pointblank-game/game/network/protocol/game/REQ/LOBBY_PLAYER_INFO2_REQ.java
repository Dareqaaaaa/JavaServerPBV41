package game.network.protocol.game.REQ;

import core.models.*;
import game.network.protocol.game.ACK.*;

public class LOBBY_PLAYER_INFO2_REQ extends game.network.protocol.GamePacketREQ
{
	protected PlayerEquipment e;
	public LOBBY_PLAYER_INFO2_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		try
		{
			Channel ch = client.getChannel();
			if (ch != null)
			{
				Player p = ch.BUSCAR_JOGADOR_LOBBY(ReadD());
				if (p != null)
					e = p.equipment;
			}
		}
		catch (Exception e)
		{
		}
	}
	@Override
	public void runImpl()
	{
		sendPacket(new LOBBY_PLAYER_INFO2_ACK(e));
	}
}