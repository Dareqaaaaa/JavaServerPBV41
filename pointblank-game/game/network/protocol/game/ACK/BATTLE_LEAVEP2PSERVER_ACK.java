package game.network.protocol.game.ACK;

import core.models.*;
import game.network.protocol.*;

public class BATTLE_LEAVEP2PSERVER_ACK extends GamePacketACK
{
	protected Player p;
	protected int slot;
	protected int type;
	public BATTLE_LEAVEP2PSERVER_ACK(Player p, int slot, int type)
	{
		super(true);
		this.p = p;
		this.slot = slot;
		this.type = type;
	}
	@Override
	public void writeImpl()
	{
		WriteD(slot);
		WriteC(type); //0 - Deixou o combate | 1 - Deixou o combate (GM) | 2 - Deixou o combate (Votekick)
		WriteD(p != null ? p.exp : 0);
		WriteD(p != null ? p.rank : 0);
		WriteD(p != null ? p.gold : 0);
		WriteD(p != null ? p.stats.kitou : 0);
		WriteD(p != null ? p.stats.kitou : 0);
	}
}