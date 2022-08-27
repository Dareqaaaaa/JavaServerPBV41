package core.udp;

public class UDP_HPSync
{
	public short life;
	public boolean death;
	public UDP_HPSync(short life, boolean death)
	{
		this.life = life;
		this.death = death;
	}
	@Override
	public String toString()
	{
		return "life: " + life + " death: " + death;
	}
}