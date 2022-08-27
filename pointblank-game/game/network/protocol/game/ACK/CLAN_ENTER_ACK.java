package game.network.protocol.game.ACK;

public class CLAN_ENTER_ACK extends game.network.protocol.GamePacketACK
{
	protected int clan_id;
	protected int role;
	public CLAN_ENTER_ACK(int clan_id, int role)
	{
		super(true);
		this.clan_id = clan_id;
		this.role = role;
	}
	@Override
	public void writeImpl()
	{
		WriteD(clan_id);
		WriteD(role);
		if (clan_id == 0 || role == 0)
		{
			WriteD(ck.clans.size());
            WriteD(0x800001AB); //AA 5E 02 E7
            WriteB(new byte[] { 0x6C, 0x44, 0x37 }); //4C DB 2A
		}
	}
}