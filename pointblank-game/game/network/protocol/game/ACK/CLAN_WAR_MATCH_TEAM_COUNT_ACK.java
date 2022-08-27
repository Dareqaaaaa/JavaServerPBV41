package game.network.protocol.game.ACK;

public class CLAN_WAR_MATCH_TEAM_COUNT_ACK extends game.network.protocol.GamePacketACK
{
	protected int formacao;
	public CLAN_WAR_MATCH_TEAM_COUNT_ACK(int formacao)
	{
		super(true);
		this.formacao = formacao;
	}
	@Override
	public void writeImpl()
	{
		WriteH(formacao);
		WriteC(13);
		WriteH(formacao);
	}
}