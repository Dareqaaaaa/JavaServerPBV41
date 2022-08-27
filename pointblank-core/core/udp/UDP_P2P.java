package core.udp;

import io.netty.buffer.*;

public abstract class UDP_P2P
{
	public ByteBuf buf;
	public int slot;
	public int length;
	public int flag;
	public UDP_Event events = UDP_Event.None;
	public UDP_P2P()
	{
	}
	public abstract void avoid();
}