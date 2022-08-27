package core.system;

public class ConfigurationLoader extends SystemLoader
{
	protected static final ConfigurationLoader INSTANCE = new ConfigurationLoader();

	public boolean login_active;
	public boolean auto_account;
	public boolean only_gm;
	public boolean outpost;
	public boolean mission_active;
	public boolean room_create;
	public boolean battle_cash;
	public String ikinciipi;

	public int account_for_address;
	public int votekick_requirits_rank;
	public int clan_requerits_rank;
	public int clan_requerits_gold;

	public String driver;
	public String url;
	public String username;
	public String password;

	public int maxActive;
	public int maxIdle;

	public String validationQuery;

	public int login_min_length = 5;
	public int login_max_length = 32;
	public int pass_min_length = 5;
	public int pass_max_length = 32;

	public ConfigurationLoader()
	{
		super("data/configuration/settings.pistola");
		LOAD();
	}
	@Override
	public void LOAD()
	{
		super.LOAD();
		login_active = ReadL("login_active");
		auto_account = ReadL("auto_account");
		only_gm = ReadL("only_gm");
		ikinciipi = ReadS("publicipi");
		outpost = ReadL("outpost");
		mission_active = ReadL("mission_active");
		room_create = ReadL("room_create");
		battle_cash = ReadL("battle_cash");
		account_for_address = ReadD("account_for_address");
		votekick_requirits_rank = ReadD("votekick_requirits_rank");
		clan_requerits_rank = ReadD("clan_requerits_rank");
		clan_requerits_gold = ReadD("clan_requerits_gold");
		driver = ReadS("driver");
		url = ReadS("url");
		username = ReadS("username");
		password = ReadS("password");
		maxActive = ReadD("maxActive");
		maxIdle = ReadD("maxIdle");
		PROPERTIES.clear();
	}
	public static ConfigurationLoader gI()
	{
		return INSTANCE;
	}
}