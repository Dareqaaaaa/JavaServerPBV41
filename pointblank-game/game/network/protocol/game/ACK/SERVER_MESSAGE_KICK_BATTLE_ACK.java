package game.network.protocol.game.ACK;

import core.enums.*;
import core.models.*;
import game.network.protocol.*;

public class SERVER_MESSAGE_KICK_BATTLE_ACK extends GamePacketACK
{
	protected int error;
	public SERVER_MESSAGE_KICK_BATTLE_ACK(BattleErrorMessage error, Room room, RoomSlot slot)
	{
		super(true);
		this.error = error.value;
		if (room != null && slot != null)
		{
			room.changeStateInfo(slot, SlotState.NORMAL, true);
			room.VERIFICAR_JOGADORES_NA_PARTIDA(slot.id);
			room.TROCAR_HOST(0, slot.id);
		}
	}
	@Override
	public void writeImpl()
	{
		WriteD(error);
	}
}