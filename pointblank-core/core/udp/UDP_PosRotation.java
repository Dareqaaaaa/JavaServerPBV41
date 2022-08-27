package core.udp;

public class UDP_PosRotation
{
	public int posX, posY, posZ;
	public int camX, camY, area;
	public UDP_PosRotation(int posX, int posY, int posZ, int camX, int camY, int area)
	{
		this.posX = posX;
		this.posY = posY;
		this.posZ = posZ;
		this.camX = camX;
		this.camY = camY;
		this.area = area;
	}
	@Override
	public String toString()
	{
		return "posX: " + posX + " posY: " + posY + " posZ: " + posZ + " camX: " + camX + " camY: " + camY + " area: " + area;
	}
}