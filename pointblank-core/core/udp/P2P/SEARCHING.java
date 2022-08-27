package core.udp.P2P;

import core.udp.*;

public class SEARCHING extends UDP_P2P
{
	public SEARCHING(int value)
	{
		System.out.println(" [UDPPacketReceiver] Invalid recv packet " + value);
		System.out.flush();
	}
	@Override
	public void avoid()
	{
	}
}