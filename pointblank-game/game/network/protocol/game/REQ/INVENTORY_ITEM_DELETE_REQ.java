package game.network.protocol.game.REQ;

import game.network.protocol.game.ACK.*;

import java.util.*;

import core.models.*;

public class INVENTORY_ITEM_DELETE_REQ extends game.network.protocol.GamePacketREQ 
{
	protected PlayerInventory invent;
	protected Player player;
	protected long object;
	protected int itemId;
	protected int error = 1;
    public INVENTORY_ITEM_DELETE_REQ(int opcode)
    {
        super(opcode);
    }
    @Override
    public void readImpl()
    {
    	player = client.getPlayer();
    	if (player != null)
    		invent = player.buscarPeloObjeto(object = ReadQ());
    }
	@Override
	public void runImpl()
	{
		try
		{
			if (invent != null)
			{
				itemId = invent.item_id;
				Room room = client.getRoom();
				if (room == null)
					room = new Room(0, 0, 0, 0);
				List<PlayerInventory> armasExcluir = new ArrayList<PlayerInventory>();
				armasExcluir.add(invent);
				room.resetCupons(armasExcluir, player, client.getRoom() != null);
				armasExcluir = null;
			}
			else
			{
				error = 0x800010A7;
			}
		}
		catch (Exception e)
		{
			error = 0x800010A2;
		}
		sendPacket(new INVENTORY_ITEM_DELETE_ACK(object, itemId, error, player));
	}
}