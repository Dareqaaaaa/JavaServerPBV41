package game.network.protocol.game.ACK;

public class CLAN_IN_CS_LIST_ACK extends game.network.protocol.GamePacketACK
{
	public CLAN_IN_CS_LIST_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteD(ck.clans.size() - 1);
        WriteD(0x800001AB); //0x800001AA
        WriteB(new byte[] { 0x28, 0x4D, 0x0D });
	}
}