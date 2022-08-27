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
	CONVITE, //O Cl� [Ghost] lhe convidou para se tornar membro. Deseja aceitar?
	PEDIDO_APROVADO, //Parab�ns! Seu cadastro foi aprovado
	PEDIDO_RECUSADO, //Seu pedido de cadastro no clan [Ghost] foi recusado.
	CONVITE_ACEITO, //Usu�rio [PISTOLA] aceitou o convite de cadastro no Cl�.
	CONVITE_REJEITADO, //Usu�rio [PISTOLA] rejeitou o convite de cadastro no Cl�.
	ABANDONOU_CLAN, //Usu�rio [PISTOLA] abandonou o Cl�.
	EXCLUIDO_CLAN, //[Ghost] foi excluido do Cl�.
	LIDER_CLAN, //L�der do Cl� foi substituido. Parab�ns, voc� � o novo L�der do Cl�.
	AUXILIAR_CLAN, //Parab�ns. O l�der do Cl� lhe nomeou como Auxiliar do cl�.
	MEMBRO_CLAN, //L�der do Cl� lhe nomeou como membro.
	MAX; //NULL
}