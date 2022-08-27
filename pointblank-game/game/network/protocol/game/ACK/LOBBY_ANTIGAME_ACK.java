package game.network.protocol.game.ACK;

public class LOBBY_ANTIGAME_ACK extends game.network.protocol.GamePacketACK
{
	protected long unk;
	public LOBBY_ANTIGAME_ACK(long unk)
	{
		super(true);
		this.unk = unk;
	}
	@Override
	public void writeImpl()
	{
		WriteQ(unk); //minutos bloqueados?
	}
}
