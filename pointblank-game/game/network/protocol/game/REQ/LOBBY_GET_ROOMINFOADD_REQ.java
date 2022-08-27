package game.network.protocol.game.REQ;

import core.models.*;
import game.network.protocol.game.ACK.*;

public class LOBBY_GET_ROOMINFOADD_REQ extends game.network.protocol.GamePacketREQ
{
	protected Room r;
	public LOBBY_GET_ROOMINFOADD_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		Channel ch = client.getChannel();
		if (ch != null)
			r = ch.BUSCAR_SALA(ReadD());
	}
	@Override
	public void runImpl()
	{
		if (r != null) sendPacket(new LOBBY_GET_ROOMINFOADD_ACK(r));
	}
}