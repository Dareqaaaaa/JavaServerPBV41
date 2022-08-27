package game.network.protocol.game.REQ;

import core.enums.*;
import core.models.*;
import game.network.protocol.game.ACK.*;

public class ROOM_CHANGE_OPTIONINFO_REQ extends game.network.protocol.GamePacketREQ
{
	protected Room r;
	protected String leader_name;
	protected boolean autorized;
	public ROOM_CHANGE_OPTIONINFO_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		r = client.getRoom();
		if (r != null && r.rstate == RoomState.READY && r.LIDER == client.pId)
		{
			leader_name = ReadS(33);
			r.killMask = ReadC();
			ReadC();
			ReadC();
			ReadC();
			r.limit = ReadC();
			r.seeConf = ReadC();
			r.balanceamento = ReadH();
			autorized = true;
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
			for (int i = 0; i < 16; i++)
			{
				Player m = r.getPlayerBySlot(i);
				if (m != null)
					m.connection.sendPacket(new ROOM_CHANGE_OPTIONINFO_ACK(r, leader_name));
			}
			r.updateBInfo();
		}
	}
}