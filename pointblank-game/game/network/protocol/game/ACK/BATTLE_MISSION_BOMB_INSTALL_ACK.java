package game.network.protocol.game.ACK;

import core.enums.*;
import core.udp.*;

public class BATTLE_MISSION_BOMB_INSTALL_ACK extends game.network.protocol.GamePacketACK
{
	protected int slot;
	protected BombMap local;
	protected UDP_PosRotation position;
	public BATTLE_MISSION_BOMB_INSTALL_ACK(int slot, BombMap local, UDP_PosRotation position)
	{
		super(true);
		this.slot = slot;
		this.local = local;
		this.position = position;
	}
	@Override
	public void writeImpl()
	{
		WriteD(slot);
		WriteC(local.ordinal());
		WriteH(42);
		WriteH(position.posX);
		WriteH(position.posY);
		WriteH(position.posZ);
		WriteH(position.camX);
		WriteH(position.camY);
		WriteH(position.area);
	}
}