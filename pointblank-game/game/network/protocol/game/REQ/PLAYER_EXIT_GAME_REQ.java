package game.network.protocol.game.REQ;

import core.models.*;
import game.network.protocol.game.ACK.*;

public class PLAYER_EXIT_GAME_REQ extends game.network.protocol.GamePacketREQ
{
	public PLAYER_EXIT_GAME_REQ(int opcode)
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
		Player p = client.getPlayer();
		if (p != null)
			p.changeServer = false;
		sendPacket(new PLAYER_EXIT_GAME_ACK());
	}
}