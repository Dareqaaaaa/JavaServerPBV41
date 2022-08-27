package game.network.protocol.game.REQ;

import core.models.*;
import game.network.protocol.game.ACK.*;

public class CLAN_SAVE_ACCESS_REQ extends game.network.protocol.GamePacketREQ
{
	protected int error = 0; //1
	public CLAN_SAVE_ACCESS_REQ(int opcode)
	{
		super(opcode);
	}
	@Override
	public void readImpl()
	{
		Player p = client.getPlayer();
		if (p != null)
		{
			try
			{
				Clan c = ck.getClanId(p.clan_id);
				if (c != null && c.owner == p.id)
				{
			        c.autoridade = ReadC();
			        c.limite_rank = ReadC();
			        c.limite_idade = ReadC();
			        c.limite_idade2 = ReadC();
			        db.updateClanAccess(c);
		    		for (Player f : ck.getPlayers(c))
						if (f != null && f.connection != null)
							f.connection.sendPacket(new CLAN_CREATE_ACK(c, 0, f.gold));
				}
				else
				{
					error = 0x8000106E;
				}
			}
			catch (Exception e)
			{
				error = 0x8000106E;
			}
		}
		else
		{
			error = 0x8000106E;
		}
	}
	@Override
	public void runImpl()
	{
		sendPacket(new CLAN_SAVE_ACCESS_ACK(error));
	}
}