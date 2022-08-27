package core.models;

public class User
{
	public String user;
	public String pass;
	public String host;
	public String hwid;
	public String client;
	public int revision;
	public String battle;
	public User(String user, String pass, String host, String client, int revision,String battle, String hwid)
	{
		this.user = user;
		this.pass = pass;
	    this.battle = battle;
		this.host = host;
		this.client = client;
		this.revision = revision;
		this.hwid = hwid;
	}
}