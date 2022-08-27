package game.network.protocol.game.ACK;

import core.enums.*;
import core.models.*;

public class ROOM_CHANGE_STATE_ACK extends game.network.protocol.GamePacketACK
{
	protected Room room;
	protected RoomState state;
	public ROOM_CHANGE_STATE_ACK(Room room, RoomState state)
	{
		super(true);
		this.room = room;
		this.state = state;
	}
	@Override
	public void writeImpl()
	{
		WriteD(room.id);
		WriteS(room.name, 23);
		WriteH(room.map);
		WriteC(room.stage4v4);
		WriteC(room.type.ordinal());
		WriteC(state.ordinal());
		WriteC(room.getPlayers().size());
		WriteC(room.slots());
		WriteC(room.ping);
		WriteC(room.allWeapons);
		WriteC(room.randomMap);
		WriteC(room.special);
		WriteS(room.getLeader().name, 33);
		WriteD(room.killMask);
        WriteC(room.limit);
        WriteC(room.seeConf);
        WriteH(room.balanceamento);
        if (room.special == 6 || room.special == 9)
        {
			WriteC(room.aiCount);
			WriteC(room.aiLevel);
        }
	}
}