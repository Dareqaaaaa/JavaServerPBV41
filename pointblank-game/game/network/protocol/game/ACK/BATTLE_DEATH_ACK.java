package game.network.protocol.game.ACK;

import core.models.*;

public class BATTLE_DEATH_ACK extends game.network.protocol.GamePacketACK
{
	protected Room r;
	protected FragInfos info;
	protected RoomSlot killer;
	public BATTLE_DEATH_ACK(Room r, FragInfos info)
	{
		super(true);
		this.r = r;
		this.info = info;
		if (info == null)
			runner = false;
		killer = r.getRoomSlot(info.slot);
	}
	@Override
	public void writeImpl()
	{
		WriteC(info.index);
        WriteC(info.count);
        WriteC(info.slot);
        WriteD(info.weapon);
		WriteH(info.position.posX);
		WriteH(info.position.posY);
		WriteH(info.position.posZ);
		WriteH(info.position.camX);
		WriteH(info.position.camY);
		WriteH(info.position.area);
        WriteC(info.flag);
        for (Frag frag : info.frags)
    	{
            WriteC(frag.index);
            WriteC(frag.hits);
            WriteH(killer.killMessage.value);
    		WriteH(frag.position.posX);
    		WriteH(frag.position.posY);
    		WriteH(frag.position.posZ);
    		WriteH(frag.position.camX);
    		WriteH(frag.position.camY);
    		WriteH(frag.position.area);
            WriteC(frag.flag);
		}
        WriteH(r.redKills);
        WriteH(r.blueKills);
        WriteH(r.blueKills);
        WriteH(r.redKills);
	    for (int i = 0; i < 16; i++)
        {
			WriteH(r.getRoomSlot(i).allKills);
			WriteH(r.getRoomSlot(i).allDeaths);
		}
	    int kOL = killer.oneTimeKills;
	    WriteC(kOL > 4 ? 4 : kOL > 0 ? kOL - 1 : 0);
        WriteH(killer.score);
	}
}