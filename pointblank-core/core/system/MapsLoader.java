package core.system;

import core.enums.*;

public class MapsLoader extends SystemLoader
{
	protected static final MapsLoader INSTANCE = new MapsLoader();
	public int TUTORIAL;
	public int DEATHMACH;
	public int DESTRUICAO;
	public int SABOTAGEM;
	public int SUPRESSAO;
	public int DEFESA;
	public int CHALLENGE;
	public int DINO;
	public int SNIPER;
	public int SHOTGUN;
	public int HEADHUNTER;
	public int SOCO;
	public int CROSSCOUNTER;
	public int CAOS;
	public int ESCOLTA;
	public MapsLoader()
	{
		super("data/maps/modes/modes.pistola");
		TUTORIAL = MapsEnum.valueOf(ReadS("TUTORIAL")).value;
		DEATHMACH = MapsEnum.valueOf(ReadS("DEATHMACH")).value;
		DESTRUICAO = MapsEnum.valueOf(ReadS("DESTRUICAO")).value;
		SABOTAGEM = MapsEnum.valueOf(ReadS("SABOTAGEM")).value;
		SUPRESSAO = MapsEnum.valueOf(ReadS("SUPRESSAO")).value;
		DEFESA = MapsEnum.valueOf(ReadS("DEFESA")).value;
		CHALLENGE = MapsEnum.valueOf(ReadS("CHALLENGE")).value;
		DINO = MapsEnum.valueOf(ReadS("DINO")).value;
		SNIPER = MapsEnum.valueOf(ReadS("SNIPER")).value;
		SHOTGUN = MapsEnum.valueOf(ReadS("SHOTGUN")).value;
		HEADHUNTER = MapsEnum.valueOf(ReadS("HEADHUNTER")).value;
		SOCO = MapsEnum.valueOf(ReadS("SOCO")).value;
		CROSSCOUNTER = MapsEnum.valueOf(ReadS("CROSSCOUNTER")).value;
		CAOS = MapsEnum.valueOf(ReadS("CAOS")).value;
		ESCOLTA = MapsEnum.valueOf(ReadS("ESCOLTA")).value;
		PROPERTIES.clear();
	}
	public static MapsLoader gI()
	{
		return INSTANCE;
	}
}