package game.network.protocol.game.ACK;

public class ROOM_INVITE_RETURN_ACK extends game.network.protocol.GamePacketACK
{
	protected int error;
    public ROOM_INVITE_RETURN_ACK(int error)
    {
        super(true);
        this.error = error;
    }
    @Override
    public void writeImpl()
    {
        WriteD(error);
    }
}