package game.network.protocol.game.ACK;

public class CLAN_MATCH_CLAN_PART2_ACK extends game.network.protocol.GamePacketACK
{
	protected int clanfrontos;
	public CLAN_MATCH_CLAN_PART2_ACK(int clanfrontos)
	{
		super(true);
		this.clanfrontos = clanfrontos;
	}
	@Override
	public void writeImpl()
	{
		WriteC(clanfrontos);
		WriteC(13);
		WriteC(clanfrontos);
	}
}