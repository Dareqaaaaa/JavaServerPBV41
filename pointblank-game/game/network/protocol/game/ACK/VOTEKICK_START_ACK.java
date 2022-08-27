package game.network.protocol.game.ACK;

public class VOTEKICK_START_ACK extends game.network.protocol.GamePacketACK
{
	protected int pStart; 
	protected int pKick;
	protected int Motive;
	public VOTEKICK_START_ACK(int pStart, int pKick, int pMotive)
	{
		super(true);
		this.pStart = pStart;
        this.pKick = pKick;
        this.Motive = pMotive;
	}
	@Override
	public void writeImpl()
	{	
        WriteC(pStart);
        WriteC(pKick);
        WriteC(Motive);
	}
}