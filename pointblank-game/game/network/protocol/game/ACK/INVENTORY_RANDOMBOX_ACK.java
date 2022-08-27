package game.network.protocol.game.ACK;

public class INVENTORY_RANDOMBOX_ACK extends game.network.protocol.GamePacketACK
{
	protected int item_id;
	protected int indexOf;
	public INVENTORY_RANDOMBOX_ACK(int item_id, int indexOf)
    {
        super(true);
        this.item_id = item_id;
        this.indexOf = indexOf;
    }
	@Override
    public void writeImpl()
    {
    	WriteD(item_id);
    	WriteC(indexOf); 
    }
}