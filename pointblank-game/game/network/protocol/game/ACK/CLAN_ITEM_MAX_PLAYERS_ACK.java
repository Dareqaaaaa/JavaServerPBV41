package game.network.protocol.game.ACK;

public class CLAN_ITEM_MAX_PLAYERS_ACK extends game.network.protocol.GamePacketACK
{
	protected int vagas;
	public CLAN_ITEM_MAX_PLAYERS_ACK(int vagas)
	{
		super(true);
		this.vagas = vagas;
	}
	@Override
	public void writeImpl()
	{
		WriteC(vagas);
	}
}