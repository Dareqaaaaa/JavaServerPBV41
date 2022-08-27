package game.network.protocol.game.ACK;

public class CLAN_MEMBER_CONTEXT_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
	protected int jogadores;
	public CLAN_MEMBER_CONTEXT_ACK(int error, int jogadores)
	{
		super(true);
		this.error = error;
		this.jogadores = jogadores;
	}
	@Override
	public void writeImpl()
	{
        WriteD(error);
        if (error == 0)
        {
	        WriteC(jogadores);
	        WriteC(jogadores);
	        WriteC(1);
	        WriteH(7934);
	        WriteH(14147);
        }
	}
}