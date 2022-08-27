package game.network.protocol.game.ACK;

public class AUTH_SEND_WHISPER_ACK extends game.network.protocol.GamePacketACK
{
	protected String sender;
	protected String message;
	protected int error;
	protected int susurro;
	public AUTH_SEND_WHISPER_ACK(String sender, String message, int error, int susurro)
	{
		super(true);
		this.sender = sender;
		this.message = message;
		this.error = error;
		this.susurro = susurro;
	}
	@Override
	public void writeImpl()
	{
		if (error == 0)
		{
			WriteD(error);
			WriteS(sender, 33);
			WriteH(message.length() + 1);
			WriteS(message, message.length() + 1);
		}
		else
		{
			WriteC(susurro);
			WriteD(error);
			WriteS(sender, 33);
		}
	}
}