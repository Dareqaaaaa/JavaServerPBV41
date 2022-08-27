package game.network.protocol.game.ACK;

import game.network.protocol.*;

import java.util.*;

import core.models.*;
import core.utils.*;

public class BATTLE_MISSION_ROUND_PRE_START_ACK extends GamePacketACK
{
	protected Room r;
	public BATTLE_MISSION_ROUND_PRE_START_ACK(Room r)
	{
		super(true);
		this.r = r;
	}
	@Override
	public void writeImpl()
	{
		WriteH(r.getMaskSlotBattle(false, false, false));
		if (r.isDino(2))
		{
			List<Integer> pL = EssencialUtil.gI().DINOSSAUROS(r, r.dinossaur());
			WriteC((pL.size() == 1 || r.isDino(0)) ? 0xFF : r.rexDino);
			for (int slot : pL)
				if (slot != r.rexDino && r.isDino(1) || r.isDino(0))
					WriteC(slot);
			for (int i = 0; i < (7 - pL.size()); i++)
				WriteC(0xFF);
			WriteC(0xFF);
			WriteC(0xFF);
			WriteC(0xFF);
			pL = null;
		}
		else if (r.isRoundMap(4))
		{
			WriteB(new byte[] { (byte)0xFF, (byte)0xFF, (byte)0xFF, (byte)0xFF, (byte)0xFF, (byte)0xFF, (byte)0xFF, (byte)0xFF, (byte)0xFF, (byte)0xFF });
		}
		else if (r.isCaos())
		{
			WriteB(new byte[] { (byte)0xFF, (byte)0x01, (byte)0xFF, (byte)0xFF, (byte)0xFF, (byte)0xFF, (byte)0xFF, (byte)0xFF, (byte)0xFF, (byte)0xFF });
		}
		else
		{
			WriteB(new byte[10]);
		}
	}
}