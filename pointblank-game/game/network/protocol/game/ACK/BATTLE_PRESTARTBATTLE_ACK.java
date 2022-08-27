package game.network.protocol.game.ACK;

import core.info.Software;
import core.models.*;
import core.system.*;
import core.utils.*;

public class BATTLE_PRESTARTBATTLE_ACK extends game.network.protocol.GamePacketACK
{
	protected Player player;
	protected Room room;
	protected int slot;
	protected int error;
	protected boolean hit_part;
	public BATTLE_PRESTARTBATTLE_ACK(Room room, Player player, int slot, boolean hit_part, int error)
	{
		super(true);
		this.player = player;
		this.room = room;
		this.slot = slot;
		this.hit_part = hit_part;
		this.error = error;
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
		if (error == 0)
			return;
		WriteD(slot);
		WriteC(ConnectionLoader.gI().udp.ordinal());
		WriteB(room.getLeader().IP());
		WriteH(conn.SECURITY_KEY);
		WriteB(room.getLeader().localhost);
		WriteH(conn.SECURITY_KEY);
		WriteC(0);
		WriteB(player.IP());
		WriteH(conn.SECURITY_KEY);
		WriteB(player.localhost);
		WriteH(conn.SECURITY_KEY);
		WriteC(0);
		WriteB(NetworkUtil.parseIpToBytes(Software.pc.battle));
		WriteH(40000);
		WriteD(room.index);
		WriteD(room.seed);
		if (hit_part)
			WriteB(new byte[] { 10, 0x22, 0, 1, 16, 3, 0x1e, 5, 6, 7, 4, 9, 0x16, 0x0b, 0x1b, 8, 0x0e, 0x0f, 2, 0x11, 0x12, 0x21, 0x14, 0x15, 0x13, 0x17, 0x18, 0x19, 0x1a, 0x0c, 0x1c, 0x1d, 0x0d, 0x1f, 0x20 }); //WriteB(NetworkUtil.hexStringToByteArray("02 18 19 1A 06 1C 14 1E 10 20 1D 22 0C 01 0A 1F 04 0D 1B 07 08 17 0B 11 15 00 0E 0F 21 02 05 13 03 09 16"));
	}
}