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

public enum MapsEnum
{
	EMPTY(0),
	PORTAKABA(0x01),
    REDROCK(0x02),
    LIBRARY(0x03),
    MSTATION(0x04),
    MIDNIGHTZONE(0x05),
    UPTOWN(0x06),
    BURNINGHALL(0x07),
    DSQUAD(0x08),
    CRACKDOWN(0x09),
    SAINTMANSION(0x0a),
    EASTERNROAD(0x0b),
    DOWNTOWN(0x0c),
    LUXVILLE(0x0d),
    BLOWCITY(0x0e),
    STORMTUBE(0x0f),
    BREAKDOWN(0x11),
    TRAININGCAMP(0x12),
    SENTRYBASE(0x13),
    DESERTCAMP(0x14),
    KICKPOINT(0x15),
    FACEROCK(0x16),
    SUPPLYBASE(0x17),
    SANDSTORM(0x18),
    SHOPPINGCENTER(0x2d),
    SAFARI(0x2e),
    DRAGONALLEY(0x2f),
    MACHUPICHU(0x30),
    TWOTOWERS(0x32),
    ANGKORRUINS(0x39),
    GHOSTTOWN(0x3c),
    GRANDBAZAAR(0x3d),
    UNDER23(0x3f),
    TAIPEICITYMALL(0x40),
    SAFARI2(0x41),
    METRO(0x44),
    RUSHHOUR(0x4d),
    CARGOPORT(0x4e),
    BLACKMAMBA(0x4f),
    HOLIDAY(0x51),
    WESTSTATION(0x52),
    HOUSEMUSEUM(0x54),
    WATERCOMPLEX(0x58),
    HOTELCAMOUFLAGE(0x59),
    PARQUE_ASSOMBRADO(0x55),
    TESTMAP(0x5f),
    BATTLESHIP(0x5a),
    TEST(0x61),
    ROTHENVILLAGE(0x56),
    RAMPARTTOWN(0x5d),
    HINDRANCE(0x62),
    SEWERAGE(0x63),
    SLUMAREA(0x64),
    NEWLIBRARY(0x65),
    FATALZONE(104),
    MARINEWAVE(105),
    TESTE1(106),
    BB_DOWNTOWN(0x19),
    BB_LUXVILLE(0x1a),
    BB_OUTPOST(0x1b),
    BB_BLOWCITY(0x1c),
    BB_STORMTUBE(0x1d),
    BB_SENTRYBASE(0x1e),
    BB_HOSPITAL(0x1f),
    BB_DOWNTOWN2(0x20),
    BB_SHOPPINGCENTER(0x21),
    BB_SANDSTORM(0x22),
    BB_CARGOSHIP(0x31),
    BB_AIRPORT(0x42),
    BB_SAFEHOUSE(0x50),
    BB_HARDROCK(0x53),
    BB_RAMPARTTOWN(0x5b),
    BB_BALLISTIC(0x5c),
    BB_FALLUCITY(0x5e),
    DS_BREAKDOWN(0x23),
    DS_HELISPOT(0x26),
    DF_BLACKPANTHER(0x27),
    ES_BREEDINGNEST(0x28),
    ES_DUPTOWN(0x29),
    ES_DINOBREAKDOWN(0x2a),
    ES_DINORUINS(0x67),
    TUTORIAL(0x2c),
    CC_CRACKDOWN(0x33),
    CC_SAINTMANSION(0x34),
    CC_DSQUAD(0x35),
    CC_PORTAKABA(0x36),
    CC_MSTATION(0x37),
    CC_TRAININGCAMP(0x38),
    CC_REDROCK(0x3a),
    CC_SAFARI(0x3b),
    CC_DINOLAB(0x3e),
    CC_SAFARI2(0x43),
    UU_HOLIDAY(0x57),
    EH_SANDSTORM(0x66),
    EH_HOLIDAY(0x60),
    EH_MERRYWHITEVILLAGE(0x45),
    EC_STILL_RAID(106);
	public int value;
	MapsEnum(int value)
	{
		this.value = value;
	}
}