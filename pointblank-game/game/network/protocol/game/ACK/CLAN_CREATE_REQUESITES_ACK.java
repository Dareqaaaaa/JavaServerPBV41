package game.network.protocol.game.ACK;

public class CLAN_CREATE_REQUESITES_ACK extends game.network.protocol.GamePacketACK
{
	public CLAN_CREATE_REQUESITES_ACK()
	{
		super(true);
	}
	@Override
	public void writeImpl()
	{
		WriteC(setting.clan_requerits_rank);
		WriteD(setting.clan_requerits_gold);
	}
}