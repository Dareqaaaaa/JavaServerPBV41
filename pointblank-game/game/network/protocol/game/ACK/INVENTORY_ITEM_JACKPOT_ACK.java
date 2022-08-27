package game.network.protocol.game.ACK;

public class INVENTORY_ITEM_JACKPOT_ACK extends game.network.protocol.GamePacketACK
{
	protected String winner;
	protected int item_id;
	protected int indexOf;
	public INVENTORY_ITEM_JACKPOT_ACK(String winner, int item_id, int indexOf)
	{
		super(true);
		this.winner = winner;
		this.item_id = item_id;
		this.indexOf = indexOf;
	}
	@Override
	public void writeImpl()
	{
		WriteC(winner.length() + 1);
		WriteS(winner, winner.length() + 1);
		WriteD(item_id);
		WriteC(indexOf);
	}
}