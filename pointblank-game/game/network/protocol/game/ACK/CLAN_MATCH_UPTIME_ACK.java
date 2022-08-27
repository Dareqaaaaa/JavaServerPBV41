package game.network.protocol.game.ACK;

public class CLAN_MATCH_UPTIME_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	protected int formacao;
	public CLAN_MATCH_UPTIME_ACK(int error, int formacao)
	{
		super(true);
		this.error = error;
		this.formacao = formacao;
	}
	@Override
	public void writeImpl()
	{
        WriteD(error);
        if (error == 0)
        	WriteC(formacao);
	}
}