package game.network.protocol.game.ACK;

import game.network.protocol.*;

public class VOTEKICK_RESULT_ACK extends GamePacketACK
{
	protected int jogador_kikado;
	protected int kikar;
	protected int deixar;
	protected int error;
	public VOTEKICK_RESULT_ACK(int jogador_kikado, int kikar, int deixar, boolean kikado, boolean escape)
	{
		super(true);
		this.jogador_kikado = jogador_kikado;
		this.kikar = kikar + 1;
		this.deixar = deixar + 1;
		if (!kikado) error = 0x80001101; //Vote perdido
		if (escape) error = 0x80001100; //Jogador quer cancelar votação
	}
	@Override
	public void writeImpl()
	{
		WriteC(jogador_kikado);
		WriteC(kikar);
		WriteC(deixar);
		WriteD(error);
	}
}