/*
 * PointBlank Java Server
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Henrique Rodrigues
 * Copyright (C) 2015-2017
 */

package core.enums;

public enum NoteReceive
{
	CONVITE, //O Clã [Ghost] lhe convidou para se tornar membro. Deseja aceitar?
	PEDIDO_APROVADO, //Parabéns! Seu cadastro foi aprovado
	PEDIDO_RECUSADO, //Seu pedido de cadastro no clan [Ghost] foi recusado.
	CONVITE_ACEITO, //Usuário [PISTOLA] aceitou o convite de cadastro no Clã.
	CONVITE_REJEITADO, //Usuário [PISTOLA] rejeitou o convite de cadastro no Clã.
	ABANDONOU_CLAN, //Usuário [PISTOLA] abandonou o Clã.
	EXCLUIDO_CLAN, //[Ghost] foi excluido do Clã.
	LIDER_CLAN, //Líder do Clã foi substituido. Parabéns, você é o novo Líder do Clã.
	AUXILIAR_CLAN, //Parabéns. O líder do Clã lhe nomeou como Auxiliar do clã.
	MEMBRO_CLAN, //Líder do Clã lhe nomeou como membro.
	MAX; //NULL
}