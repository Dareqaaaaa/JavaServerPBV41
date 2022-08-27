/*
 Navicat Premium Data Transfer

 Source Server         : 200.186.165.124
 Source Server Type    : PostgreSQL
 Source Server Version : 90608
 Source Host           : 200.186.165.124:5432
 Source Catalog        : postgres
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90608
 File Encoding         : 65001

 Date: 23/03/2018 20:45:57
*/


-- ----------------------------
-- Sequence structure for clans_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."clans_id_seq";
CREATE SEQUENCE "public"."clans_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 5
CACHE 1;

-- ----------------------------
-- Sequence structure for contas_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."contas_seq";
CREATE SEQUENCE "public"."contas_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 7
CACHE 1;

-- ----------------------------
-- Sequence structure for ipsystem_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ipsystem_seq";
CREATE SEQUENCE "public"."ipsystem_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for jogador_amigo_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."jogador_amigo_seq";
CREATE SEQUENCE "public"."jogador_amigo_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for jogador_inventario_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."jogador_inventario_seq";
CREATE SEQUENCE "public"."jogador_inventario_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 580
CACHE 1;

-- ----------------------------
-- Sequence structure for jogador_mensagem_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."jogador_mensagem_seq";
CREATE SEQUENCE "public"."jogador_mensagem_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 63
CACHE 1;

-- ----------------------------
-- Sequence structure for loja_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."loja_seq";
CREATE SEQUENCE "public"."loja_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 2
CACHE 1;

-- ----------------------------
-- Sequence structure for noticias_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."noticias_id_seq";
CREATE SEQUENCE "public"."noticias_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for storage_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."storage_seq";
CREATE SEQUENCE "public"."storage_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 12
CACHE 1;

-- ----------------------------
-- Sequence structure for suporte_id_suporte_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."suporte_id_suporte_seq";
CREATE SEQUENCE "public"."suporte_id_suporte_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for contas
-- ----------------------------
DROP TABLE IF EXISTS "public"."contas";
CREATE TABLE "public"."contas" (
  "id" int8 NOT NULL DEFAULT nextval('contas_seq'::regclass),
  "login" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "senha" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "ip" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "mac" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "last_access" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "client_version" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "ban_expires" int4 NOT NULL DEFAULT 0,
  "userfilelist" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "launcher_key" int8 NOT NULL DEFAULT 0,
  "email" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "bans" int4 NOT NULL DEFAULT 0,
  "hwid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "last_port" int4 NOT NULL DEFAULT 0,
  "actived" bool NOT NULL DEFAULT true,
  "uniqueid" varchar(250) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of contas
-- ----------------------------
INSERT INTO "public"."contas" VALUES (21, 'luan4', 'luan4', '', '', '', '', 0, '', 0, 'marleneramosdonascimentotj@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (11, 'mclon785', 'mclon785', '', '', '', '', 0, '', 0, 'mclon.123456789@outlook.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (12, 'vinicius', 'peu9090dro', '', '', '', '', 0, '', 0, 'viniciusviana015@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (29, 'TokyoYT', '99547631a', '', '', '', '', 0, '', 0, 'joserubens330@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (23, 'jean', '88627828', '191.253.124.18', 'F0:4D:A2:E7:53:D9', '2018/03/19 | 01:32:21', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'jacintoleite@gmail.com', 0, '', 22791, 't', NULL);
INSERT INTO "public"."contas" VALUES (30, 'shino', 'shino2548', '', '', '', '', 0, '', 0, 'shino2548@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (43, 'mimimi', 'limaplo90', '', '', '', '', 0, '', 0, 'mehebe@uemail99.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (10, 'nick31072', 'pedroneto1', '', '', '', '', 0, '', 0, 'pedronetosilvap@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (36, 'zecalord1', 'hiago123', '', '', '', '', 0, '', 0, 'zecabeisso04@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (37, 'zecabeisso', '84363693', '179.177.213.210', '00:25:11:DF:65:4E', '2018/03/19 | 16:59:31', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'zecabeisso@pointblank', 0, '', 4205, 't', NULL);
INSERT INTO "public"."contas" VALUES (42, 'birutashow', 'joaoC123@,', '168.227.160.62', '1C:6F:65:7D:7D:83', '2018/03/19 | 20:34:22', '1.15.37.9', 0, '6ab9c698b0a3ba72abd975af2d02d78d', 0, 'juca321clayton@gmail.com', 0, '', 49288, 't', NULL);
INSERT INTO "public"."contas" VALUES (18, 'yaguin', 'gm01', '', '', '', '', 0, '', 0, 'keonyyago24@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (19, 'betinho12h', '!!@@988672', '', '', '', '', 0, '', 0, 'janioo_juniorr@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (20, 'crowley800', '12100986', '', '', '', '', 0, '', 0, 'nigemmaisnigem@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (38, 'tharicisio', 'mauricio', '', '', '', '', 0, '', 0, 'mcoral253@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (32, 'jackson00', 'bloco123', '', '', '', '', 0, '', 0, 'jacson_popo@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (22, 'Keni', '88454424g', '', '', '', '', 0, '', 0, 'kenizinhopro@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (14, 'r4sk', 'forever', '177.104.9.161', '00:1C:25:AD:D4:B6', '2018/03/20 | 15:32:02', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'caio.cub4@gmail.com', 0, '', 51176, 't', NULL);
INSERT INTO "public"."contas" VALUES (27, 'betinho12b', 'someday124', '186.212.119.160', '80:56:F2:CA:AA:DD', '2018/03/19 | 13:26:32', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'betinho12b@pointblank', 0, '', 49281, 't', NULL);
INSERT INTO "public"."contas" VALUES (28, 'testevideo', '123456', '187.0.185.223', 'C6:20:AA:BA:3E:E7', '2018/03/19 | 03:25:51', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'lucasgroidvideoteste@hotmail.com', 0, '', 10980, 't', NULL);
INSERT INTO "public"."contas" VALUES (41, 'zeusgvc', '82333071', '', '', '', '', 0, '', 0, 'zeuspb71@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (33, 'mailota', 'amanda', '168.227.160.62', '50:E5:49:F4:91:4E', '2018/03/19 | 13:59:23', '1.15.37.9', 0, '6ab9c698b0a3ba72abd975af2d02d78d', 0, 'ademilson_pl@hotmail.com', 0, '', 49206, 't', NULL);
INSERT INTO "public"."contas" VALUES (8, 'victoria', '123meu123', '191.240.172.193', 'F8:A9:63:61:21:7F', '2018/03/20 | 10:24:07', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'victoria@pointblank', 0, '', 57433, 't', NULL);
INSERT INTO "public"."contas" VALUES (45, 'teste01', 'teste01', '177.104.9.161', '00:1C:25:AD:D4:B6', '2018/03/20 | 00:04:10', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'oius1@outlook.com', 0, '', 50703, 't', NULL);
INSERT INTO "public"."contas" VALUES (39, 'jrll2030', '86734588jr', '186.212.119.160', 'E0:69:95:DF:C2:17', '2018/03/20 | 00:05:18', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'janio_junior2018@hotmail.com', 0, '', 58066, 't', NULL);
INSERT INTO "public"."contas" VALUES (49, 'zecalord', 'hiago123', '179.177.213.210', '00:25:11:DF:65:4E', '2018/03/20 | 15:16:11', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'zecalord@pointblank', 0, '', 1556, 't', NULL);
INSERT INTO "public"."contas" VALUES (50, 'iNetuh', 'arlindo123', '', '', '', '', 0, '', 0, 'netoplays1210@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (17, 'borges', 'eusou123', '201.76.5.132', 'C8:08:E9:5C:B3:65', '2018/03/22 | 10:08:40', '1.15.37.9', 1803202138, '6beabd5884c873162d4c704a9e52e99e', 0, 'mateusborges102015@gmail.com', 1, '', 9041, 'f', NULL);
INSERT INTO "public"."contas" VALUES (35, 'irineu', 'aclec00', '189.73.210.157', '00:AC:8D:4B:C5:0F', '2018/03/24 | 02:54:14', '1.15.37.9', 0, '6ab9c698b0a3ba72abd975af2d02d78d', 0, 'r.plmt2017@gmail.com', 0, '', 3290, 't', NULL);
INSERT INTO "public"."contas" VALUES (9, 'bytes', 'kaio156', '187.0.185.223', 'C6:20:AA:BA:3E:E7', '2018/03/24 | 00:49:57', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'bytes@pointblank', 0, '', 16067, 't', 'c1urZ704OsUDqhbmh/2RqsSVmoNoiHhpdRg6AgSLvH4=');
INSERT INTO "public"."contas" VALUES (48, 'PPLiWeep', 'D@vid12345', '201.7.40.20', '70:85:C2:27:A4:A3', '2018/03/23 | 01:35:15', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'david_musskopf@outlook.com', 0, '', 53782, 't', NULL);
INSERT INTO "public"."contas" VALUES (15, 'merdao1010', '88836744', '181.191.41.242', '00:FF:7C:71:86:45', '2018/03/21 | 17:16:20', '1.15.37.9', 0, 'd31208a66e8eab7d02b4cfd3622b0c51', 0, 'erickwenzel2018888@Outlook.com', 0, '', 27387, 't', NULL);
INSERT INTO "public"."contas" VALUES (44, 'japag2', '123456aq', '186.210.164.38', '00:FF:A0:21:D3:DD', '2018/03/24 | 02:15:55', '1.15.37.9', 0, '0b957f4daa2b17629d3d05019b4fa79a', 0, 'japagon009@gmail.com', 0, '', 64723, 't', NULL);
INSERT INTO "public"."contas" VALUES (34, 'amanda', 'amanda', '168.227.160.62', '6C:F0:49:F8:CE:22', '2018/03/23 | 19:08:35', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'ademilsonch8@gmail.com', 0, '', 51726, 't', NULL);
INSERT INTO "public"."contas" VALUES (26, 'ninho136', 'ninho123', '143.208.97.121', '1A:EE:65:0C:8F:BE', '2018/03/22 | 00:19:35', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'vigilato380@gmail.com', 0, '', 61172, 't', NULL);
INSERT INTO "public"."contas" VALUES (47, 'titto159', '30651130f', '177.21.17.22', '40:E2:30:BB:E4:17', '2018/03/22 | 03:12:09', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'tittolima71@gmail.com', 0, '', 27938, 't', NULL);
INSERT INTO "public"."contas" VALUES (25, 'smoll', '@@Gz@@', '177.37.90.140', '00:40:A7:22:6C:5D', '2018/03/22 | 03:02:16', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'gabrieltrucollo@gmail.com', 0, '', 53393, 't', NULL);
INSERT INTO "public"."contas" VALUES (40, 'japag3', '123456aq', '191.54.220.91', '00:FF:A0:21:D3:DD', '2018/03/19 | 19:59:47', '1.15.37.9', 1803202138, '0b957f4daa2b17629d3d05019b4fa79a', 0, 'japagon88@gmail.com', 0, '', 55671, 't', NULL);
INSERT INTO "public"."contas" VALUES (13, 'kaizincp', 'kaio156', '187.0.185.223', 'C6:20:AA:BA:3E:E7', '2018/03/23 | 19:31:11', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'kaizincp@gmail.com', 0, '', 2667, 't', NULL);
INSERT INTO "public"."contas" VALUES (16, 'luiz', 'aclec00', '189.73.210.157', '00:AC:8D:4B:C5:0F', '2018/03/24 | 03:44:29', '1.15.37.9', 0, '6ab9c698b0a3ba72abd975af2d02d78d', 0, 'janisvaldoramosluiz@gmail.co', 0, '', 3886, 't', 'qo+1VTllj5wmi/FE0N054wp3oltAXWlWB3hacCInX/0=');
INSERT INTO "public"."contas" VALUES (46, 'luciano', '27853584', '200.3.21.14', '00:AC:06:BC:4D:AA', '2018/03/22 | 18:15:31', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'luciano.fluminense@hotmail.com', 0, '', 2992, 't', NULL);
INSERT INTO "public"."contas" VALUES (51, 'dragonfly', 'maluco12', '', '', '', '', 0, '', 0, 'ghosteezyt@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (54, 'neco559', '159951r', '', '', '', '', 0, '', 0, 'salvator559@mail.ru', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (55, 'picachu', '96753600', '168.227.160.62', '50:E5:49:F4:91:4E', '2018/03/20 | 16:56:26', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'italoaugusto661@gmail.com', 0, '', 49663, 't', NULL);
INSERT INTO "public"."contas" VALUES (58, 'danizinha', 'brasil2012', '', '', '', '', 0, '', 0, 'danizinhasilva440@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (60, 'comta01', 'belama', '', '', '', '', 0, '', 0, 'guizhinhoted@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (61, 'zdevi', '84417964', '', '', '', '', 0, '', 0, 'devigames2014@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (62, 'mclon123', 'mclon123', '', '', '', '', 0, '', 0, 'mccaboco.07@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (59, 'TokyoYTT', '99547631', '177.1.110.189', 'EC:A8:6B:B7:B5:A6', '2018/03/20 | 20:19:30', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'joserubens320@gmail.com', 0, '', 62609, 't', NULL);
INSERT INTO "public"."contas" VALUES (64, 'sttxlenda', '24050606', '192.141.144.6', '80:EE:73:29:BA:2C', '2018/03/20 | 21:15:11', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'rdgglenda@gmail.com', 0, '', 52287, 't', NULL);
INSERT INTO "public"."contas" VALUES (65, 'ricmodin', 'biscoito2', '', '', '', '', 0, '', 0, 'ricardosantosTFM@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (31, 'betinho12l', '88672447Jr', '179.179.111.244', 'E0:69:95:DF:C2:17', '2018/03/24 | 02:34:36', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'janio_junior2016@hotmail.com', 0, '', 59966, 't', NULL);
INSERT INTO "public"."contas" VALUES (67, 'Alanzoca89', '890890890', '', '', '', '', 0, '', 0, 'augrelboy@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (68, 'micaio', 'caio1505', '', '', '', '', 0, '', 0, 'micaio_branco@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (69, 'erickwenzel', '88836744', '181.191.41.242', '00:FF:7C:71:86:45', '2018/03/24 | 02:12:13', '1.15.37.9', 0, 'd31208a66e8eab7d02b4cfd3622b0c51', 0, 'erickwenzel@pointblank', 0, '', 27357, 't', NULL);
INSERT INTO "public"."contas" VALUES (70, 'inativo', '123945678', '', '', '', '', 0, '', 0, 'inativo663@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (79, 'eulermata9', 'euler0147', '187.19.30.48', '74:27:EA:71:27:BC', '2018/03/22 | 03:05:48', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'eulercardoso212@gmail.com', 0, '', 57499, 't', NULL);
INSERT INTO "public"."contas" VALUES (82, 'minharola', 'gabriel14', '201.92.153.181', '6C:62:6D:F6:A9:7F', '2018/03/23 | 23:18:18', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'minharola@pointblank', 0, '', 51699, 't', NULL);
INSERT INTO "public"."contas" VALUES (72, 'Sheik', 'kaua123321', '', '', '', '', 0, '', 0, 'kauafranckk@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (76, 'eulermata1', 'euler0147', '187.19.30.48', '74:27:EA:71:27:BC', '2018/03/21 | 10:16:26', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'ehkfagfhjkjdd@gmail.com', 0, '', 52961, 't', NULL);
INSERT INTO "public"."contas" VALUES (80, 'LocaoEmbra', 'gabriel14', '', '', '', '', 0, '', 0, 'bateqbate@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (52, 'eulermata', 'euler0147', '187.19.30.48', '74:27:EA:71:27:BC', '2018/03/23 | 16:41:01', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'cardoso@gmail.com', 0, '', 49297, 't', NULL);
INSERT INTO "public"."contas" VALUES (71, 'Yuri', '91569214', '179.255.143.176', 'C8:9C:DC:C4:71:BC', '2018/03/23 | 10:17:28', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'fashik513@hotmail.com', 0, '', 49351, 't', NULL);
INSERT INTO "public"."contas" VALUES (57, 'myprozin', 'gas12345', '186.239.204.230', 'A4:1F:72:F5:65:B3', '2018/03/21 | 03:27:12', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'ddaldkasldaksdl@hotmail.com', 0, '', 2435, 't', NULL);
INSERT INTO "public"."contas" VALUES (77, 'srshadowbr', '58421836ga', '', '', '', '', 0, '', 0, 'ciclonegamer100@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (73, 'gollo', '123456', '190.38.0.82', '80:9B:20:C4:6E:28', '2018/03/21 | 04:47:04', '1.15.37.9', 0, 'd31208a66e8eab7d02b4cfd3622b0c51', 0, 'golloaraujo3@gmail.com', 0, '', 26231, 't', NULL);
INSERT INTO "public"."contas" VALUES (74, 'alexandre', 'alexandreh', '', '', '', '', 0, '', 0, 'alexandrehack063@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (83, 'jackson009', 'bloco123', '45.65.238.97', '00:FF:05:BF:A3:65', '2018/03/22 | 00:52:56', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'jackson009@pointblank', 0, '', 49505, 't', NULL);
INSERT INTO "public"."contas" VALUES (56, 'srlenda', 'zika102030', '177.189.80.167', '50:E5:49:F4:FB:57', '2018/03/24 | 01:58:30', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'serginho11977@hotmail.com', 0, '', 63155, 't', NULL);
INSERT INTO "public"."contas" VALUES (78, 'magnos77', 'euler0147', '187.19.30.48', '74:27:EA:71:27:BC', '2018/03/21 | 11:48:29', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'khfsdljdui@gmail.com', 0, '', 63345, 't', NULL);
INSERT INTO "public"."contas" VALUES (53, 'euler212', 'euler212', '187.19.30.48', '74:27:EA:71:27:BC', '2018/03/23 | 11:39:53', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'vintematar@gmail.com', 0, '', 49781, 't', NULL);
INSERT INTO "public"."contas" VALUES (81, 'Minharola', 'gabriel14', '', '', '', '', 0, '', 0, 'joaofree20152015@outlook.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (75, 'brian00', 'sano00', '187.19.30.48', '74:27:EA:71:27:BC', '2018/03/23 | 23:02:15', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'bfkhfjkbn@gmail.com', 0, '', 49716, 't', NULL);
INSERT INTO "public"."contas" VALUES (84, 'alexandreg', 'alexandrehack', '191.217.113.219', '80:EE:73:AE:7C:2D', '2018/03/22 | 04:06:10', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'alexandreg@pointblank', 0, '', 24397, 't', NULL);
INSERT INTO "public"."contas" VALUES (85, 'blackzinn', 'guisilva22', '', '', '', '', 0, '', 0, 'zazzguisilva@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (63, 'Malta', 'curitiba2', '177.40.112.220', '00:16:76:87:0F:E8', '2018/03/22 | 16:44:52', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'rafaelmaltacosta@hotmail.com', 0, '', 50006, 't', NULL);
INSERT INTO "public"."contas" VALUES (86, 'pgcrazy', '33433020', '', '', '', '', 0, '', 0, 'Pgcs00pg@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (89, 'manecoruja', 'Buceta@1', '', '', '', '', 0, '', 0, 'kennedhorla@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (91, 'alexaseca1', 'foda1123', '', '', '', '', 0, '', 0, 'alexandrev1223@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (90, 'teste2', '123456', '177.34.245.188', 'EC:A8:6B:79:35:C1', '2018/03/21 | 21:09:36', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'kennedhorla2@hotmail.com', 0, '', 51435, 't', NULL);
INSERT INTO "public"."contas" VALUES (88, 'jogolixo59', 'djonatan91', '191.240.218.23', '94:DE:80:F6:7D:2D', '2018/03/23 | 15:59:03', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'djonatan123444@gmail.com', 0, '', 15743, 't', NULL);
INSERT INTO "public"."contas" VALUES (93, 'ppkasdomal', 'caio1505', '', '', '', '', 0, '', 0, 'majorloko@outlook.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (92, 'alexapink', 'foda112', '177.143.201.148', '40:8D:5C:7B:5E:99', '2018/03/22 | 16:04:27', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'batalhagay@gmail.com', 0, '', 50899, 't', NULL);
INSERT INTO "public"."contas" VALUES (87, 'TokyoYT1', '99547631', '177.201.72.176', '00:FF:86:05:D6:BB', '2018/03/23 | 03:26:29', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'joserubens2022@gmail.com', 0, '', 53968, 't', NULL);
INSERT INTO "public"."contas" VALUES (94, 'maicon1311', '87252705mc', '', '', '', '', 0, '', 0, 'maiconandre2016@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (95, 'Paulo111', 'paulo5280', '', '', '', '', 0, '', 0, 'paulo.sts.123@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (97, 'binhostr', 'fabiostr12', '', '', '', '', 0, '', 0, 'fatcamisinha741@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (109, 'fuzileiro1', 'rexona5885', '191.187.228.29', 'FC:AA:14:F6:B6:50', '2018/03/23 | 15:31:33', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'gabrielpereiraitj@gamil.com', 0, '', 61968, 't', NULL);
INSERT INTO "public"."contas" VALUES (120, 'qualquer', 'qualquer', '189.50.144.244', '00:30:67:D1:86:D9', '2018/03/23 | 00:31:21', '1.15.37.9', 0, 'd31208a66e8eab7d02b4cfd3622b0c51', 0, 'qualquer@pointblank', 0, '', 55449, 't', NULL);
INSERT INTO "public"."contas" VALUES (123, 'Duufy01', 'm62u7562', '200.192.210.121', 'C8:9C:DC:C3:26:3D', '2018/03/23 | 01:19:52', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'Duufy01@pointblank', 0, '', 20997, 't', NULL);
INSERT INTO "public"."contas" VALUES (99, 'djonatan01', 'djonatan01', '191.240.218.23', '94:DE:80:F6:7D:2D', '2018/03/22 | 08:23:04', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'jogolixo59@gmail.com', 0, '', 15857, 't', NULL);
INSERT INTO "public"."contas" VALUES (111, 'igorheinz', 'igorheinz', '187.19.30.48', '74:27:EA:71:27:BC', '2018/03/22 | 17:54:20', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'agkjapkgg@gmail.com', 0, '', 49961, 't', NULL);
INSERT INTO "public"."contas" VALUES (112, 'lohanxdbr', 'George03', '', '', '', '', 0, '', 0, 'lohanheltonperez@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (100, 'gbr', 'gabriel123', '', '', '', '', 0, '', 0, 'rhzoliveira2@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (101, 'gmgameover', '23041997', '', '', '', '', 0, '', 0, 'danizinhagg@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (102, 'spilber123', 'spilber123', '', '', '', '', 0, '', 0, 'spilber345@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (103, 'fabiostr', 'binhostr12', '', '', '', '', 0, '', 0, 'binhomoreira741@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (98, 'elcan1220', '123789456', '158.181.40.236', '60:02:92:B3:C7:FB', '2018/03/22 | 15:55:08', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'elcan1341@mail.ru', 0, '', 8354, 't', NULL);
INSERT INTO "public"."contas" VALUES (105, 'djonatan02', 'djonatan01', '', '', '', '', 0, '', 0, 'jogolixo60@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (113, 'spet12', 'Matadores12', '181.66.41.220', '4C:CC:6A:60:D0:E6', '2018/03/22 | 18:56:55', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'spet12@pointblank', 0, '', 61369, 't', NULL);
INSERT INTO "public"."contas" VALUES (106, 'djonatan03', 'djonatan91', '191.240.218.23', '94:DE:80:F6:7D:2D', '2018/03/22 | 16:48:41', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'jogolixo30@gmail.com', 0, '', 14565, 't', NULL);
INSERT INTO "public"."contas" VALUES (104, 'Adryanno', '325669680', '201.20.99.220', '74:DE:2B:09:6A:00', '2018/03/22 | 16:49:49', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'adryanno050810@gmail.com', 0, '', 50244, 't', NULL);
INSERT INTO "public"."contas" VALUES (108, 'raul123', '8465123321', '', '', '', '', 0, '', 0, 'solanja55@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (114, 'Malta2018', 'curitiba2', '186.237.159.35', '00:16:76:87:0F:E8', '2018/03/23 | 15:56:44', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'Malta2018@pointblank', 0, '', 60668, 't', NULL);
INSERT INTO "public"."contas" VALUES (117, 'hosna123', 'hosana123', '', '', '', '', 0, '', 0, 'insanoplay024@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (124, 'manolo01', 'gatinho123', '', '', '', '', 0, '', 0, 'rafael_anjo159@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (115, 'errordev', '123456', '27.55.90.139', '60:45:CB:9E:3D:84', '2018/03/22 | 21:34:47', '1.15.37.9', 0, '0b957f4daa2b17629d3d05019b4fa79a', 0, 'udon_prd@hotmail.com', 0, '', 58924, 't', NULL);
INSERT INTO "public"."contas" VALUES (3, 'mateus', 'eusou123', '201.76.5.132', 'C8:08:E9:5C:B3:65', '2018/03/22 | 21:39:24', '1.15.37.9', 0, '6beabd5884c873162d4c704a9e52e99e', 0, 'eoqhenrqu@pointblank', 0, '', 14717, 't', '9UuX3DJK0bQed3yQFRf2BWtumGW7JRBCjYTmbZhuYfE=');
INSERT INTO "public"."contas" VALUES (116, 'vitoria1', 'pedroneto1', '187.19.184.2', 'B4:74:9F:84:13:1C', '2018/03/23 | 01:07:08', '1.15.37.9', 0, 'd31208a66e8eab7d02b4cfd3622b0c51', 0, 'vitoriapedro1@hotmail.com', 0, '', 13312, 't', NULL);
INSERT INTO "public"."contas" VALUES (121, 'igorheinzigorhei', 'igorheinz', '187.19.30.48', '74:27:EA:71:27:BC', '2018/03/23 | 00:37:01', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'igorheinzigorhei@pointblank', 0, '', 52382, 't', NULL);
INSERT INTO "public"."contas" VALUES (128, 'michelziim', 'samsung041', '201.69.48.148', 'D0:50:99:AE:EE:9F', '2018/03/23 | 02:59:15', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'micheldanrley1547@hotmail.com', 0, '', 54186, 't', NULL);
INSERT INTO "public"."contas" VALUES (119, 'hosana123', 'hosana123', '187.73.48.99', '00:1D:7D:FB:9C:75', '2018/03/23 | 22:36:22', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'hosana123@pointblank', 0, '', 50318, 't', NULL);
INSERT INTO "public"."contas" VALUES (122, 'mateusbp3', 'eusou123', '201.76.5.132', 'C8:08:E9:5C:B3:65', '2018/03/23 | 01:03:57', '1.15.37.9', 0, '6beabd5884c873162d4c704a9e52e99e', 0, 'mateusbp3@pointblank', 0, '', 23616, 't', NULL);
INSERT INTO "public"."contas" VALUES (118, 'duufy01', 'm62u7562', '200.192.210.121', 'C8:9C:DC:C3:26:3D', '2018/03/23 | 21:42:43', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'duufy01@pointblank', 0, '', 23177, 't', NULL);
INSERT INTO "public"."contas" VALUES (127, 'Comandante', 'daniel123', '', '', '', '', 0, '', 0, 'daniel_vl_123@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (96, 'slowbooc', '30651130f', '177.21.17.22', '40:E2:30:BB:E4:17', '2018/03/23 | 03:08:12', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'payday3030@gmail.com', 0, '', 27803, 't', NULL);
INSERT INTO "public"."contas" VALUES (110, 'infectgames', 'm62u7562', '200.192.211.190', 'E0:69:95:86:9F:37', '2018/03/24 | 00:55:00', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'infectgames@pointblank', 0, '', 49592, 't', NULL);
INSERT INTO "public"."contas" VALUES (125, 'rafaloko1', '123456', '', '', '', '', 0, '', 0, 'rafael_anjo156@hotmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (129, 'manolo1', 'gatinho123', '201.25.235.142', '00:FF:5F:E4:DB:A4', '2018/03/23 | 03:05:33', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'manolo1@pointblank', 0, '', 12230, 't', NULL);
INSERT INTO "public"."contas" VALUES (126, 'michelLuiz', 'samsung041', '179.228.10.137', 'D0:50:99:AE:EE:9F', '2018/03/24 | 02:50:27', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'michelluiz1233@hotmail.com', 0, '', 49966, 't', NULL);
INSERT INTO "public"."contas" VALUES (131, 'Kaduzinho', '3456789jua', '', '', '', '', 0, '', 0, 'juan01gameplays190@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (130, 'oex159', '30651130f', '177.21.17.22', '40:E2:30:BB:E4:17', '2018/03/24 | 02:07:26', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'tittos4lt@gmail.com', 0, '', 27845, 't', NULL);
INSERT INTO "public"."contas" VALUES (132, 'heberton', 'betinho', '', '', '', '', 0, '', 0, 'heberton02@outlook.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (133, 'paplemoe', 'paplemoe', '', '', '', '', 0, '', 0, 'paplemoe@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (134, 'carlos123', 'carlins123', '', '', '', '', 0, '', 0, 'carlos.juninhoremix@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (147, 'Ryan7Ghz', '241266ryan', '', '', '', '', 0, '', 0, 'RyanVaz2002@Gmail.Com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (154, 'andredety', '531wv7y9@', '', '', '', '', 0, '', 0, 'andrevieirart@outlook.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (146, 'matos', 'biel12', '138.99.93.107', '1C:39:47:58:4C:16', '2018/03/23 | 19:48:46', '1.15.37.9', 0, 'bff24571c8ef83d22b41503e3f20cc49', 0, 'gabrielmatosrc8@gmail.com', 0, '', 4142, 't', NULL);
INSERT INTO "public"."contas" VALUES (148, 'worknata', '@Guilherme', '179.96.189.12', '30:85:A9:35:2D:10', '2018/03/23 | 19:55:46', '1.15.37.9', 0, '0b957f4daa2b17629d3d05019b4fa79a', 0, 'magnatamarginawork@hotmail.com', 0, '', 55988, 't', NULL);
INSERT INTO "public"."contas" VALUES (142, 'ViniPDP', '34612021v', '187.95.40.19', '00:25:11:B4:15:D0', '2018/03/23 | 22:54:04', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'ViniPDP@pointblank', 0, '', 49422, 't', NULL);
INSERT INTO "public"."contas" VALUES (144, 'luan44', 'luan44', '186.225.240.238', '00:FF:AB:77:A3:9F', '2018/03/23 | 20:29:33', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'luanzinhoramostj@hotmail.com', 0, '', 33957, 't', NULL);
INSERT INTO "public"."contas" VALUES (136, 'ninho53', '86900532', '187.64.26.167', 'B4:74:9F:F3:82:48', '2018/03/23 | 15:14:41', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'luizvicente199710@gmail.com', 0, '', 51810, 't', NULL);
INSERT INTO "public"."contas" VALUES (137, 'jogolixo60', 'djonatan91', '191.240.218.23', '94:DE:80:F6:7D:2D', '2018/03/23 | 16:02:33', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'jogolixo40@gmail.com', 0, '', 16730, 't', NULL);
INSERT INTO "public"."contas" VALUES (24, 'keni', '88454424g', '191.0.90.39', '2A:1B:4C:3D:6E:5F', '2018/03/24 | 03:42:39', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'kenizinhopr2o@hotmail.com', 0, '', 18353, 't', NULL);
INSERT INTO "public"."contas" VALUES (158, 'matrix4', 'boobe55', '103.254.155.15', '00:00:00:00:00:00', '2018/03/24 | 00:29:03', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'ahmedmahmoudfarouk@outlook.com', 0, '', 51686, 't', NULL);
INSERT INTO "public"."contas" VALUES (160, 'patata01', 'ronicsa123', '', '', '', '', 0, '', 0, 'romminiquemancha01@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (139, 'Herlifer', '84496524', '', '', '', '', 0, '', 0, 'vanessabrunaamorim@Gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (140, 'herlifer', '84496524', '200.103.63.245', '1C:6F:65:F7:73:B2', '2018/03/23 | 16:39:14', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'herlifer@pointblank', 0, '', 49805, 't', NULL);
INSERT INTO "public"."contas" VALUES (152, 'zbiks', '88647290', '170.84.159.165', 'EC:A8:6B:B4:6C:E8', '2018/03/24 | 02:51:49', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'doritusantos@outlook.com', 0, '', 54605, 't', NULL);
INSERT INTO "public"."contas" VALUES (138, 'jefferson0', 'skirym2013', '189.4.74.163', '8C:89:A5:D7:75:64', '2018/03/23 | 21:54:35', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'jeffersonvieira1245@hotmail.com', 0, '', 27131, 't', NULL);
INSERT INTO "public"."contas" VALUES (156, 'fznnn', 'gabriel', '', '', '', '', 0, '', 0, 'ftxmtt@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (165, 'eduardop156', 'eduardol147', '189.10.117.108', '00:1D:72:BB:EF:4C', '2018/03/24 | 03:45:49', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'eduardop156@pointblank', 0, '', 50434, 't', NULL);
INSERT INTO "public"."contas" VALUES (162, 'GustavoDR', 'gustavo123', '', '', '', '', 0, '', 0, 'gustavo.mana.rosa@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (141, 'juniormito', '15271212j', '', '', '', '', 0, '', 0, 'marcioarferreira@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (143, 'Villen', '34612021', '187.95.40.19', '00:25:11:B4:15:D0', '2018/03/23 | 19:11:26', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'Villen@pointblank', 0, '', 55128, 't', NULL);
INSERT INTO "public"."contas" VALUES (145, 'pbking', '1234566', '', '', '', '', 0, '', 0, 'danielqs2020@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (149, 'lucas2018', '13091997', '200.192.210.121', 'C8:9C:DC:C3:26:3D', '2018/03/24 | 03:14:23', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'lucas2018@pointblank', 0, '', 50620, 't', NULL);
INSERT INTO "public"."contas" VALUES (159, 'Lucasxande', 'horda123', '186.208.251.186', '38:2C:4A:8C:77:4A', '2018/03/24 | 02:04:50', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'lucemon_nf@hotmail.com.br', 0, '', 55806, 't', NULL);
INSERT INTO "public"."contas" VALUES (150, 'ellenstomp', 'tyerxuxu', '', '', '', '', 0, '', 0, 'tyertailor@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (151, 'KallenGOD', 'poha1234', '', '', '', '', 0, '', 0, 'kallengod@disbox.net', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (155, 'maramali', 'hulkXXXXX5', '105.202.67.177', '00:00:00:00:00:00', '2018/03/24 | 00:04:01', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'flashmoon110@gmail.com', 0, '', 50960, 't', NULL);
INSERT INTO "public"."contas" VALUES (135, 'mansy29', 'boobe20199', '103.254.155.15', '00:00:00:00:00:00', '2018/03/24 | 00:38:46', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'maramtop29@gmail.com', 0, '', 51731, 't', NULL);
INSERT INTO "public"."contas" VALUES (163, 'lyedson', '88839721l', '', '', '', '', 0, '', 0, 'gcaveirinha@gmail.com', 0, '', 0, 't', NULL);
INSERT INTO "public"."contas" VALUES (157, 'maram29', 'boobe20199', '95.211.101.203', '00:00:00:00:00:00', '2018/03/24 | 00:10:04', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'ahmedsaw105@gmail.com', 0, '', 51170, 't', NULL);
INSERT INTO "public"."contas" VALUES (107, 'bkct', '147258369k', '186.208.251.186', '00:AC:07:2E:16:A5', '2018/03/24 | 02:36:23', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'igorlimanf@hotmail.com.br', 0, '', 56922, 't', NULL);
INSERT INTO "public"."contas" VALUES (153, 'kallengod', 'poha1234', '191.0.90.39', '98:83:89:73:51:1E', '2018/03/24 | 03:25:20', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'kallengod@pointblank', 0, '', 18101, 't', NULL);
INSERT INTO "public"."contas" VALUES (161, 'gustagomes', 'elisa010', '187.75.34.93', '00:FF:26:16:6C:28', '2018/03/24 | 02:15:32', '1.15.37.9', 0, '4b51c59b9da62c97307dbd2cbc7dd5f4', 0, 'Gusta__Gomes014@outlook.com', 0, '', 52115, 't', NULL);

-- ----------------------------
-- Table structure for cupom
-- ----------------------------
DROP TABLE IF EXISTS "public"."cupom";
CREATE TABLE "public"."cupom" (
  "id" int4,
  "codigo" varchar(255) COLLATE "pg_catalog"."default",
  "moeda" int4,
  "status" int2
)
;

-- ----------------------------
-- Records of cupom
-- ----------------------------
INSERT INTO "public"."cupom" VALUES (1, '0938813917497141', 10000, 1);
INSERT INTO "public"."cupom" VALUES (5, '5084231658875524', 70000, 1);
INSERT INTO "public"."cupom" VALUES (6, '745214963258703', 10000, 0);
INSERT INTO "public"."cupom" VALUES (8, '032447898774102', 10000, 0);
INSERT INTO "public"."cupom" VALUES (11, '032440275201102', 10000, 0);
INSERT INTO "public"."cupom" VALUES (13, '032447875207805', 10000, 0);
INSERT INTO "public"."cupom" VALUES (14, '102589875201102', 10000, 0);
INSERT INTO "public"."cupom" VALUES (15, '045447875201189', 10000, 1);
INSERT INTO "public"."cupom" VALUES (16, '045447875201189', 30000, 1);
INSERT INTO "public"."cupom" VALUES (2, '3045216589778452', 30000, 1);
INSERT INTO "public"."cupom" VALUES (3, '7532165478920132', 30000, 1);
INSERT INTO "public"."cupom" VALUES (4, '7815102084914520', 30000, 1);
INSERT INTO "public"."cupom" VALUES (18, '1548794350154973', 20000, 1);
INSERT INTO "public"."cupom" VALUES (19, '2146157917519718', 20000, 1);
INSERT INTO "public"."cupom" VALUES (20, '1101155797854275', 20000, 1);
INSERT INTO "public"."cupom" VALUES (12, '087847875201102', 10000, 1);
INSERT INTO "public"."cupom" VALUES (9, '098447898774107', 10000, 1);
INSERT INTO "public"."cupom" VALUES (10, '032447875201102', 10000, 1);
INSERT INTO "public"."cupom" VALUES (7, '032145698774102', 10000, 1);
INSERT INTO "public"."cupom" VALUES (17, '897447875201189', 10000, 1);
INSERT INTO "public"."cupom" VALUES (21, '5555544557975497', 80000, 1);
INSERT INTO "public"."cupom" VALUES (22, '8886897772456528', 10000, 1);

-- ----------------------------
-- Table structure for jogador
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador";
CREATE TABLE "public"."jogador" (
  "id" int8 NOT NULL,
  "nick" varchar(255) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "rank" int4 NOT NULL DEFAULT 0,
  "gold" int4 NOT NULL DEFAULT 80000,
  "cash" int4 NOT NULL DEFAULT 30000,
  "exp" int4 NOT NULL DEFAULT 0,
  "color" int4 NOT NULL DEFAULT 0,
  "clan_id" int4 NOT NULL DEFAULT 0,
  "brooch" int4 NOT NULL DEFAULT 0,
  "insignia" int4 NOT NULL DEFAULT 0,
  "medal" int4 NOT NULL DEFAULT 0,
  "blue_order" int4 NOT NULL DEFAULT 0,
  "mission1" int4 NOT NULL DEFAULT 1,
  "mission2" int4 NOT NULL DEFAULT 0,
  "mission3" int4 NOT NULL DEFAULT 0,
  "mission4" int4 NOT NULL DEFAULT 0,
  "tourney_level" int4 NOT NULL DEFAULT 0,
  "clan_date" int4 NOT NULL DEFAULT 0,
  "access_level" int4 NOT NULL DEFAULT 0,
  "role" int4 NOT NULL DEFAULT 0,
  "online" int4 NOT NULL DEFAULT 1,
  "last_up" int4 NOT NULL DEFAULT 1010000,
  "country" int4 DEFAULT 31,
  "clan_invited" int4 DEFAULT 0,
  "timegetcash" date
)
;

-- ----------------------------
-- Records of jogador
-- ----------------------------
INSERT INTO "public"."jogador" VALUES (39, 'NoraGayme', 0, 90000, 21929, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, '2018-03-23');
INSERT INTO "public"."jogador" VALUES (52, 'Euler', 3, 15070, 48, 9809, 0, 0, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803231750, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (69, 'XxTesTinxX', 7, 66708, 847, 50762, 0, 26, 0, 0, 0, 0, 1, 0, 0, 0, 0, 20180323, 0, 2, 0, 1803240123, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (90, 'Horla', 1, 30642, 72020, 3107, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803212142, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (35, 'Irineu', 53, 9914959, 99816262, 23044, 0, 23, 1192, 876, 597, 853, 1, 0, 0, 0, 0, 20180321, 3, 1, 0, 1010000, 31, 0, '2018-03-20');
INSERT INTO "public"."jogador" VALUES (57, 'zlNeo4K', 0, 110253, 620, 523, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (92, 'xPinkBlack', 1, 111739, 52599, 4431, 0, 22, 0, 0, 0, 0, 1, 0, 0, 0, 0, 20180321, 0, 3, 0, 1803220004, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (87, 'TokyoYTT', 2, 112860, 10482, 5080, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803230358, 31, 0, '2018-03-23');
INSERT INTO "public"."jogador" VALUES (71, 'YuriDs', 0, 30500, 27600, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (82, 'MatadoraaDeNub', 1, 43379, 9317, 4141, 0, 26, 1, 0, 0, 0, 1, 0, 0, 0, 0, 20180323, 0, 3, 0, 1803231306, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (76, 'OrochiMc', 1, 111319, 15723, 3491, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803211046, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (28, 'xPlayerZAP', 0, 90000, 1750, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, '2018-03-21');
INSERT INTO "public"."jogador" VALUES (83, 'SangueJovem', 0, 68337, 421, 1542, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, '2018-03-21');
INSERT INTO "public"."jogador" VALUES (78, 'BlackFoxy', 0, 70002, 57, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (16, 'Randall', 5, 64084, 358476, 21463, 0, 0, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 3, 0, 1, 1803240044, 31, 0, '2018-03-20');
INSERT INTO "public"."jogador" VALUES (25, 'SmoLL', 1, 31348, 912, 2872, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803220318, 31, 0, '2018-03-20');
INSERT INTO "public"."jogador" VALUES (79, 'TioNog', 1, 25287, 50444, 3491, 0, 0, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803211415, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (63, 'Its', 0, 3950, 57, 1717, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, '2018-03-22');
INSERT INTO "public"."jogador" VALUES (15, 'XxtestinxX', 5, 80886, 193, 28040, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1803192242, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (24, 'GM_Keni', 53, 999999999, 999960039, 80060, 0, 7, 1, 0, 0, 0, 1, 0, 0, 0, 0, 20180319, 2, 3, 0, 1010000, 31, 0, '2018-03-20');
INSERT INTO "public"."jogador" VALUES (34, '400Kg', 4, 26474, 32827, 16713, 0, 0, 1, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 1803231736, 31, 0, '2018-03-22');
INSERT INTO "public"."jogador" VALUES (27, 'Ordinaril', 0, 90000, 20850, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (47, '1bTsTitto75Hz', 0, 910, 511, 1380, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (13, 'Sheik', 53, 10010353, 99824071, 14022, 5, 0, 4, 0, 0, 0, 1, 0, 0, 0, 0, 0, 3, 0, 0, 1803231945, 31, 0, '2018-03-22');
INSERT INTO "public"."jogador" VALUES (53, 'KimarinhoTOP1', 0, 47564, 94, 154, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 7, NULL);
INSERT INTO "public"."jogador" VALUES (48, 'Youtuber_iWeep', 53, 47549, 160842, 101716, 0, 27, 991, 878, 596, 852, 1, 6, 0, 0, 0, 20180323, 0, 1, 0, 1803201301, 31, 0, '2018-03-23');
INSERT INTO "public"."jogador" VALUES (9, 'GM_Sheik', 53, 999945501, 999743333, 10050580, 0, 7, 999, 875, 596, 852, 0, 0, 0, 0, 0, 20180320, 3, 1, 0, 1803181917, 31, 0, '2018-03-24');
INSERT INTO "public"."jogador" VALUES (44, 'paodequeijo', 53, 1044706, 701688, 91690, 0, 0, 998, 876, 597, 853, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (31, 'HeroBryne', 19, 221716, 62072, 437876, 0, 22, 0, 25, 11, 0, 11, 5, 7, 0, 0, 20180320, 0, 1, 0, 1803240116, 31, 0, '2018-03-24');
INSERT INTO "public"."jogador" VALUES (26, 'G4wSJunior', 1, 52625, 6910, 3850, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803200051, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (4, 'RandonPlays', 0, 500000, 500000, 0, 0, 0, 1000, 1000, 1000, 1000, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (5, 'PombodaVela', 0, 490223, 227009, 0, 0, 0, 990, 953, 987, 986, 1, 7, 7, 0, 0, 0, 1, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (7, 'tomate', 0, 491155, 404331, 0, 0, 0, 991, 876, 597, 853, 1, 0, 0, 0, 0, 20180317, 1, 1, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (6, 'VaraDoce', 0, 500540, 329315, 0, 0, 0, 990, 917, 918, 959, 1, 0, 0, 0, 0, 20180304, 1, 1, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (2, 'Mapa', 0, 411299, 335420, 0, 0, 0, 1003, 1000, 1000, 1000, 1, 0, 0, 0, 0, 20180214, 1, 1, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (64, 'sttxMELHORQVC', 0, 70525, 43412, 519, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (8, 'Ursinha', 2, 999920448, 99601192, 8389, 0, 7, 992, 876, 597, 853, 1, 0, 0, 0, 0, 20180318, 3, 2, 0, 1803192245, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (55, 'picachu1313', 0, 110001, 37801, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (45, 'Tutorial', 0, 80000, 15680, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (23, 'SM0LK1NG', 0, 90986, 3397, 1567, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, '2018-03-23');
INSERT INTO "public"."jogador" VALUES (3, 'GM_China', 53, 9948932, 9815140, 94543, 0, 7, 3000, 1005, 1000, 1000, 1, 3, 5, 0, 0, 20180321, 3, 3, 0, 1803181917, 31, 0, '2018-03-22');
INSERT INTO "public"."jogador" VALUES (49, 'Baruca', 0, 70080, 230, 180, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (33, 'AmandaTOP1', 0, 80558, 30513, 1216, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (37, 'zFeeelBackRS', 2, 82211, 1296, 5171, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803191756, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (42, 'BlankUchiha', 0, 1992, 91, 288, 0, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (59, 'TokyoYT', 0, 98054, 8653, 1054, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (40, 'JphP1gueludo', 2, 100000, 100000, 4654, 0, 0, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803192050, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (14, 'r4sK', 2, 50680, 23057, 7413, 0, 0, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803201559, 31, 0, '2018-03-20');
INSERT INTO "public"."jogador" VALUES (73, 'Gollo', 0, 97000, 10980, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (17, 'zMaxiMos', 4, 28990, 995805, 15799, 0, 22, 9991, 9875, 9596, 9852, 1, 0, 0, 0, 0, 20180321, 3, 3, 0, 1803220004, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (84, 'Battata', 2, 30334, 1043, 5761, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803220422, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (75, 'BrianLorute', 2, 66339, 1216, 8362, 0, 26, 1, 0, 0, 0, 1, 0, 0, 0, 0, 20180322, 0, 3, 0, 1803221649, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (115, 'ErrorDev', 0, 99900, 100059999, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (109, 'FuzileiroNaval', 4, 80083, 1733, 18951, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803230511, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (128, 'MichelZiim', 0, 45000, 950, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (46, 'luciano', 0, 110000, 60000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (138, 'NicProKiller', 2, 74006, 40019, 8293, 0, 26, 3, 0, 0, 0, 1, 0, 0, 0, 0, 20180323, 0, 3, 0, 1803231813, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (106, 'KiFlex', 2, 112847, 2931, 6809, 0, 26, 1, 0, 0, 0, 1, 0, 0, 0, 0, 20180322, 0, 3, 0, 1803221721, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (165, 'EduardoDznn7', 0, 60000, 20000, 0, 0, 0, 30, 30, 30, 30, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (99, 'ZPetto', 0, 41002, 1712, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (120, '4KGznnn', 0, 110000, 2100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (104, 'OneShot', 0, 89500, 57940, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (107, 'FlooooowsYKZ', 11, 200951, 62497, 113224, 0, 26, 3, 0, 0, 0, 1, 0, 0, 0, 0, 20180323, 0, 3, 0, 1803240227, 31, 0, '2018-03-24');
INSERT INTO "public"."jogador" VALUES (121, 'ogor', 0, 100157, 54407, 628, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (136, 'ninho53', 0, 70000, 29100, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (88, 'zProZ', 6, 3080, 752, 33801, 0, 7, 5, 0, 0, 0, 1, 5, 0, 0, 0, 20180321, 0, 3, 0, 1803221939, 31, 0, '2018-03-22');
INSERT INTO "public"."jogador" VALUES (98, 'SultanCenderme', 0, 58242, 1822, 1062, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (118, 'Duufy', 4, 67949, 3440, 16285, 0, 0, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803232012, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (159, 'Lucemon', 4, 64627, 15019, 15372, 0, 26, 31, 30, 30, 30, 1, 0, 0, 0, 0, 20180324, 0, 3, 0, 1803240136, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (148, 'WorkNaT4', 0, 100271, 13001, 1430, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (111, 'Igor', 0, 38363, 43407, 856, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (129, '2KiLL', 0, 100000, 35300, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (113, 'Speet', 0, 100000, 60000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (153, 'kabrittow', 0, 90095, 18765, 1605, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (126, 'MichelZim', 1, 26022, 4563, 4756, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803240123, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (116, 'thiago', 0, 100000, 60000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (140, 'Ornot', 2, 75120, 6975, 8540, 0, 22, 3, 0, 0, 0, 1, 0, 0, 0, 0, 20180323, 0, 3, 0, 1803231736, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (158, 'JOKER', 0, 60000, 8125, 0, 0, 0, 30, 30, 30, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (122, 'Bolado', 0, 100000, 60000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (123, 'duufy', 1, 60965, 42686, 3932, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803230213, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (149, 'zHiROSHE', 7, 142684, 38126, 44943, 0, 0, 0, 3, 0, 0, 1, 5, 0, 0, 0, 0, 0, 0, 1, 1803240322, 31, 0, '2018-03-24');
INSERT INTO "public"."jogador" VALUES (146, 'Matos', 0, 74365, 503, 583, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, '2018-03-24');
INSERT INTO "public"."jogador" VALUES (137, 'BigSmoke', 2, 115237, 25701, 8970, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803231646, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (96, 'fooxMVP', 4, 32207, 1288, 14276, 0, 27, 0, 0, 0, 0, 1, 0, 0, 0, 0, 20180323, 0, 2, 0, 1803230326, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (114, 'Not', 0, 90199, 39451, 409, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (161, 'Maximous04', 1, 18355, 1613, 2286, 0, 0, 32, 30, 30, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803240255, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (143, 'VinniTAN', 3, 75969, 8548, 13859, 0, 26, 1, 0, 0, 0, 1, 0, 0, 0, 0, 20180323, 0, 3, 0, 1803232027, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (142, 'VinniFOX', 0, 69900, 26970, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (157, 'CR7', 0, 100000, 20000, 0, 0, 0, 30, 30, 30, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (119, 'CueioTheLasTreva', 2, 16491, 360, 8515, 0, 26, 2, 0, 0, 0, 1, 0, 0, 0, 0, 20180323, 0, 3, 0, 1803232152, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (110, 'MEDO', 8, 122809, 8546, 55281, 0, 0, 1, 8, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1803240116, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (135, 'joker', 0, 110348, 3654, 870, 0, 26, 0, 0, 0, 0, 1, 0, 0, 0, 0, 20180323, 0, 3, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (155, 'Cindrella', 0, 100000, 20000, 0, 0, 0, 30, 30, 30, 30, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (144, 'openBeta', 0, 70490, 713, 1545, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1010000, 31, 0, NULL);
INSERT INTO "public"."jogador" VALUES (152, 'yAlone', 4, 97577, 2293, 15090, 0, 26, 1, 0, 0, 0, 1, 0, 0, 0, 0, 20180324, 0, 3, 0, 1803240304, 31, 0, '2018-03-24');
INSERT INTO "public"."jogador" VALUES (56, 'Eros', 14, 240336, 25820, 199654, 0, 26, 0, 21, 4, 0, 5, 7, 0, 0, 0, 20180322, 0, 1, 0, 1803240211, 31, 0, '2018-03-24');

-- ----------------------------
-- Table structure for jogador_amigo
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_amigo";
CREATE TABLE "public"."jogador_amigo" (
  "player_id" int8 NOT NULL,
  "friend_id" int8,
  "status" int4
)
;

-- ----------------------------
-- Records of jogador_amigo
-- ----------------------------
INSERT INTO "public"."jogador_amigo" VALUES (2, 3, 48);
INSERT INTO "public"."jogador_amigo" VALUES (3, 5, 18);
INSERT INTO "public"."jogador_amigo" VALUES (3, 6, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 7, 0);
INSERT INTO "public"."jogador_amigo" VALUES (5, 3, 32);
INSERT INTO "public"."jogador_amigo" VALUES (6, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (7, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (8, 9, 0);
INSERT INTO "public"."jogador_amigo" VALUES (9, 8, 0);
INSERT INTO "public"."jogador_amigo" VALUES (8, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 8, 0);
INSERT INTO "public"."jogador_amigo" VALUES (9, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 9, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 15, 0);
INSERT INTO "public"."jogador_amigo" VALUES (15, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (17, 9, 0);
INSERT INTO "public"."jogador_amigo" VALUES (9, 17, 0);
INSERT INTO "public"."jogador_amigo" VALUES (17, 15, 0);
INSERT INTO "public"."jogador_amigo" VALUES (15, 17, 0);
INSERT INTO "public"."jogador_amigo" VALUES (14, 9, 0);
INSERT INTO "public"."jogador_amigo" VALUES (9, 14, 0);
INSERT INTO "public"."jogador_amigo" VALUES (14, 16, 0);
INSERT INTO "public"."jogador_amigo" VALUES (16, 14, 0);
INSERT INTO "public"."jogador_amigo" VALUES (16, 9, 0);
INSERT INTO "public"."jogador_amigo" VALUES (9, 16, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 16, 0);
INSERT INTO "public"."jogador_amigo" VALUES (16, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (17, 16, 0);
INSERT INTO "public"."jogador_amigo" VALUES (16, 17, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 24, 0);
INSERT INTO "public"."jogador_amigo" VALUES (24, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (26, 27, 32);
INSERT INTO "public"."jogador_amigo" VALUES (27, 26, 18);
INSERT INTO "public"."jogador_amigo" VALUES (34, 9, 0);
INSERT INTO "public"."jogador_amigo" VALUES (9, 34, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 31, 0);
INSERT INTO "public"."jogador_amigo" VALUES (31, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (42, 34, 18);
INSERT INTO "public"."jogador_amigo" VALUES (42, 9, 0);
INSERT INTO "public"."jogador_amigo" VALUES (9, 42, 0);
INSERT INTO "public"."jogador_amigo" VALUES (17, 8, 0);
INSERT INTO "public"."jogador_amigo" VALUES (8, 17, 0);
INSERT INTO "public"."jogador_amigo" VALUES (48, 31, 0);
INSERT INTO "public"."jogador_amigo" VALUES (31, 48, 0);
INSERT INTO "public"."jogador_amigo" VALUES (9, 31, 0);
INSERT INTO "public"."jogador_amigo" VALUES (31, 9, 0);
INSERT INTO "public"."jogador_amigo" VALUES (14, 31, 0);
INSERT INTO "public"."jogador_amigo" VALUES (31, 14, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 14, 0);
INSERT INTO "public"."jogador_amigo" VALUES (14, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (59, 9, 0);
INSERT INTO "public"."jogador_amigo" VALUES (9, 59, 0);
INSERT INTO "public"."jogador_amigo" VALUES (35, 31, 0);
INSERT INTO "public"."jogador_amigo" VALUES (31, 35, 0);
INSERT INTO "public"."jogador_amigo" VALUES (55, 31, 0);
INSERT INTO "public"."jogador_amigo" VALUES (31, 55, 0);
INSERT INTO "public"."jogador_amigo" VALUES (59, 31, 0);
INSERT INTO "public"."jogador_amigo" VALUES (31, 59, 0);
INSERT INTO "public"."jogador_amigo" VALUES (59, 56, 0);
INSERT INTO "public"."jogador_amigo" VALUES (56, 59, 0);
INSERT INTO "public"."jogador_amigo" VALUES (59, 48, 0);
INSERT INTO "public"."jogador_amigo" VALUES (48, 59, 0);
INSERT INTO "public"."jogador_amigo" VALUES (56, 48, 0);
INSERT INTO "public"."jogador_amigo" VALUES (48, 56, 0);
INSERT INTO "public"."jogador_amigo" VALUES (35, 17, 32);
INSERT INTO "public"."jogador_amigo" VALUES (17, 35, 18);
INSERT INTO "public"."jogador_amigo" VALUES (9, 48, 0);
INSERT INTO "public"."jogador_amigo" VALUES (48, 9, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 76, 0);
INSERT INTO "public"."jogador_amigo" VALUES (76, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 71, 0);
INSERT INTO "public"."jogador_amigo" VALUES (71, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (76, 71, 0);
INSERT INTO "public"."jogador_amigo" VALUES (71, 76, 0);
INSERT INTO "public"."jogador_amigo" VALUES (87, 83, 0);
INSERT INTO "public"."jogador_amigo" VALUES (83, 87, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 90, 0);
INSERT INTO "public"."jogador_amigo" VALUES (90, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 44, 0);
INSERT INTO "public"."jogador_amigo" VALUES (44, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 48, 0);
INSERT INTO "public"."jogador_amigo" VALUES (48, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (88, 31, 0);
INSERT INTO "public"."jogador_amigo" VALUES (31, 88, 0);
INSERT INTO "public"."jogador_amigo" VALUES (17, 31, 0);
INSERT INTO "public"."jogador_amigo" VALUES (31, 17, 0);
INSERT INTO "public"."jogador_amigo" VALUES (92, 17, 0);
INSERT INTO "public"."jogador_amigo" VALUES (17, 92, 0);
INSERT INTO "public"."jogador_amigo" VALUES (84, 79, 0);
INSERT INTO "public"."jogador_amigo" VALUES (79, 84, 0);
INSERT INTO "public"."jogador_amigo" VALUES (96, 84, 0);
INSERT INTO "public"."jogador_amigo" VALUES (84, 96, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 75, 0);
INSERT INTO "public"."jogador_amigo" VALUES (75, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (110, 31, 0);
INSERT INTO "public"."jogador_amigo" VALUES (31, 110, 0);
INSERT INTO "public"."jogador_amigo" VALUES (3, 115, 0);
INSERT INTO "public"."jogador_amigo" VALUES (115, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (121, 120, 32);
INSERT INTO "public"."jogador_amigo" VALUES (120, 121, 18);
INSERT INTO "public"."jogador_amigo" VALUES (96, 123, 0);
INSERT INTO "public"."jogador_amigo" VALUES (123, 96, 0);
INSERT INTO "public"."jogador_amigo" VALUES (118, 48, 0);
INSERT INTO "public"."jogador_amigo" VALUES (48, 118, 0);
INSERT INTO "public"."jogador_amigo" VALUES (48, 87, 32);
INSERT INTO "public"."jogador_amigo" VALUES (87, 48, 18);
INSERT INTO "public"."jogador_amigo" VALUES (118, 130, 0);
INSERT INTO "public"."jogador_amigo" VALUES (130, 118, 0);
INSERT INTO "public"."jogador_amigo" VALUES (118, 109, 0);
INSERT INTO "public"."jogador_amigo" VALUES (109, 118, 0);
INSERT INTO "public"."jogador_amigo" VALUES (109, 110, 32);
INSERT INTO "public"."jogador_amigo" VALUES (110, 109, 18);
INSERT INTO "public"."jogador_amigo" VALUES (82, 107, 32);
INSERT INTO "public"."jogador_amigo" VALUES (107, 82, 18);
INSERT INTO "public"."jogador_amigo" VALUES (126, 44, 0);
INSERT INTO "public"."jogador_amigo" VALUES (44, 126, 0);
INSERT INTO "public"."jogador_amigo" VALUES (137, 44, 0);
INSERT INTO "public"."jogador_amigo" VALUES (44, 137, 0);
INSERT INTO "public"."jogador_amigo" VALUES (123, 110, 48);
INSERT INTO "public"."jogador_amigo" VALUES (110, 118, 0);
INSERT INTO "public"."jogador_amigo" VALUES (118, 110, 0);
INSERT INTO "public"."jogador_amigo" VALUES (140, 34, 0);
INSERT INTO "public"."jogador_amigo" VALUES (34, 140, 0);
INSERT INTO "public"."jogador_amigo" VALUES (107, 110, 0);
INSERT INTO "public"."jogador_amigo" VALUES (110, 107, 0);
INSERT INTO "public"."jogador_amigo" VALUES (107, 34, 0);
INSERT INTO "public"."jogador_amigo" VALUES (34, 107, 0);
INSERT INTO "public"."jogador_amigo" VALUES (107, 140, 0);
INSERT INTO "public"."jogador_amigo" VALUES (140, 107, 0);
INSERT INTO "public"."jogador_amigo" VALUES (107, 118, 0);
INSERT INTO "public"."jogador_amigo" VALUES (118, 107, 0);
INSERT INTO "public"."jogador_amigo" VALUES (13, 143, 0);
INSERT INTO "public"."jogador_amigo" VALUES (143, 13, 0);
INSERT INTO "public"."jogador_amigo" VALUES (118, 143, 32);
INSERT INTO "public"."jogador_amigo" VALUES (143, 118, 18);
INSERT INTO "public"."jogador_amigo" VALUES (143, 148, 0);
INSERT INTO "public"."jogador_amigo" VALUES (148, 143, 0);
INSERT INTO "public"."jogador_amigo" VALUES (82, 31, 0);
INSERT INTO "public"."jogador_amigo" VALUES (31, 82, 0);
INSERT INTO "public"."jogador_amigo" VALUES (143, 31, 0);
INSERT INTO "public"."jogador_amigo" VALUES (31, 143, 0);
INSERT INTO "public"."jogador_amigo" VALUES (149, 31, 0);
INSERT INTO "public"."jogador_amigo" VALUES (31, 149, 0);
INSERT INTO "public"."jogador_amigo" VALUES (149, 56, 0);
INSERT INTO "public"."jogador_amigo" VALUES (56, 149, 0);
INSERT INTO "public"."jogador_amigo" VALUES (9, 149, 32);
INSERT INTO "public"."jogador_amigo" VALUES (149, 9, 18);
INSERT INTO "public"."jogador_amigo" VALUES (3, 35, 0);
INSERT INTO "public"."jogador_amigo" VALUES (35, 3, 0);
INSERT INTO "public"."jogador_amigo" VALUES (35, 48, 0);
INSERT INTO "public"."jogador_amigo" VALUES (107, 149, 0);
INSERT INTO "public"."jogador_amigo" VALUES (149, 107, 0);
INSERT INTO "public"."jogador_amigo" VALUES (35, 149, 32);
INSERT INTO "public"."jogador_amigo" VALUES (149, 35, 18);
INSERT INTO "public"."jogador_amigo" VALUES (149, 44, 0);
INSERT INTO "public"."jogador_amigo" VALUES (44, 149, 0);
INSERT INTO "public"."jogador_amigo" VALUES (159, 107, 0);
INSERT INTO "public"."jogador_amigo" VALUES (107, 159, 0);
INSERT INTO "public"."jogador_amigo" VALUES (110, 126, 32);
INSERT INTO "public"."jogador_amigo" VALUES (126, 110, 18);

-- ----------------------------
-- Table structure for jogador_bonus
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_bonus";
CREATE TABLE "public"."jogador_bonus" (
  "player_id" int8 NOT NULL,
  "event_id" int4 NOT NULL DEFAULT 0,
  "gift" int4 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Table structure for jogador_clan
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_clan";
CREATE TABLE "public"."jogador_clan" (
  "id" int4 NOT NULL DEFAULT nextval('clans_id_seq'::regclass),
  "owner" int8 NOT NULL,
  "name" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "notice" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "info" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "rank" int4 DEFAULT 0,
  "logo" int4 DEFAULT 0,
  "color" int4 DEFAULT 0,
  "partidas" int4 DEFAULT 0,
  "vitorias" int4 DEFAULT 0,
  "derrotas" int4 DEFAULT 0,
  "autoridade" int4 DEFAULT 0,
  "limite_rank" int4 DEFAULT 0,
  "limite_idade" int4 DEFAULT 0,
  "limite_idade2" int4 DEFAULT 0,
  "pontos" int4 DEFAULT 1000,
  "vagas" int4 DEFAULT 50,
  "exp" int4 DEFAULT 0,
  "data" int4 DEFAULT 0,
  "player_vitorias" int8 DEFAULT 0,
  "player_matou" int8 DEFAULT 0,
  "player_headshots" int8 DEFAULT 0,
  "player_exp" int8 DEFAULT 0,
  "player_participacao" int8 DEFAULT 0,
  "url" varchar COLLATE "pg_catalog"."default" DEFAULT ''::character varying
)
;

-- ----------------------------
-- Records of jogador_clan
-- ----------------------------
INSERT INTO "public"."jogador_clan" VALUES (23, 35, 'Irineu', 'Regras;
Não desrespeitar nenhum menbro do clã.
Não usar macro/hacker.
CF apenas com acompanhamento de um Auxiliar.
Ts: ts3.troiagamez.tk:9988
Se vacilar vai rodar!', 'Clã do GM_Irineu.
Recrutamento: ON', 0, 340067845, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 50, 0, 20180321, 0, 0, 0, 0, 0, '');
INSERT INTO "public"."jogador_clan" VALUES (27, 48, 'BlackDragons', '', 'BEM VINDOS', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 50, 0, 20180323, 0, 0, 0, 0, 0, '');
INSERT INTO "public"."jogador_clan" VALUES (7, 9, 'TroiaGamez', '', 'akjdkajda', 0, 255723017, 0, 0, 0, 0, 4, 0, 0, 0, 1000, 150, 0, 20180318, 0, 0, 0, 0, 0, '');
INSERT INTO "public"."jogador_clan" VALUES (26, 56, 'AnonymouS', 'SEJA BEM VINDO', 'Seja Bem vindo', 0, 269615367, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 100, 0, 20180322, 0, 0, 0, 0, 0, '');
INSERT INTO "public"."jogador_clan" VALUES (22, 31, 'ArmaGedom', 'Bem Vindo 

Nosso ts Ninj4.skillhost.net

vamos ser um clan top 1 

e ser top no point blank troia', 'bem vindo', 0, 38275331, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 150, 0, 20180320, 0, 0, 0, 0, 0, '');

-- ----------------------------
-- Table structure for jogador_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_config";
CREATE TABLE "public"."jogador_config" (
  "player_id" int8 NOT NULL,
  "config" int4 NOT NULL,
  "sangue" int4 NOT NULL,
  "mira" int4 NOT NULL,
  "mao" int4 NOT NULL,
  "audio1" int4 NOT NULL,
  "audio2" int4 NOT NULL,
  "audio_enable" int4 NOT NULL,
  "sensibilidade" int4 NOT NULL,
  "visao" int4 NOT NULL,
  "mouse_invertido" int4 NOT NULL,
  "msgconvite" int4 NOT NULL,
  "chatsusurro" int4 NOT NULL,
  "macro" int4 NOT NULL,
  "unk1" int4 NOT NULL DEFAULT 0,
  "unk2" int4 NOT NULL DEFAULT 0,
  "unk3" int4 NOT NULL DEFAULT 0,
  "unk4" int4 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Records of jogador_config
-- ----------------------------
INSERT INTO "public"."jogador_config" VALUES (23, 55, 1, 0, 0, 8, 60, 6, 50, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (26, 55, 1, 2, 0, 100, 60, 6, 10, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (39, 55, 1, 0, 0, 55, 60, 6, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (45, 55, 1, 0, 0, 10, 60, 6, 12, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (8, 55, 1, 2, 0, 100, 60, 6, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (28, 55, 1, 2, 0, 100, 60, 4, 50, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (27, 55, 1, 0, 0, 100, 60, 4, 61, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (33, 55, 1, 1, 0, 100, 60, 7, 50, 70, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (34, 55, 1, 2, 0, 100, 0, 7, 38, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (15, 55, 1, 2, 0, 39, 60, 6, 49, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (49, 55, 1, 0, 0, 100, 60, 7, 50, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (37, 55, 1, 2, 0, 100, 60, 7, 50, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (14, 55, 1, 2, 0, 13, 60, 6, 10, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (55, 55, 1, 0, 0, 100, 60, 7, 20, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (59, 55, 1, 2, 0, 100, 60, 6, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (40, 55, 1, 1, 0, 37, 60, 6, 27, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (42, 55, 1, 2, 1, 100, 60, 7, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (64, 55, 0, 0, 0, 100, 60, 6, 10, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (35, 55, 1, 2, 0, 25, 60, 6, 63, 70, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (56, 55, 1, 2, 0, 100, 60, 6, 50, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (84, 55, 1, 2, 0, 71, 60, 6, 64, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (126, 55, 3, 2, 0, 100, 59, 6, 36, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (24, 55, 1, 2, 0, 60, 60, 6, 31, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (69, 55, 1, 2, 0, 15, 60, 6, 50, 70, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (53, 55, 1, 2, 0, 100, 60, 7, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (106, 55, 1, 2, 0, 100, 0, 7, 28, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (57, 55, 3, 2, 0, 60, 60, 6, 30, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (73, 55, 1, 1, 0, 100, 60, 7, 50, 70, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (3, 55, 3, 2, 0, 26, 5, 6, 26, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (76, 55, 1, 2, 0, 100, 60, 7, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (71, 55, 1, 0, 0, 100, 60, 7, 10, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (78, 55, 1, 2, 0, 100, 60, 6, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (79, 55, 1, 2, 0, 100, 60, 7, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (92, 55, 3, 2, 0, 100, 60, 6, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (17, 55, 1, 2, 0, 100, 60, 6, 50, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (75, 55, 1, 2, 0, 100, 60, 7, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (83, 55, 1, 1, 1, 100, 60, 7, 19, 76, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (104, 55, 1, 1, 0, 100, 60, 7, 50, 70, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (87, 55, 1, 2, 0, 100, 60, 6, 50, 70, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (113, 55, 1, 1, 0, 100, 60, 7, 50, 70, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (90, 55, 0, 2, 0, 100, 60, 6, 59, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (123, 55, 1, 0, 0, 100, 60, 6, 69, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (25, 55, 1, 0, 0, 20, 60, 6, 53, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (47, 55, 0, 2, 0, 30, 60, 6, 64, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (9, 55, 1, 2, 0, 10, 60, 6, 50, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (98, 55, 3, 2, 0, 100, 60, 6, 47, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (122, 55, 1, 1, 0, 100, 60, 7, 50, 70, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (99, 55, 1, 2, 0, 100, 0, 7, 31, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (114, 0, 0, 2, 0, 100, 60, 6, 50, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (13, 55, 1, 2, 0, 100, 60, 4, 50, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (52, 55, 1, 2, 0, 100, 60, 6, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (48, 55, 1, 2, 0, 51, 60, 6, 31, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (16, 55, 1, 2, 0, 21, 60, 6, 68, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (111, 55, 1, 2, 0, 100, 60, 7, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (63, 0, 0, 2, 0, 100, 60, 6, 50, 80, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (46, 55, 1, 1, 0, 100, 60, 7, 50, 70, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (115, 55, 1, 0, 0, 34, 60, 6, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (88, 55, 1, 2, 0, 100, 0, 7, 27, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (120, 55, 1, 2, 0, 100, 60, 7, 49, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (44, 55, 1, 1, 0, 10, 60, 6, 28, 80, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (119, 55, 1, 2, 0, 21, 60, 6, 19, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (121, 55, 1, 1, 0, 100, 60, 7, 50, 70, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (116, 55, 1, 0, 0, 100, 60, 4, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (110, 55, 3, 2, 0, 100, 60, 6, 118, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (128, 55, 1, 1, 0, 100, 0, 7, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (129, 55, 1, 2, 0, 100, 60, 6, 16, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (96, 55, 3, 2, 0, 25, 60, 6, 64, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (109, 55, 1, 2, 0, 100, 60, 7, 50, 70, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (82, 55, 1, 2, 0, 100, 60, 6, 50, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (118, 55, 1, 2, 0, 100, 60, 6, 87, 80, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (107, 55, 1, 2, 0, 20, 60, 6, 33, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (31, 55, 1, 2, 0, 100, 60, 6, 58, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (136, 55, 1, 2, 0, 100, 60, 6, 50, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (137, 55, 1, 2, 0, 100, 0, 7, 31, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (135, 55, 1, 2, 0, 100, 5, 6, 64, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (140, 55, 1, 2, 0, 100, 60, 6, 25, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (143, 55, 1, 2, 0, 100, 60, 6, 10, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (146, 55, 1, 2, 0, 100, 60, 6, 20, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (148, 55, 0, 0, 0, 33, 60, 6, 25, 80, 0, 32, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (144, 32, 0, 2, 0, 56, 60, 6, 16, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (138, 55, 1, 1, 0, 60, 60, 6, 46, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (152, 55, 1, 2, 0, 79, 60, 6, 43, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (142, 55, 1, 0, 0, 100, 60, 6, 10, 70, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (155, 55, 1, 2, 0, 100, 60, 6, 69, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (157, 55, 1, 1, 0, 100, 60, 7, 50, 70, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (158, 55, 1, 2, 0, 100, 60, 6, 64, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (159, 55, 1, 0, 0, 12, 60, 6, 10, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (153, 55, 1, 2, 0, 100, 60, 6, 50, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (130, 55, 0, 2, 0, 50, 60, 6, 58, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (161, 55, 1, 2, 0, 40, 60, 6, 50, 80, 0, 0, 0, 31, 0, 0, 0, 0);
INSERT INTO "public"."jogador_config" VALUES (149, 55, 1, 2, 0, 100, 60, 6, 104, 80, 0, 0, 0, 31, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for jogador_coupon
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_coupon";
CREATE TABLE "public"."jogador_coupon" (
  "player_id" int8 NOT NULL,
  "cor_mira" int4 NOT NULL,
  "false_rank" int4 NOT NULL,
  "false_nick" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "cor_chat" int4 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Records of jogador_coupon
-- ----------------------------
INSERT INTO "public"."jogador_coupon" VALUES (2, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (3, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (4, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (5, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (6, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (7, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (8, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (9, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (13, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (15, 0, 11, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (14, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (16, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (23, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (24, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (26, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (27, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (28, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (31, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (33, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (34, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (35, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (37, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (40, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (42, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (44, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (17, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (45, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (39, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (48, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (49, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (55, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (59, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (64, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (69, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (53, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (57, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (73, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (76, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (71, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (78, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (79, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (82, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (84, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (87, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (83, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (90, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (56, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (63, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (88, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (47, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (25, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (98, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (99, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (92, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (75, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (106, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (104, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (107, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (110, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (109, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (111, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (46, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (113, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (114, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (115, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (119, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (121, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (120, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (122, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (123, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (116, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (128, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (129, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (96, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (130, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (118, 0, 13, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (136, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (137, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (126, 0, 10, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (135, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (140, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (52, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (138, 0, 11, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (142, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (143, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (146, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (148, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (144, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (149, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (152, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (155, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (157, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (158, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (159, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (161, 0, 55, '', 0);
INSERT INTO "public"."jogador_coupon" VALUES (153, 0, 10, '', 0);

-- ----------------------------
-- Table structure for jogador_equipamento
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_equipamento";
CREATE TABLE "public"."jogador_equipamento" (
  "player_id" int8 NOT NULL,
  "weapon_primary" int4 NOT NULL,
  "weapon_secundary" int4 NOT NULL,
  "weapon_melee" int4 NOT NULL,
  "weapon_grenade" int4 NOT NULL,
  "weapon_special" int4 NOT NULL,
  "char_red" int4 NOT NULL,
  "char_blue" int4 NOT NULL,
  "char_head" int4 NOT NULL,
  "char_beret" int4 NOT NULL,
  "char_dino" int4 NOT NULL
)
;

-- ----------------------------
-- Records of jogador_equipamento
-- ----------------------------
INSERT INTO "public"."jogador_equipamento" VALUES (2, 300005146, 601014004, 702001147, 803007040, 904007051, 1001001068, 1001002067, 1102003007, 1103003010, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (4, 0, 601002003, 702001001, 803007001, 904007002, 1001001005, 1001002006, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (5, 400006001, 601002091, 702001122, 803007001, 904007002, 1001001005, 1001002006, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (6, 100003214, 601002067, 702015001, 803007001, 904007002, 1001001017, 1001002033, 1102003003, 1103003010, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (7, 300005036, 601002071, 702001041, 803007001, 904007002, 1001001068, 1001002051, 1104003013, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (42, 100003299, 601002100, 702015008, 803007001, 904007051, 1001001003, 1001002004, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (33, 200004161, 601002003, 702001001, 803007001, 904007002, 1001001005, 1001002006, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (40, 300005121, 601002012, 702001014, 803007001, 904007051, 1001001003, 1001002004, 1102003007, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (49, 100003037, 601002003, 702001001, 803007001, 904007002, 1001001003, 1001002004, 1104003014, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (23, 100003263, 601002012, 702001001, 803007001, 904007002, 1001001034, 1001002033, 1102003006, 1103003006, 1006003043);
INSERT INTO "public"."jogador_equipamento" VALUES (28, 300005188, 601002067, 702001014, 803007001, 904007002, 1001001034, 1001002033, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (59, 200004270, 601002091, 702001014, 803007001, 904007051, 1001001013, 1001002014, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (8, 200004270, 601002067, 702001001, 803007001, 904007007, 1001001054, 1001002067, 1104003013, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (55, 100003221, 601002003, 702001001, 803007001, 904007002, 1001001034, 1001002033, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (27, 300005188, 601002003, 702001001, 803007001, 904007002, 1001001034, 1001002006, 1104003014, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (37, 100003143, 601002067, 702015009, 803007001, 904007051, 1001001005, 1001002018, 1104003013, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (39, 0, 601002003, 702001001, 803007001, 904007002, 1001001005, 1001002006, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (45, 100003214, 601002003, 702001001, 803007001, 904007002, 1001001005, 1001002051, 1104003014, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (64, 100003250, 601002049, 702001122, 803007001, 904007002, 1001001003, 1001002004, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (14, 200004219, 601002071, 702001012, 803007001, 904007002, 1001001003, 1001002004, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (48, 300005161, 601002067, 702015003, 803007001, 904007002, 1001001003, 1001002004, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (138, 100003155, 601014011, 702001122, 803007001, 904007002, 1001001003, 1001002004, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (26, 100003037, 601002012, 702001009, 803007001, 904007002, 1001001003, 1001002004, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (46, 0, 601002003, 702001001, 803007001, 904007002, 1001001005, 1001002006, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (84, 300005030, 601002017, 702001017, 803007001, 904007002, 1001001003, 1001002051, 1104003012, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (119, 300005030, 601002067, 702001017, 803007001, 904007003, 1001001034, 1001002033, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (57, 100003299, 601002003, 702015008, 803007001, 904007002, 1001001034, 1001002033, 1102003007, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (99, 100003037, 601002003, 702001001, 803007001, 904007002, 1001001017, 1001002018, 1102003007, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (106, 200004136, 601002067, 702015002, 803007001, 904007007, 1001001015, 1001002016, 1104003013, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (83, 200004075, 601002017, 702001012, 803007001, 904007002, 1001001034, 1001002033, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (159, 100003155, 601002017, 702001018, 803007001, 904007002, 1001001003, 1001002004, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (75, 300005030, 601014006, 702015003, 803007001, 904007010, 1001001068, 1001002051, 1104003012, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (25, 200004219, 601002071, 702001012, 803007001, 904007002, 1001001003, 1001002004, 1104003014, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (52, 100003150, 601002067, 702015003, 803007001, 904007002, 1001001034, 1001002033, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (113, 0, 601002003, 702001001, 803007001, 904007002, 1001001005, 1001002006, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (76, 100003155, 601014006, 702015003, 803007001, 904007002, 1001001054, 1001002053, 1104003012, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (47, 300005161, 601002017, 702001018, 803007001, 904007002, 1001001034, 1001002033, 1102003007, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (73, 100003155, 601002067, 702001101, 803007001, 904007051, 1001001068, 1001002051, 1104003012, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (17, 300005020, 601002067, 702001018, 803007001, 904007005, 1001001054, 1001002053, 1102003001, 1103003016, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (15, 300005161, 601002067, 702015003, 803007001, 904007002, 1001001034, 1001002033, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (104, 300005036, 601002007, 702001018, 803007018, 904007007, 1001001054, 1001002053, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (88, 100003045, 601002067, 702001001, 803007001, 904007002, 1001001005, 1001002006, 1102003007, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (3, 100003299, 601002067, 702015003, 803007001, 904007013, 1001001003, 1001002004, 1102003001, 1103003016, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (137, 100003037, 601002071, 702001009, 803007001, 904007002, 1001001034, 1001002033, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (149, 200004136, 601002003, 702001017, 803007001, 904007002, 1001001015, 1001002051, 1104003013, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (90, 200004292, 601002100, 702015003, 803007001, 904007002, 1001001034, 1001002033, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (98, 200004132, 601002067, 702001101, 803007001, 904007051, 1001001034, 1001002053, 1104003013, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (153, 200018013, 601002017, 702001017, 803007001, 904007002, 1001001017, 1001002067, 1104003012, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (78, 200004327, 601002071, 702001101, 803007001, 904007051, 1001001054, 1001002053, 1104003009, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (82, 300005030, 601002067, 702001014, 803007001, 904007002, 1001001034, 1001002033, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (129, 100003037, 601002067, 702001101, 803007001, 904007002, 1001001034, 1001002033, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (140, 200004075, 601002067, 702015003, 803007001, 904007002, 1001001003, 1001002004, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (79, 100003221, 601002067, 702001122, 803007001, 904007002, 1001001054, 1001002018, 1104003012, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (115, 0, 601002003, 702001001, 803007001, 904007002, 1001001005, 1001002006, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (13, 300005161, 601002067, 702001014, 803007001, 904007051, 1001001034, 1001002033, 1102003007, 1103003010, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (126, 100003040, 601002011, 702001012, 803007001, 904007051, 1001001034, 1001002033, 1102003006, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (111, 100003264, 601014004, 702015008, 803007001, 904007003, 1001001015, 1001002016, 1104003014, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (92, 300005121, 601002003, 702001014, 803007001, 904007002, 1001001013, 1001002053, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (122, 0, 601002003, 702001001, 803007001, 904007002, 1001001005, 1001002006, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (144, 100003263, 601002012, 702015003, 803007001, 904007002, 1001001003, 1001002004, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (146, 100003037, 601002007, 702001011, 803007001, 904007003, 1001001034, 1001002033, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (31, 200004292, 601002003, 702001001, 803007001, 904007051, 1001001015, 1001002016, 1104003014, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (114, 300005121, 601002012, 702001122, 803007001, 904007002, 1001001034, 1001002033, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (63, 100003155, 601002067, 702001122, 803007001, 904007002, 1001001017, 1001002033, 1102003003, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (71, 100003111, 601002012, 702001009, 803007001, 904007002, 1001001003, 1001002004, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (116, 0, 601002003, 702001001, 803007001, 904007002, 1001001005, 1001002006, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (109, 100003155, 601002067, 702001101, 803007008, 904007002, 1001001005, 1001002006, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (136, 100003277, 601002067, 702015003, 803007001, 904007002, 1001001003, 1001002004, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (107, 200004136, 601002012, 702001001, 803007001, 904007002, 1001001015, 1001002012, 1102003007, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (120, 300005094, 601002071, 702001122, 803007001, 904007002, 1001001017, 1001002006, 1104003014, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (123, 100003155, 601002003, 702001001, 803007001, 904007002, 1001001003, 1001002004, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (121, 300005114, 601002003, 702001001, 803007001, 904007002, 1001001005, 1001002006, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (87, 300005161, 601002003, 702001018, 803007001, 904007002, 1001001034, 1001002033, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (128, 100003037, 601002003, 702015003, 803007001, 904007002, 1001001034, 1001002033, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (96, 100003299, 601002067, 702015008, 803007001, 904007010, 1001001003, 1001002004, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (110, 100003037, 601002071, 702001012, 803007001, 904007002, 1001001054, 1001002053, 1104003014, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (53, 100003155, 601002071, 702015003, 803007001, 904007007, 1001001054, 1001002053, 1104003012, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (161, 100003143, 601002007, 702001014, 803007001, 904007002, 1001001003, 1001002004, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (24, 200004136, 601002067, 702001014, 803007001, 904007002, 1001001015, 1001002016, 1104003014, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (148, 300005161, 601002067, 702015012, 803007001, 904007002, 1001001034, 1001002033, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (34, 200004075, 601002067, 702015009, 803007001, 904007002, 1001001034, 1001002033, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (158, 0, 601002003, 702001001, 803007001, 904007002, 1001001003, 1001002004, 1102003003, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (143, 100003155, 601002012, 702001012, 803007001, 904007002, 1001001003, 1001002033, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (118, 300005015, 601002012, 702015003, 803007001, 904007002, 1001001003, 1001002004, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (35, 400006059, 601002049, 702001041, 803007001, 904007051, 1001001068, 1001002067, 1102003001, 1103003010, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (142, 100003155, 601002012, 702015003, 803007001, 904007002, 1001001003, 1001002033, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (155, 0, 601002003, 702001001, 803007001, 904007002, 1001001005, 1001002006, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (56, 200004136, 601002012, 702015003, 803007001, 904007051, 1001001015, 1001002016, 1104003012, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (135, 200004161, 601002003, 702001122, 803007001, 904007007, 1001001068, 1001002051, 1102003007, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (157, 0, 601002003, 702001001, 803007001, 904007002, 1001001005, 1001002006, 1102003001, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (9, 100003094, 601002071, 702001041, 803007001, 904007003, 1001001015, 1001002012, 1102003007, 1103003010, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (44, 400006059, 601002018, 702001018, 803007001, 904007051, 1001001068, 1001002051, 1102003007, 1103003010, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (152, 200004136, 601002012, 702001122, 803007001, 904007007, 1001001015, 1001002016, 1104003012, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (69, 100003263, 601002018, 702015012, 803007001, 904007051, 1001001068, 1001002067, 1104003013, 0, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (130, 300005188, 601002049, 702001009, 803007001, 904007010, 1001001003, 1001002004, 1102003001, 1103003006, 1006003041);
INSERT INTO "public"."jogador_equipamento" VALUES (165, 300005094, 601002003, 702001001, 803007001, 904007002, 1001001005, 1001002006, 1102003001, 0, 1006003041);

-- ----------------------------
-- Table structure for jogador_estatisticas
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_estatisticas";
CREATE TABLE "public"."jogador_estatisticas" (
  "player_id" int8 NOT NULL,
  "partidas" int4 NOT NULL,
  "ganhou" int4 NOT NULL,
  "perdeu" int4 NOT NULL,
  "matou" int4 NOT NULL,
  "morreu" int4 NOT NULL,
  "headshots" int4 NOT NULL,
  "kitou" int4 NOT NULL,
  "empatou" int4 NOT NULL
)
;

-- ----------------------------
-- Records of jogador_estatisticas
-- ----------------------------
INSERT INTO "public"."jogador_estatisticas" VALUES (49, 1, 1, 0, 0, 0, 0, 1, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (33, 4, 2, 2, 5, 13, 4, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (2, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (4, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (5, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (6, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (7, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (45, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (39, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (14, 11, 7, 3, 85, 78, 26, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (23, 3, 1, 1, 12, 13, 8, 0, 1);
INSERT INTO "public"."jogador_estatisticas" VALUES (42, 1, 1, 0, 1, 1, 0, 1, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (28, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (55, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (40, 8, 6, 1, 39, 33, 12, 0, 1);
INSERT INTO "public"."jogador_estatisticas" VALUES (27, 1, 0, 1, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (37, 12, 8, 4, 38, 20, 14, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (59, 4, 3, 0, 5, 14, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (8, 16, 7, 9, 55, 71, 8, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (64, 1, 1, 0, 6, 3, 2, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (120, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (140, 9, 6, 3, 48, 34, 29, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (26, 9, 3, 6, 47, 63, 16, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (76, 7, 5, 1, 12, 19, 3, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (161, 5, 1, 3, 19, 31, 9, 1, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (122, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (78, 2, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (63, 4, 1, 3, 19, 23, 2, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (116, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (46, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (34, 27, 16, 11, 91, 81, 35, 3, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (92, 12, 3, 8, 54, 66, 7, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (25, 2, 2, 0, 24, 24, 8, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (104, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (157, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (96, 15, 9, 4, 72, 52, 30, 3, 1);
INSERT INTO "public"."jogador_estatisticas" VALUES (106, 9, 5, 3, 25, 12, 13, 1, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (115, 0, 0, 0, 0, 0, 0, 1, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (47, 2, 1, 1, 22, 20, 4, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (69, 27, 14, 13, 195, 195, 62, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (24, 5, 2, 2, 15, 19, 6, 0, 1);
INSERT INTO "public"."jogador_estatisticas" VALUES (48, 89, 62, 15, 1076, 613, 125, 5, 2);
INSERT INTO "public"."jogador_estatisticas" VALUES (82, 11, 4, 5, 21, 28, 6, 1, 1);
INSERT INTO "public"."jogador_estatisticas" VALUES (79, 13, 2, 10, 49, 125, 5, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (3, 25, 6, 16, 104, 134, 39, 0, 3);
INSERT INTO "public"."jogador_estatisticas" VALUES (57, 1, 1, 0, 0, 2, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (123, 8, 2, 5, 28, 53, 13, 0, 1);
INSERT INTO "public"."jogador_estatisticas" VALUES (148, 3, 0, 3, 21, 17, 5, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (73, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (111, 3, 0, 2, 11, 51, 5, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (83, 5, 2, 3, 5, 4, 2, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (71, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (13, 20, 7, 12, 49, 67, 14, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (88, 36, 19, 13, 183, 102, 75, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (31, 303, 187, 100, 1716, 1340, 751, 3, 6);
INSERT INTO "public"."jogador_estatisticas" VALUES (17, 12, 3, 7, 52, 107, 17, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (119, 13, 5, 8, 93, 159, 35, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (136, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (118, 35, 7, 26, 226, 331, 59, 1, 1);
INSERT INTO "public"."jogador_estatisticas" VALUES (110, 47, 31, 14, 414, 270, 152, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (113, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (84, 8, 5, 2, 41, 41, 22, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (87, 10, 3, 6, 23, 39, 13, 1, 1);
INSERT INTO "public"."jogador_estatisticas" VALUES (90, 1, 1, 0, 28, 21, 16, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (135, 3, 1, 1, 4, 14, 0, 0, 1);
INSERT INTO "public"."jogador_estatisticas" VALUES (98, 5, 2, 1, 3, 5, 1, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (52, 25, 7, 14, 66, 155, 18, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (75, 60, 10, 13, 53, 131, 13, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (159, 8, 5, 3, 36, 38, 14, 3, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (15, 55, 26, 25, 215, 219, 89, 1, 2);
INSERT INTO "public"."jogador_estatisticas" VALUES (130, 8, 3, 3, 37, 41, 17, 1, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (99, 2, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (56, 181, 90, 77, 983, 801, 222, 2, 5);
INSERT INTO "public"."jogador_estatisticas" VALUES (165, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (44, 103, 49, 48, 458, 418, 127, 1, 3);
INSERT INTO "public"."jogador_estatisticas" VALUES (114, 3, 0, 2, 0, 1, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (138, 12, 6, 6, 54, 72, 27, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (129, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (53, 5, 0, 1, 4, 5, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (137, 5, 5, 0, 39, 15, 11, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (121, 1, 1, 0, 10, 5, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (146, 2, 0, 2, 5, 11, 3, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (128, 1, 0, 1, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (109, 34, 10, 21, 151, 307, 45, 0, 1);
INSERT INTO "public"."jogador_estatisticas" VALUES (155, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (152, 18, 5, 10, 43, 45, 11, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (144, 3, 1, 2, 10, 22, 6, 1, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (149, 40, 15, 25, 133, 184, 53, 4, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (143, 13, 10, 1, 78, 57, 37, 1, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (158, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (16, 23, 10, 9, 91, 101, 32, 0, 3);
INSERT INTO "public"."jogador_estatisticas" VALUES (142, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (126, 10, 5, 3, 7, 20, 2, 0, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (153, 7, 2, 5, 4, 15, 0, 2, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (35, 15, 9, 5, 71, 73, 17, 1, 0);
INSERT INTO "public"."jogador_estatisticas" VALUES (107, 84, 42, 38, 442, 380, 118, 2, 3);

-- ----------------------------
-- Table structure for jogador_evento
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_evento";
CREATE TABLE "public"."jogador_evento" (
  "player_id" int8 NOT NULL,
  "check_day" int4 NOT NULL,
  "played" int4 NOT NULL,
  "play_day" int4 NOT NULL,
  "christmas" int4 NOT NULL DEFAULT 0,
  "present_day" int4 NOT NULL DEFAULT 0,
  "checks_id" int4 NOT NULL DEFAULT 0,
  "last_check1" int4 NOT NULL DEFAULT 0,
  "last_check2" int4 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Records of jogador_evento
-- ----------------------------
INSERT INTO "public"."jogador_evento" VALUES (2, 180216, 0, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (4, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_evento" VALUES (5, 180225, 115, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (6, 180226, 113, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (7, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_evento" VALUES (23, 180319, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (27, 180319, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (28, 180319, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (33, 180319, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (37, 180319, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (40, 180319, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (42, 180319, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (55, 180320, 120, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (45, 180320, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (39, 180320, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (8, 180320, 120, 0, 0, 0, 0, 3, 3);
INSERT INTO "public"."jogador_evento" VALUES (59, 180320, 99, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (64, 180320, 117, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (49, 180320, 120, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (14, 180320, 88, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (3, 180322, 112, 0, 0, 0, 2, 5, 5);
INSERT INTO "public"."jogador_evento" VALUES (78, 180321, 120, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (90, 180321, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (136, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (26, 180322, 0, 0, 0, 0, 0, 3, 3);
INSERT INTO "public"."jogador_evento" VALUES (114, 180323, 0, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (158, 180324, 120, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (83, 180322, 120, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (47, 180322, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (48, 180323, 0, 2, 0, 0, 0, 4, 4);
INSERT INTO "public"."jogador_evento" VALUES (25, 180322, 0, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (15, 180321, 91, 0, 0, 0, 0, 4, 4);
INSERT INTO "public"."jogador_evento" VALUES (79, 180322, 77, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (120, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (63, 180322, 117, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (137, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (84, 180322, 120, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (98, 180322, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (57, 180321, 117, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (99, 180322, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (16, 180324, 101, 0, 0, 0, 0, 3, 3);
INSERT INTO "public"."jogador_evento" VALUES (17, 180322, 120, 0, 0, 0, 0, 4, 4);
INSERT INTO "public"."jogador_evento" VALUES (73, 180321, 120, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (121, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (140, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (34, 180323, 0, 0, 0, 0, 0, 3, 3);
INSERT INTO "public"."jogador_evento" VALUES (52, 180323, 120, 0, 0, 0, 0, 3, 3);
INSERT INTO "public"."jogador_evento" VALUES (138, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (92, 180322, 0, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (24, 180324, 117, 0, 0, 0, 0, 4, 4);
INSERT INTO "public"."jogador_evento" VALUES (152, 180324, 91, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (122, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (106, 180322, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (76, 180321, 91, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (123, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (104, 180322, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (142, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (116, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (143, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (96, 180323, 0, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (111, 180322, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (9, 0, 90, 2, 0, 0, 1, 0, 0);
INSERT INTO "public"."jogador_evento" VALUES (44, 180324, 2, 0, 0, 0, 0, 6, 6);
INSERT INTO "public"."jogador_evento" VALUES (71, 180323, 120, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (46, 180322, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (113, 180322, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (107, 180324, 16, 0, 0, 0, 0, 3, 3);
INSERT INTO "public"."jogador_evento" VALUES (115, 180322, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (118, 180323, 0, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (128, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (129, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (126, 180324, 98, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (109, 180323, 0, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (87, 180323, 118, 0, 0, 0, 0, 3, 3);
INSERT INTO "public"."jogador_evento" VALUES (110, 180324, 102, 0, 0, 0, 0, 3, 3);
INSERT INTO "public"."jogador_evento" VALUES (155, 180324, 120, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (53, 180323, 120, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (159, 180324, 83, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (82, 180323, 103, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (149, 180324, 32, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (88, 180323, 0, 0, 0, 0, 0, 3, 3);
INSERT INTO "public"."jogador_evento" VALUES (75, 180323, 77, 0, 0, 0, 0, 3, 3);
INSERT INTO "public"."jogador_evento" VALUES (56, 180324, 25, 2, 0, 0, 0, 5, 5);
INSERT INTO "public"."jogador_evento" VALUES (13, 180323, 0, 0, 0, 0, 0, 3, 3);
INSERT INTO "public"."jogador_evento" VALUES (146, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (148, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (144, 180323, 0, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (130, 180324, 107, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (119, 180323, 0, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (153, 180324, 104, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (135, 180324, 120, 0, 0, 0, 0, 2, 2);
INSERT INTO "public"."jogador_evento" VALUES (35, 180324, 65, 0, 0, 0, 0, 6, 6);
INSERT INTO "public"."jogador_evento" VALUES (157, 180324, 120, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (69, 180324, 61, 0, 0, 0, 0, 4, 4);
INSERT INTO "public"."jogador_evento" VALUES (165, 180324, 120, 0, 0, 0, 0, 1, 1);
INSERT INTO "public"."jogador_evento" VALUES (31, 180324, 0, 1, 0, 0, 0, 6, 6);

-- ----------------------------
-- Table structure for jogador_inventario
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_inventario";
CREATE TABLE "public"."jogador_inventario" (
  "object" int8 NOT NULL DEFAULT nextval('jogador_inventario_seq'::regclass),
  "player_id" int8 NOT NULL,
  "item_id" int4 NOT NULL,
  "count" int4 NOT NULL,
  "equip" int4 NOT NULL
)
;

-- ----------------------------
-- Records of jogador_inventario
-- ----------------------------
INSERT INTO "public"."jogador_inventario" VALUES (2, 2, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3, 2, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4, 2, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5, 2, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6, 2, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (7, 2, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (8, 2, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (9, 2, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (10, 2, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (11, 2, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (12, 2, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (13, 2, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (14, 2, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (15, 2, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (16, 2, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (17, 2, 1103003016, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (18, 2, 1103003010, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (19, 2, 100003221, 1802171746, 2);
INSERT INTO "public"."jogador_inventario" VALUES (20, 2, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (21, 2, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (22, 2, 702001122, 1802171553, 2);
INSERT INTO "public"."jogador_inventario" VALUES (23, 2, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (24, 2, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (25, 2, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (26, 2, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (27, 2, 100003155, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (28, 2, 100003214, 1803062026, 2);
INSERT INTO "public"."jogador_inventario" VALUES (29, 2, 200004205, 1803062026, 2);
INSERT INTO "public"."jogador_inventario" VALUES (30, 2, 300005114, 1803062026, 2);
INSERT INTO "public"."jogador_inventario" VALUES (31, 3, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (32, 3, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (33, 3, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (34, 3, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (35, 3, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (36, 3, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (37, 3, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (38, 3, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (39, 3, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (40, 3, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (41, 3, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (42, 3, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (43, 3, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (44, 3, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (45, 3, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (46, 2, 400006054, 1802242026, 2);
INSERT INTO "public"."jogador_inventario" VALUES (47, 2, 601002067, 1802242026, 2);
INSERT INTO "public"."jogador_inventario" VALUES (48, 2, 400006053, 1802242026, 2);
INSERT INTO "public"."jogador_inventario" VALUES (49, 2, 702015009, 1802242026, 2);
INSERT INTO "public"."jogador_inventario" VALUES (50, 2, 904007051, 1803062026, 2);
INSERT INTO "public"."jogador_inventario" VALUES (51, 3, 1103003016, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (52, 3, 1103003010, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (53, 2, 100003037, 1803162027, 2);
INSERT INTO "public"."jogador_inventario" VALUES (62, 2, 100003052, 1803162027, 2);
INSERT INTO "public"."jogador_inventario" VALUES (64, 2, 100003064, 1803162027, 2);
INSERT INTO "public"."jogador_inventario" VALUES (65, 2, 100003051, 1803162027, 2);
INSERT INTO "public"."jogador_inventario" VALUES (66, 2, 100003284, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (67, 2, 100003102, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (68, 2, 100003153, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (69, 2, 100003096, 1803162027, 2);
INSERT INTO "public"."jogador_inventario" VALUES (70, 2, 100003169, 1803162028, 2);
INSERT INTO "public"."jogador_inventario" VALUES (71, 2, 200018013, 1803162028, 2);
INSERT INTO "public"."jogador_inventario" VALUES (72, 2, 200004026, 1803162028, 2);
INSERT INTO "public"."jogador_inventario" VALUES (73, 2, 200004107, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (74, 2, 200004136, 1803162028, 2);
INSERT INTO "public"."jogador_inventario" VALUES (76, 2, 200004219, 1803162028, 2);
INSERT INTO "public"."jogador_inventario" VALUES (82, 2, 300005030, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (87, 2, 300005121, 1803162028, 2);
INSERT INTO "public"."jogador_inventario" VALUES (93, 2, 300005036, 1803162029, 2);
INSERT INTO "public"."jogador_inventario" VALUES (94, 3, 100003153, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (95, 2, 300005068, 1803162029, 2);
INSERT INTO "public"."jogador_inventario" VALUES (99, 2, 702001018, 1803162029, 2);
INSERT INTO "public"."jogador_inventario" VALUES (100, 3, 100003284, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (101, 3, 100003102, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (102, 2, 702001011, 1803162029, 2);
INSERT INTO "public"."jogador_inventario" VALUES (108, 2, 702015008, 1803162029, 2);
INSERT INTO "public"."jogador_inventario" VALUES (110, 2, 702001012, 1804152029, 2);
INSERT INTO "public"."jogador_inventario" VALUES (115, 3, 300005072, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (116, 2, 702001014, 1803162029, 2);
INSERT INTO "public"."jogador_inventario" VALUES (118, 2, 803007018, 1803162030, 2);
INSERT INTO "public"."jogador_inventario" VALUES (120, 2, 803007006, 1803162030, 2);
INSERT INTO "public"."jogador_inventario" VALUES (126, 3, 601002035, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (127, 2, 1200080000, 1803162030, 2);
INSERT INTO "public"."jogador_inventario" VALUES (132, 2, 1200008000, 1803162030, 2);
INSERT INTO "public"."jogador_inventario" VALUES (137, 2, 1200031000, 1803162030, 2);
INSERT INTO "public"."jogador_inventario" VALUES (146, 2, 1300044030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (152, 3, 100003040, 1805152031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (153, 3, 601002012, 1805152033, 2);
INSERT INTO "public"."jogador_inventario" VALUES (156, 3, 1103003006, 1805152036, 2);
INSERT INTO "public"."jogador_inventario" VALUES (157, 3, 601002049, 1804152033, 2);
INSERT INTO "public"."jogador_inventario" VALUES (166, 2, 1200035000, 1803162031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (172, 2, 1200040000, 1803162031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (179, 2, 1200027000, 1803162031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (183, 2, 1200017000, 1803162031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (187, 2, 1200026000, 1803162031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (192, 2, 1001002064, 1802242031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (196, 3, 1200035000, 1805152031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (197, 2, 1001001068, 1803162031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (199, 3, 1200027000, 1807142031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (200, 2, 1102003007, 1803162031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (201, 3, 1200078000, 1806142031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (212, 3, 702015001, 3, 1);
INSERT INTO "public"."jogador_inventario" VALUES (213, 3, 100003014, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (214, 3, 300005006, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (215, 3, 601013001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (216, 3, 200004007, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (217, 3, 200004009, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (218, 3, 803007004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (219, 3, 400006004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (220, 3, 400006003, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (222, 3, 200004011, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (223, 3, 1103003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (224, 3, 200004013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (225, 3, 1103003002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (226, 3, 601014001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (227, 3, 601014002, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (228, 3, 100003013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (229, 3, 702001004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (230, 3, 300005024, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (231, 3, 100003036, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (232, 3, 100003015, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (233, 3, 1103003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (234, 3, 702001007, 7, 1);
INSERT INTO "public"."jogador_inventario" VALUES (235, 3, 300005005, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (236, 3, 1103003005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (237, 3, 1103003003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (242, 2, 1001002051, 1803162047, 2);
INSERT INTO "public"."jogador_inventario" VALUES (243, 2, 1001002067, 1803162047, 2);
INSERT INTO "public"."jogador_inventario" VALUES (244, 2, 1200044000, 1803162059, 2);
INSERT INTO "public"."jogador_inventario" VALUES (245, 2, 601002071, 1803162107, 2);
INSERT INTO "public"."jogador_inventario" VALUES (175, 3, 1301085000, 93, 1);
INSERT INTO "public"."jogador_inventario" VALUES (206, 3, 200004292, 1803302033, 2);
INSERT INTO "public"."jogador_inventario" VALUES (203, 3, 100003277, 1804082033, 2);
INSERT INTO "public"."jogador_inventario" VALUES (210, 3, 400006082, 1804172033, 2);
INSERT INTO "public"."jogador_inventario" VALUES (246, 2, 601014004, 1803162107, 2);
INSERT INTO "public"."jogador_inventario" VALUES (248, 2, 803007040, 1803181817, 2);
INSERT INTO "public"."jogador_inventario" VALUES (249, 2, 100003241, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (251, 2, 300005139, 1803181553, 2);
INSERT INTO "public"."jogador_inventario" VALUES (253, 2, 100003111, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (261, 3, 601002091, 1808151557, 2);
INSERT INTO "public"."jogador_inventario" VALUES (267, 3, 200004107, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2435, 44, 601002015, 1804191600, 2);
INSERT INTO "public"."jogador_inventario" VALUES (269, 3, 300005030, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (271, 3, 601013004, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (991, 15, 1200242000, 1803282136, 2);
INSERT INTO "public"."jogador_inventario" VALUES (273, 3, 100003270, 1, 0);
INSERT INTO "public"."jogador_inventario" VALUES (274, 2, 100003270, 1, 0);
INSERT INTO "public"."jogador_inventario" VALUES (276, 2, 300005146, 1803181817, 2);
INSERT INTO "public"."jogador_inventario" VALUES (992, 15, 100003264, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (280, 3, 702001149, 1805171817, 2);
INSERT INTO "public"."jogador_inventario" VALUES (281, 2, 702001149, 1805171817, 2);
INSERT INTO "public"."jogador_inventario" VALUES (282, 2, 702001147, 1805171817, 2);
INSERT INTO "public"."jogador_inventario" VALUES (283, 3, 702001147, 1805171817, 2);
INSERT INTO "public"."jogador_inventario" VALUES (285, 4, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (286, 4, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (287, 4, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (288, 4, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (289, 4, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (290, 4, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (291, 4, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (292, 4, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (293, 4, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (294, 4, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (295, 4, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (296, 4, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (297, 4, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (298, 4, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (299, 4, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (300, 5, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (301, 5, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (302, 5, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (303, 5, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (304, 5, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (305, 5, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (306, 5, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (307, 5, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (308, 5, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (309, 5, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (310, 5, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (311, 5, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (312, 5, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (313, 5, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (314, 5, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (315, 5, 1103003016, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (316, 5, 1103003010, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (317, 5, 100003221, 1802262119, 2);
INSERT INTO "public"."jogador_inventario" VALUES (318, 5, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (319, 5, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (320, 5, 702001122, 1802262115, 2);
INSERT INTO "public"."jogador_inventario" VALUES (321, 5, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (322, 5, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (323, 5, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (325, 5, 601013001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (326, 5, 803007004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (327, 5, 200004007, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (328, 5, 200004009, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (329, 5, 100003014, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (330, 5, 702015001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (331, 5, 300005006, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (332, 5, 1301335000, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (333, 5, 400006082, 1805042147, 2);
INSERT INTO "public"."jogador_inventario" VALUES (334, 5, 200004325, 6480000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (335, 5, 200004327, 8726400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (336, 5, 100003299, 4233600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (337, 5, 300005188, 6652800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (338, 5, 601002091, 1808242147, 2);
INSERT INTO "public"."jogador_inventario" VALUES (339, 5, 601002049, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (340, 5, 1300044030, 7, 1);
INSERT INTO "public"."jogador_inventario" VALUES (341, 5, 1300026030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (342, 5, 1300078030, 7, 1);
INSERT INTO "public"."jogador_inventario" VALUES (343, 5, 1102003003, 18144000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (344, 5, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (345, 5, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (346, 5, 1300035030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (347, 5, 1300027030, 7, 1);
INSERT INTO "public"."jogador_inventario" VALUES (348, 5, 1103003006, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (349, 5, 1300028030, 6, 1);
INSERT INTO "public"."jogador_inventario" VALUES (350, 6, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (351, 6, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (352, 6, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (353, 6, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (354, 6, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (355, 6, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (356, 6, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (357, 6, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (358, 6, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (359, 6, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (360, 6, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (361, 6, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (362, 6, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (363, 6, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (364, 6, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (365, 6, 1103003016, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (366, 6, 1103003010, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (367, 6, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (369, 6, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (370, 6, 702001122, 1803052058, 2);
INSERT INTO "public"."jogador_inventario" VALUES (371, 6, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (372, 6, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (373, 6, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (374, 6, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (375, 6, 300005006, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (376, 6, 702015001, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (377, 6, 100003014, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (378, 6, 601013001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (379, 6, 100003013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (398, 6, 100003214, 1803142048, 2);
INSERT INTO "public"."jogador_inventario" VALUES (399, 6, 400006053, 1803142048, 2);
INSERT INTO "public"."jogador_inventario" VALUES (400, 6, 601002067, 1803142048, 2);
INSERT INTO "public"."jogador_inventario" VALUES (401, 6, 1001002033, 1804032049, 2);
INSERT INTO "public"."jogador_inventario" VALUES (402, 6, 1001001017, 1804032049, 2);
INSERT INTO "public"."jogador_inventario" VALUES (404, 6, 1200079000, 1803142049, 2);
INSERT INTO "public"."jogador_inventario" VALUES (406, 6, 1200026000, 1804032049, 2);
INSERT INTO "public"."jogador_inventario" VALUES (408, 6, 1200027000, 1804032049, 2);
INSERT INTO "public"."jogador_inventario" VALUES (410, 6, 1200040000, 1804032049, 2);
INSERT INTO "public"."jogador_inventario" VALUES (412, 6, 1200035000, 1804032049, 2);
INSERT INTO "public"."jogador_inventario" VALUES (414, 6, 1200080000, 1804032049, 2);
INSERT INTO "public"."jogador_inventario" VALUES (415, 6, 601002049, 20736000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (416, 6, 1300044030, 11, 1);
INSERT INTO "public"."jogador_inventario" VALUES (417, 6, 1300026030, 8, 1);
INSERT INTO "public"."jogador_inventario" VALUES (418, 6, 1300078030, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (419, 6, 1102003003, 1901282058, 2);
INSERT INTO "public"."jogador_inventario" VALUES (430, 6, 1300028030, 3, 1);
INSERT INTO "public"."jogador_inventario" VALUES (421, 3, 300005161, 1804102111, 2);
INSERT INTO "public"."jogador_inventario" VALUES (423, 3, 200004270, 1805242111, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1010, 16, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1011, 16, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1012, 16, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (431, 6, 1300027030, 3, 1);
INSERT INTO "public"."jogador_inventario" VALUES (432, 6, 1200078000, 1804032059, 2);
INSERT INTO "public"."jogador_inventario" VALUES (995, 16, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (437, 6, 200004007, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (438, 6, 200004009, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (439, 6, 400006004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (442, 6, 803007004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (445, 6, 904007005, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (446, 6, 400006003, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (447, 6, 601014001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (448, 6, 601014002, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (449, 6, 300005024, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (451, 3, 300005114, 1803271234, 2);
INSERT INTO "public"."jogador_inventario" VALUES (452, 3, 100003214, 1803271234, 2);
INSERT INTO "public"."jogador_inventario" VALUES (453, 3, 702015009, 1803271234, 2);
INSERT INTO "public"."jogador_inventario" VALUES (454, 3, 601002067, 1803271234, 2);
INSERT INTO "public"."jogador_inventario" VALUES (456, 3, 1200242000, 1803271234, 2);
INSERT INTO "public"."jogador_inventario" VALUES (458, 3, 1200080000, 1804161234, 2);
INSERT INTO "public"."jogador_inventario" VALUES (459, 7, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (460, 7, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (461, 7, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (462, 7, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (463, 7, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (464, 7, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (465, 7, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (466, 7, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (467, 7, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (468, 7, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (469, 7, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (470, 7, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (471, 7, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (472, 7, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (473, 7, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (474, 7, 1103003016, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (475, 7, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (476, 7, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (477, 7, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (478, 7, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (479, 7, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (480, 7, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (481, 7, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (482, 7, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (483, 3, 100003169, 1804161300, 2);
INSERT INTO "public"."jogador_inventario" VALUES (484, 7, 1104003013, 1804161300, 2);
INSERT INTO "public"."jogador_inventario" VALUES (485, 3, 1200026000, 1804161300, 2);
INSERT INTO "public"."jogador_inventario" VALUES (486, 7, 1001002067, 1804161300, 2);
INSERT INTO "public"."jogador_inventario" VALUES (487, 7, 1001002051, 1804161300, 2);
INSERT INTO "public"."jogador_inventario" VALUES (488, 3, 200004205, 1803271300, 2);
INSERT INTO "public"."jogador_inventario" VALUES (489, 7, 100003214, 1803271300, 2);
INSERT INTO "public"."jogador_inventario" VALUES (490, 3, 200004075, 1804161300, 2);
INSERT INTO "public"."jogador_inventario" VALUES (491, 3, 200004219, 1804161300, 2);
INSERT INTO "public"."jogador_inventario" VALUES (492, 7, 601002067, 1803271301, 2);
INSERT INTO "public"."jogador_inventario" VALUES (493, 7, 702015003, 1804161301, 2);
INSERT INTO "public"."jogador_inventario" VALUES (496, 7, 100003040, 1804161320, 2);
INSERT INTO "public"."jogador_inventario" VALUES (497, 7, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (500, 7, 1103003006, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (501, 7, 601002049, 1804161319, 2);
INSERT INTO "public"."jogador_inventario" VALUES (502, 7, 1300044030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (504, 7, 1300078030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (505, 7, 1102003003, 5184000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (508, 3, 1200008000, 1804161301, 2);
INSERT INTO "public"."jogador_inventario" VALUES (509, 7, 1200026000, 1804161301, 2);
INSERT INTO "public"."jogador_inventario" VALUES (511, 7, 1200027000, 1805161301, 2);
INSERT INTO "public"."jogador_inventario" VALUES (512, 7, 1200028000, 1804161301, 2);
INSERT INTO "public"."jogador_inventario" VALUES (513, 7, 1200035000, 1804161302, 2);
INSERT INTO "public"."jogador_inventario" VALUES (514, 7, 1200044000, 1804161302, 2);
INSERT INTO "public"."jogador_inventario" VALUES (515, 7, 601002091, 1809131319, 2);
INSERT INTO "public"."jogador_inventario" VALUES (516, 7, 300005170, 1803201319, 2);
INSERT INTO "public"."jogador_inventario" VALUES (517, 7, 400006073, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (518, 7, 200004292, 1803241319, 2);
INSERT INTO "public"."jogador_inventario" VALUES (519, 7, 400006082, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (520, 7, 200004327, 1803201319, 2);
INSERT INTO "public"."jogador_inventario" VALUES (521, 7, 1200078000, 1804161302, 2);
INSERT INTO "public"."jogador_inventario" VALUES (522, 7, 100003014, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (523, 7, 702015001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (524, 7, 300005006, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (526, 7, 601013001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (527, 7, 200004007, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (528, 7, 200004009, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (529, 7, 803007004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (530, 7, 400006004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (533, 7, 100003013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (534, 7, 702001004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (535, 7, 300005024, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (536, 7, 601014001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (537, 7, 601014002, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (538, 7, 200004011, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (539, 7, 904007005, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (540, 7, 400006003, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (541, 3, 1200079000, 1803271303, 2);
INSERT INTO "public"."jogador_inventario" VALUES (542, 7, 100003036, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (543, 7, 100003015, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (544, 7, 702001007, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (545, 7, 300005005, 8, 1);
INSERT INTO "public"."jogador_inventario" VALUES (546, 7, 200004013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (547, 7, 1103003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (548, 7, 1103003003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (549, 7, 300005032, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (550, 7, 1103003005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (551, 7, 1103003002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (552, 7, 1103003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (553, 3, 300005015, 1804161303, 2);
INSERT INTO "public"."jogador_inventario" VALUES (554, 3, 702001101, 1803271303, 2);
INSERT INTO "public"."jogador_inventario" VALUES (555, 3, 702001018, 1804161303, 2);
INSERT INTO "public"."jogador_inventario" VALUES (556, 3, 702015003, 1804161304, 2);
INSERT INTO "public"."jogador_inventario" VALUES (557, 3, 702001017, 1804161304, 2);
INSERT INTO "public"."jogador_inventario" VALUES (558, 3, 702015002, 1804161304, 2);
INSERT INTO "public"."jogador_inventario" VALUES (559, 3, 702015008, 1804161304, 2);
INSERT INTO "public"."jogador_inventario" VALUES (560, 3, 702001014, 1804161304, 2);
INSERT INTO "public"."jogador_inventario" VALUES (561, 3, 702001009, 1804161304, 2);
INSERT INTO "public"."jogador_inventario" VALUES (562, 7, 1001001068, 1804161304, 2);
INSERT INTO "public"."jogador_inventario" VALUES (563, 3, 904007051, 1803271317, 2);
INSERT INTO "public"."jogador_inventario" VALUES (564, 3, 904007013, 1804161317, 2);
INSERT INTO "public"."jogador_inventario" VALUES (565, 3, 400006053, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (566, 3, 1001002051, 1804161326, 2);
INSERT INTO "public"."jogador_inventario" VALUES (567, 3, 1001002067, 1804161326, 2);
INSERT INTO "public"."jogador_inventario" VALUES (568, 7, 904007051, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (569, 3, 1001001068, 1804161326, 2);
INSERT INTO "public"."jogador_inventario" VALUES (570, 7, 300005036, 1804161326, 2);
INSERT INTO "public"."jogador_inventario" VALUES (575, 7, 601002071, 1804161326, 2);
INSERT INTO "public"."jogador_inventario" VALUES (576, 3, 1200028000, 1804161326, 2);
INSERT INTO "public"."jogador_inventario" VALUES (577, 7, 702015009, 1803271326, 2);
INSERT INTO "public"."jogador_inventario" VALUES (578, 7, 702001101, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (579, 7, 702001041, 1804161326, 2);
INSERT INTO "public"."jogador_inventario" VALUES (581, 8, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (582, 8, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (583, 8, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (584, 8, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (585, 8, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (586, 8, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (587, 8, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (588, 8, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (589, 8, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (572, 3, 1300044030, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (573, 3, 1300027030, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (590, 8, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (591, 8, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (592, 8, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (593, 8, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (594, 8, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (595, 8, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (596, 8, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (597, 8, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (600, 8, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (601, 8, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (603, 8, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (996, 16, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (602, 8, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (752, 9, 200004325, 11750400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (712, 8, 601002067, 1804071738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (664, 8, 200004270, 1806122243, 2);
INSERT INTO "public"."jogador_inventario" VALUES (677, 8, 1300030030, 4, 1);
INSERT INTO "public"."jogador_inventario" VALUES (723, 8, 601002018, 1804181739, 2);
INSERT INTO "public"."jogador_inventario" VALUES (659, 9, 200004327, 1806221906, 2);
INSERT INTO "public"."jogador_inventario" VALUES (746, 9, 400006073, 5616000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (749, 9, 200004270, 8035200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (751, 9, 200004292, 4406400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (610, 9, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (611, 9, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (612, 9, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (613, 9, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (614, 9, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (615, 9, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (616, 9, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (617, 9, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (618, 9, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (619, 9, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (620, 9, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (621, 9, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (622, 9, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (623, 9, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (624, 9, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (625, 9, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (626, 9, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (627, 9, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2437, 31, 601002067, 1803301603, 2);
INSERT INTO "public"."jogador_inventario" VALUES (629, 9, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (753, 9, 601002100, 23328000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (656, 9, 100003264, 1806041903, 2);
INSERT INTO "public"."jogador_inventario" VALUES (642, 9, 400006082, 10454400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (633, 9, 100003155, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (634, 9, 300005114, 1803281728, 2);
INSERT INTO "public"."jogador_inventario" VALUES (728, 8, 100003263, 1803281756, 2);
INSERT INTO "public"."jogador_inventario" VALUES (721, 8, 702001017, 1804181739, 2);
INSERT INTO "public"."jogador_inventario" VALUES (637, 9, 702015009, 1803281730, 2);
INSERT INTO "public"."jogador_inventario" VALUES (638, 9, 601002067, 1803281730, 2);
INSERT INTO "public"."jogador_inventario" VALUES (639, 9, 904007051, 1803281730, 2);
INSERT INTO "public"."jogador_inventario" VALUES (686, 8, 1104003013, 1806161736, 2);
INSERT INTO "public"."jogador_inventario" VALUES (644, 9, 100003277, 1805041735, 2);
INSERT INTO "public"."jogador_inventario" VALUES (667, 8, 1001002067, 1807161735, 2);
INSERT INTO "public"."jogador_inventario" VALUES (709, 8, 400006054, 1803281738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (607, 8, 400006073, 6566400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (606, 8, 200004292, 1805301729, 2);
INSERT INTO "public"."jogador_inventario" VALUES (608, 8, 100003277, 1805212111, 2);
INSERT INTO "public"."jogador_inventario" VALUES (648, 9, 1200026000, 1804171731, 2);
INSERT INTO "public"."jogador_inventario" VALUES (763, 8, 100003264, 1803281756, 2);
INSERT INTO "public"."jogador_inventario" VALUES (663, 8, 1301203000, 40, 1);
INSERT INTO "public"."jogador_inventario" VALUES (671, 8, 400006082, 1123200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (654, 9, 1200079000, 1803281732, 2);
INSERT INTO "public"."jogador_inventario" VALUES (665, 8, 300005161, 1804051735, 2);
INSERT INTO "public"."jogador_inventario" VALUES (670, 8, 1301335000, 38, 1);
INSERT INTO "public"."jogador_inventario" VALUES (660, 9, 1200038000, 1804171732, 2);
INSERT INTO "public"."jogador_inventario" VALUES (708, 8, 300005114, 1804071738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (658, 9, 300005170, 11750400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2440, 14, 601002071, 1803211604, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2434, 14, 601002035, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2441, 9, 100003150, 1803301641, 2);
INSERT INTO "public"."jogador_inventario" VALUES (678, 3, 1104003013, 1804171735, 2);
INSERT INTO "public"."jogador_inventario" VALUES (680, 9, 702001014, 1804171735, 2);
INSERT INTO "public"."jogador_inventario" VALUES (682, 9, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2442, 9, 200004132, 1803301641, 2);
INSERT INTO "public"."jogador_inventario" VALUES (672, 8, 200004325, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (736, 8, 1102003007, 1804171742, 2);
INSERT INTO "public"."jogador_inventario" VALUES (685, 9, 1103003006, 1804171736, 2);
INSERT INTO "public"."jogador_inventario" VALUES (687, 8, 1200037000, 1806161736, 2);
INSERT INTO "public"."jogador_inventario" VALUES (681, 9, 100003040, 1804171736, 2);
INSERT INTO "public"."jogador_inventario" VALUES (657, 9, 100003263, 5961600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (710, 8, 200004205, 1803281738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (666, 8, 702015012, 31104000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (711, 8, 400006053, 1803281738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (674, 8, 1200003000, 1808151735, 2);
INSERT INTO "public"."jogador_inventario" VALUES (713, 8, 702001101, 1803281738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (714, 8, 702015009, 1803281738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (715, 8, 904007051, 1803281738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (716, 8, 100003169, 1804171738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (717, 8, 200004026, 1804171738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (719, 8, 300005121, 1804171739, 2);
INSERT INTO "public"."jogador_inventario" VALUES (720, 8, 601002011, 1804171739, 2);
INSERT INTO "public"."jogador_inventario" VALUES (689, 8, 1200031000, 1805171736, 2);
INSERT INTO "public"."jogador_inventario" VALUES (698, 8, 1200027000, 1806161737, 2);
INSERT INTO "public"."jogador_inventario" VALUES (729, 8, 100003299, 3542400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (733, 8, 1200002000, 1806161741, 2);
INSERT INTO "public"."jogador_inventario" VALUES (696, 8, 1200026000, 1806161737, 2);
INSERT INTO "public"."jogador_inventario" VALUES (737, 8, 1102003006, 1804171742, 2);
INSERT INTO "public"."jogador_inventario" VALUES (739, 9, 1001002051, 1804171743, 2);
INSERT INTO "public"."jogador_inventario" VALUES (740, 9, 1001002053, 1804171743, 2);
INSERT INTO "public"."jogador_inventario" VALUES (742, 9, 1200032000, 1804171743, 2);
INSERT INTO "public"."jogador_inventario" VALUES (744, 9, 1200040000, 1804171744, 2);
INSERT INTO "public"."jogador_inventario" VALUES (718, 8, 200004043, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (676, 8, 1200008000, 1808151735, 2);
INSERT INTO "public"."jogador_inventario" VALUES (758, 9, 702015012, 15552000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (650, 9, 1200027000, 1804181731, 2);
INSERT INTO "public"."jogador_inventario" VALUES (652, 9, 1200035000, 1804181731, 2);
INSERT INTO "public"."jogador_inventario" VALUES (679, 8, 1300044030, 5, 1);
INSERT INTO "public"."jogador_inventario" VALUES (722, 8, 803007008, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (707, 8, 100003214, 1804071738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (738, 8, 200004327, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (609, 8, 300005170, 5529600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (669, 8, 1200079000, 1804171735, 2);
INSERT INTO "public"."jogador_inventario" VALUES (694, 8, 1300032030, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (691, 8, 1200017000, 1805171737, 2);
INSERT INTO "public"."jogador_inventario" VALUES (731, 8, 1200242000, 1804071741, 2);
INSERT INTO "public"."jogador_inventario" VALUES (700, 8, 1300036030, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (702, 8, 1200040000, 1805171737, 2);
INSERT INTO "public"."jogador_inventario" VALUES (704, 8, 1200080000, 1805171737, 2);
INSERT INTO "public"."jogador_inventario" VALUES (693, 8, 1200035000, 1806161737, 2);
INSERT INTO "public"."jogador_inventario" VALUES (662, 8, 300005171, 1805241814, 2);
INSERT INTO "public"."jogador_inventario" VALUES (823, 3, 1200003000, 1804171848, 2);
INSERT INTO "public"."jogador_inventario" VALUES (764, 9, 1001001068, 1804171747, 2);
INSERT INTO "public"."jogador_inventario" VALUES (997, 16, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (998, 16, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (767, 9, 100003037, 1804171748, 2);
INSERT INTO "public"."jogador_inventario" VALUES (768, 8, 601013004, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (769, 3, 1300032030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (999, 16, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (824, 3, 1300030030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1000, 16, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1001, 16, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1002, 16, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (826, 3, 1200004000, 1804171848, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1003, 16, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1004, 16, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (636, 9, 1001001003, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (635, 9, 1001002004, 93, 1);
INSERT INTO "public"."jogador_inventario" VALUES (829, 3, 1200119000, 1804171848, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1005, 16, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (831, 3, 1200038000, 1804171848, 2);
INSERT INTO "public"."jogador_inventario" VALUES (435, 3, 100003264, 1804302111, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1006, 16, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (605, 8, 1301299000, 95, 1);
INSERT INTO "public"."jogador_inventario" VALUES (818, 8, 904007007, 1805171829, 2);
INSERT INTO "public"."jogador_inventario" VALUES (834, 9, 1200002000, 1804171848, 2);
INSERT INTO "public"."jogador_inventario" VALUES (835, 3, 1200037000, 1804171848, 2);
INSERT INTO "public"."jogador_inventario" VALUES (915, 15, 100003250, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (808, 8, 803007018, 1804181826, 2);
INSERT INTO "public"."jogador_inventario" VALUES (838, 9, 1200003000, 1804171848, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2443, 44, 100003150, 1803301650, 2);
INSERT INTO "public"."jogador_inventario" VALUES (841, 8, 1001002033, 1804171904, 2);
INSERT INTO "public"."jogador_inventario" VALUES (776, 8, 1103003010, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (777, 8, 1103003016, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (842, 8, 1001002018, 1804171904, 2);
INSERT INTO "public"."jogador_inventario" VALUES (843, 8, 1001002053, 1804171904, 2);
INSERT INTO "public"."jogador_inventario" VALUES (789, 8, 1102003003, 1805171904, 2);
INSERT INTO "public"."jogador_inventario" VALUES (785, 8, 1103003006, 1804171904, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2446, 44, 601002049, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2447, 44, 1300026030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (781, 8, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (786, 8, 601002049, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (787, 8, 1300026030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (790, 8, 1300028030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (784, 8, 1300027030, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (788, 8, 1300078030, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (887, 13, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6415, 148, 1001001017, 1803242002, 2);
INSERT INTO "public"."jogador_inventario" VALUES (845, 8, 1104003009, 1804171905, 2);
INSERT INTO "public"."jogador_inventario" VALUES (846, 9, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (847, 9, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (848, 9, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (791, 8, 1001001015, 1804171823, 2);
INSERT INTO "public"."jogador_inventario" VALUES (792, 8, 1001001011, 1804171823, 2);
INSERT INTO "public"."jogador_inventario" VALUES (794, 9, 1103003010, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (795, 9, 1103003016, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (849, 9, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (799, 8, 1200011000, 1804171825, 2);
INSERT INTO "public"."jogador_inventario" VALUES (850, 9, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (783, 8, 1300035030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (802, 8, 1301085000, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (775, 8, 300005188, 3024000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (810, 8, 300005036, 1804171827, 2);
INSERT INTO "public"."jogador_inventario" VALUES (852, 3, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (782, 8, 601002012, 1805171827, 2);
INSERT INTO "public"."jogador_inventario" VALUES (812, 8, 601014004, 1804171827, 2);
INSERT INTO "public"."jogador_inventario" VALUES (813, 8, 601014005, 1804171827, 2);
INSERT INTO "public"."jogador_inventario" VALUES (814, 8, 601002071, 1804171827, 2);
INSERT INTO "public"."jogador_inventario" VALUES (815, 8, 601002013, 1804171828, 2);
INSERT INTO "public"."jogador_inventario" VALUES (816, 8, 601002014, 1804171828, 2);
INSERT INTO "public"."jogador_inventario" VALUES (817, 8, 904007010, 1804171829, 2);
INSERT INTO "public"."jogador_inventario" VALUES (773, 3, 200004325, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (821, 3, 1200002000, 1804171848, 2);
INSERT INTO "public"."jogador_inventario" VALUES (853, 3, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (854, 3, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (855, 3, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (859, 3, 1001001015, 1804171922, 2);
INSERT INTO "public"."jogador_inventario" VALUES (860, 3, 1001002016, 1804171922, 2);
INSERT INTO "public"."jogador_inventario" VALUES (861, 3, 601002011, 1804171922, 2);
INSERT INTO "public"."jogador_inventario" VALUES (204, 3, 300005171, 1805202033, 2);
INSERT INTO "public"."jogador_inventario" VALUES (862, 3, 1300028030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (574, 3, 1300078030, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (161, 3, 1102003003, 1808132036, 2);
INSERT INTO "public"."jogador_inventario" VALUES (844, 8, 1104003015, 1806161904, 2);
INSERT INTO "public"."jogador_inventario" VALUES (863, 8, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (864, 8, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (865, 8, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (866, 8, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (867, 8, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (868, 13, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (869, 13, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (870, 13, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (871, 13, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (872, 13, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (873, 13, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (874, 13, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (875, 13, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (876, 13, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (877, 13, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (878, 13, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (879, 13, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (880, 13, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (881, 13, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (882, 13, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (883, 13, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (884, 13, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (885, 13, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6416, 148, 1001002053, 1803242002, 2);
INSERT INTO "public"."jogador_inventario" VALUES (891, 13, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (892, 15, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (893, 15, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (894, 15, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (895, 15, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (896, 15, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (897, 15, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (898, 15, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (899, 15, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (900, 15, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (901, 15, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (902, 15, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (903, 15, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (904, 15, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (905, 15, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (906, 15, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (907, 15, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (908, 15, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (909, 15, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (925, 15, 1001001034, 1803252041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (924, 15, 1001002033, 1803252041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (811, 8, 300005072, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (774, 3, 100003263, 1805201923, 2);
INSERT INTO "public"."jogador_inventario" VALUES (927, 15, 200004270, 1804042041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (928, 15, 300005161, 1804012041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (930, 15, 300005170, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (931, 15, 1200040000, 1804172040, 2);
INSERT INTO "public"."jogador_inventario" VALUES (932, 15, 1200079000, 1803282040, 2);
INSERT INTO "public"."jogador_inventario" VALUES (934, 15, 1200026000, 1804172040, 2);
INSERT INTO "public"."jogador_inventario" VALUES (936, 15, 1200008000, 1804172041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (937, 15, 1200037000, 1804172041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (938, 15, 1200038000, 1804172041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (926, 15, 601002067, 1803282041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1068, 16, 1200242000, 1803282210, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1069, 15, 1200009000, 1803252210, 2);
INSERT INTO "public"."jogador_inventario" VALUES (939, 15, 904007007, 1803252050, 2);
INSERT INTO "public"."jogador_inventario" VALUES (941, 15, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1007, 16, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1008, 16, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (944, 15, 1103003006, 1804172051, 2);
INSERT INTO "public"."jogador_inventario" VALUES (935, 15, 1200035000, 1805172041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (933, 15, 1200027000, 1805172040, 2);
INSERT INTO "public"."jogador_inventario" VALUES (945, 15, 1102003007, 1803252052, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6417, 148, 200004132, 1804022002, 2);
INSERT INTO "public"."jogador_inventario" VALUES (940, 15, 100003040, 1804172052, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1009, 16, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1013, 16, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2465, 55, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2466, 55, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2467, 55, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (980, 9, 300005188, 9849600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2468, 55, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (950, 9, 1001002033, 1804172053, 2);
INSERT INTO "public"."jogador_inventario" VALUES (951, 9, 1001001034, 1804172053, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2470, 55, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1023, 16, 1001002004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2472, 55, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2474, 55, 1200002000, 1804191659, 2);
INSERT INTO "public"."jogador_inventario" VALUES (960, 9, 300005171, 11318400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1024, 17, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1025, 17, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1026, 17, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1027, 17, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1028, 17, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1029, 17, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1030, 17, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1031, 17, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1032, 17, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1033, 17, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1034, 17, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1035, 17, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1036, 17, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1037, 17, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1038, 17, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2476, 55, 1200026000, 1804191659, 2);
INSERT INTO "public"."jogador_inventario" VALUES (961, 9, 702001143, 15552000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (982, 3, 200004327, 1987200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2478, 55, 1200027000, 1804191659, 2);
INSERT INTO "public"."jogador_inventario" VALUES (983, 3, 300005188, 1382400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (963, 8, 1104003016, 1804172112, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2480, 55, 1200036000, 1804191659, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1131, 15, 100003037, 1803292221, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6419, 143, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2481, 55, 1200038000, 1804191700, 2);
INSERT INTO "public"."jogador_inventario" VALUES (969, 15, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (970, 15, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (971, 15, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (972, 15, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (973, 15, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (962, 8, 1001001017, 1806162111, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2469, 55, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2482, 55, 1301203000, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1039, 16, 1102003003, 1805172208, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2483, 55, 100003264, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (985, 3, 100003299, 1803282131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1088, 16, 300005161, 2505600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1047, 16, 1200044000, 1804172209, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1048, 16, 1200037000, 1804172209, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1043, 16, 601002049, 1804172210, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2484, 55, 1301335000, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1049, 16, 1200038000, 1804172209, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2485, 55, 300005188, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1051, 16, 1200078000, 1804172209, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1052, 16, 1200026000, 1804172209, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2486, 55, 1001002033, 1804191706, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2487, 55, 1001001034, 1804191706, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1055, 16, 1200027000, 1804172210, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2464, 55, 100003221, 1803211720, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1057, 16, 1200035000, 1804172210, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2600, 48, 1103003016, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (646, 9, 300005161, 1806230041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (949, 9, 100003299, 1806131449, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1091, 16, 200004327, 2246400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1101, 16, 100003299, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1078, 16, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1079, 16, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1080, 16, 1300035030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1081, 16, 1300027030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1095, 16, 300005170, 1123200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1085, 17, 1200037000, 1804172212, 2);
INSERT INTO "public"."jogador_inventario" VALUES (975, 3, 400006073, 3801600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (977, 3, 300005170, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1087, 17, 1200038000, 1804172212, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1090, 16, 1200080000, 1804172212, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1071, 16, 400006073, 2332800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (929, 15, 400006073, 1803261517, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1084, 16, 300005188, 3110400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1097, 16, 100003263, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1082, 16, 1103003006, 1804172213, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1021, 16, 1001001003, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1142, 15, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1132, 16, 702001101, 1803282222, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1133, 16, 702015009, 1803282222, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1134, 16, 904007051, 1803282222, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1135, 16, 300005114, 1803282222, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1136, 16, 100003214, 1803282222, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1137, 16, 1001002033, 1804172222, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1138, 16, 1001001034, 1804172222, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1139, 16, 1301085000, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1141, 16, 1200008000, 1804172223, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1165, 14, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1075, 16, 200004292, 2246400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1073, 16, 300005171, 1804132210, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1092, 16, 100003264, 1804210128, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1053, 15, 702015003, 1803262209, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1143, 15, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1146, 17, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1147, 17, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1148, 17, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1149, 17, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2449, 55, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1150, 14, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1151, 14, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1152, 14, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1153, 14, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1154, 14, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1155, 14, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1156, 14, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1157, 14, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1158, 14, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1159, 14, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1160, 14, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1161, 14, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1162, 14, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1163, 14, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1164, 14, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2450, 55, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2451, 55, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1126, 17, 1001002004, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1144, 15, 803007018, 345600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2452, 55, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2453, 55, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2454, 55, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2455, 55, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2456, 55, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2457, 55, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1058, 17, 100003221, 1803222338, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1145, 17, 100003099, 1803222338, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1060, 17, 300005094, 1803222353, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2458, 55, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2459, 55, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2460, 55, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2461, 55, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2462, 55, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2463, 55, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2601, 64, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2602, 64, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2603, 64, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2604, 64, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2605, 64, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2606, 64, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2607, 64, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2608, 64, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2609, 64, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2610, 64, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2611, 64, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2612, 64, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2613, 64, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2614, 64, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2615, 64, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1166, 14, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1167, 14, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2488, 59, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1198, 14, 200004327, 1468800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1195, 14, 400006082, 6998400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1213, 14, 601014011, 1803211604, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1199, 14, 200004325, 1814400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1197, 14, 300005188, 1987200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1177, 14, 1001002004, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1175, 14, 1200037000, 1804172337, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1176, 14, 1200038000, 1804172337, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2489, 59, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1244, 8, 1001001054, 1804180110, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1181, 14, 300005114, 1803282338, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2490, 59, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1183, 14, 1200002000, 1803252338, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2491, 59, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1185, 14, 1200003000, 1803252338, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2492, 59, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1187, 14, 1200027000, 1803252339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2493, 59, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1189, 14, 1200026000, 1803252339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2494, 59, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1191, 14, 1200080000, 1803252339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2495, 59, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1194, 14, 1102003007, 1803252339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1245, 8, 1104003012, 1804180110, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1268, 16, 100003277, 1036800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1273, 8, 300005005, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1290, 23, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1291, 23, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1274, 8, 200004013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1205, 14, 100003263, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1292, 23, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1200, 14, 100003264, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1293, 23, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1206, 14, 100003277, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1204, 14, 300005170, 2851200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1193, 14, 300005161, 1804012340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1178, 14, 1001001003, 93, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1196, 14, 601002100, 1805172340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1275, 8, 1103003003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1180, 14, 100003299, 1123200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1251, 8, 702015001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1277, 8, 1103003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1208, 9, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1294, 23, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1209, 3, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1210, 14, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1211, 14, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1212, 14, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1214, 14, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1215, 16, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1216, 16, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1217, 16, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1218, 16, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1219, 16, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1220, 16, 1001001015, 1804180019, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1221, 16, 1001002016, 1804180019, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1222, 16, 1104003014, 1804180020, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1223, 16, 200004136, 1804180020, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1201, 14, 200004270, 1803260020, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1224, 16, 1300031030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1226, 16, 1200004000, 1804180021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1228, 16, 1200119000, 1804180021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1230, 16, 1200002000, 1804180021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1232, 16, 1200003000, 1804180021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1237, 8, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1239, 16, 300005015, 1804180042, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1240, 16, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1241, 16, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1278, 8, 1103003005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1253, 16, 601002100, 5184000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1254, 8, 300005006, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1255, 8, 601013001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1279, 8, 1103003002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1256, 8, 200004007, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1257, 8, 200004009, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1280, 8, 1103003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1295, 23, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1258, 8, 803007004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1296, 23, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1259, 8, 400006004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1297, 23, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1252, 16, 400006082, 5443200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1260, 8, 904007005, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1262, 8, 200004011, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1298, 23, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1263, 8, 601014001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1264, 8, 601014002, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1265, 8, 300005024, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1299, 23, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1249, 16, 200004325, 1814400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1266, 8, 100003013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1300, 23, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1267, 8, 702001004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1269, 8, 400006003, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1247, 16, 200004270, 1641600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1250, 8, 100003014, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1281, 23, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1282, 23, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1270, 8, 100003036, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1271, 8, 100003015, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1272, 8, 702001007, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1283, 23, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1284, 23, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1285, 23, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1286, 23, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1287, 23, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1288, 23, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1289, 23, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1304, 23, 100003250, 1803200132, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1242, 16, 702001017, 1803250347, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1305, 23, 1200037000, 1804180133, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1306, 23, 1200038000, 1804180133, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1307, 24, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1308, 24, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1309, 24, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1310, 24, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1311, 24, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1312, 24, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1313, 24, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1314, 24, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1315, 24, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1316, 24, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1317, 24, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1318, 24, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1319, 24, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1320, 24, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1321, 24, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1322, 24, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1323, 24, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1324, 24, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1326, 24, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2496, 59, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6420, 143, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1331, 24, 1200037000, 1804180135, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1332, 24, 1200038000, 1804180135, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1333, 24, 300005114, 1803290135, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1334, 24, 601002067, 1803290135, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1440, 27, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1340, 24, 100003264, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1342, 24, 1200008000, 1804180136, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1344, 24, 1200040000, 1804180136, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1346, 24, 1200026000, 1804180136, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1348, 24, 1200027000, 1804180136, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1352, 23, 1001002033, 1803200137, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1353, 23, 1001001034, 1803200137, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1354, 23, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1355, 23, 601002012, 1804180138, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1359, 23, 1200027000, 1804180138, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1360, 23, 1200035000, 1804180138, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1358, 23, 1103003006, 1804180138, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1361, 23, 1102003006, 1803200138, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1363, 23, 1200080000, 1804180138, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1365, 23, 1200026000, 1804180138, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1441, 27, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1442, 27, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1443, 27, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1414, 26, 400006073, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1444, 27, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1415, 26, 400006082, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1445, 27, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1417, 26, 200004327, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1446, 27, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6421, 143, 803007018, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1397, 26, 601002012, 1804180155, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1448, 27, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1370, 26, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1371, 26, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1372, 26, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1373, 26, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1374, 26, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1375, 26, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1376, 26, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1377, 26, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1378, 26, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1379, 26, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1380, 26, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1381, 26, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1382, 26, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1383, 26, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1384, 26, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1385, 26, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1387, 26, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1389, 26, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1396, 26, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1400, 26, 1103003006, 1804180153, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1401, 26, 1200027000, 1804180153, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1402, 26, 1200035000, 1804180153, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1403, 26, 1200037000, 1804180153, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1404, 26, 1200038000, 1804180153, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1406, 26, 1200242000, 1803290153, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1408, 26, 1200008000, 1803260153, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1410, 26, 1200026000, 1803260154, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1413, 26, 300005171, 1803290156, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1468, 25, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1469, 25, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1450, 27, 200004325, 518400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1420, 23, 200004270, 1382400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1416, 26, 100003299, 1803220156, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1421, 23, 100003263, 1803220156, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1419, 23, 300005161, 1803220156, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1452, 27, 100003037, 1804180217, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1423, 24, 300005161, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1424, 24, 200004270, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1425, 27, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1426, 27, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1427, 27, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1428, 27, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1429, 27, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1430, 27, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1431, 27, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1432, 27, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1433, 27, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1434, 27, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1435, 27, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1436, 27, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1437, 27, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1438, 27, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1439, 27, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1455, 27, 1104003014, 1803200218, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1458, 27, 1001001034, 1803200219, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1451, 27, 300005188, 1803220220, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1457, 27, 1001001015, 1803200218, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1460, 27, 1200008000, 1803200220, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1462, 27, 1200044000, 1803200220, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1464, 27, 1200026000, 1803200220, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1369, 9, 601002091, 31104000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1466, 27, 1200035000, 1803200220, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1470, 25, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1467, 25, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1471, 25, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1472, 25, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1473, 25, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1474, 25, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1475, 25, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1476, 25, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1477, 25, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1478, 25, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1349, 24, 1001002004, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1394, 26, 1001002004, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1350, 24, 1001001003, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1336, 24, 1200079000, 1804080135, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1351, 24, 1104003014, 1805180136, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1479, 25, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1480, 25, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1481, 25, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1482, 25, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1483, 25, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1484, 25, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1520, 28, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1521, 28, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6422, 148, 100003150, 1804022007, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2497, 59, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1490, 25, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1491, 25, 1001002004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2498, 59, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1494, 25, 1200079000, 1803290227, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2499, 59, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1496, 25, 1200026000, 1804180227, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2500, 59, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1498, 25, 1200027000, 1804180227, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2501, 59, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1500, 25, 1200040000, 1804180228, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1501, 25, 1200038000, 1804180228, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1502, 25, 1200037000, 1804180228, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1503, 25, 100003037, 1804180229, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1504, 25, 702001012, 1804180229, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1505, 25, 702001014, 1804180229, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2502, 59, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2544, 56, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2545, 56, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2546, 56, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1509, 25, 200004270, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2547, 56, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1510, 25, 100003263, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1511, 25, 100003264, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2548, 56, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1512, 25, 200004292, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2549, 56, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1513, 25, 100003277, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2550, 56, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1515, 25, 400006082, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2551, 56, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1516, 25, 200004325, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1517, 25, 100003299, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1518, 9, 400006053, 1803290239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1519, 9, 400006054, 1803290239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1535, 28, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1536, 28, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1537, 28, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1538, 28, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2552, 56, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2553, 56, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2554, 56, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2555, 56, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1543, 28, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2556, 56, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2557, 56, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2558, 56, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1547, 28, 1001002033, 1804180327, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1548, 28, 1001001034, 1804180327, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1550, 28, 1200026000, 1803260327, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2695, 48, 904007005, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2696, 48, 200004011, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1552, 28, 200004270, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2663, 9, 100003036, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2699, 48, 200004013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1554, 28, 400006073, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2701, 48, 1103003002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1555, 28, 300005170, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1553, 28, 100003277, 3456000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2658, 9, 100003014, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1559, 28, 601002091, 15552000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2659, 9, 100003013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1557, 28, 200004327, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1556, 28, 400006082, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1560, 28, 1200009000, 1803260329, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1551, 28, 100003263, 1803260329, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1558, 28, 300005188, 1803260330, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2660, 9, 702015001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2661, 9, 702001004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2664, 9, 100003015, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2665, 9, 1103003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2666, 9, 300005006, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2667, 9, 300005024, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2668, 9, 601013001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2669, 9, 601014001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2670, 9, 601014002, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2671, 9, 300005005, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2672, 9, 1103003003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2674, 9, 1103003005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2675, 9, 200004007, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2676, 9, 200004009, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2677, 9, 200004011, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6423, 143, 1104003013, 1803242008, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2680, 9, 400006004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2681, 9, 400006003, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2682, 9, 200004013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2683, 9, 1103003002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2684, 9, 1103003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2685, 48, 100003014, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2686, 48, 100003013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2688, 48, 702001004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2689, 48, 100003036, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2690, 48, 100003015, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2691, 48, 1103003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6424, 118, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2692, 48, 803007004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2693, 48, 200004007, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2694, 48, 200004009, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6425, 118, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6426, 118, 702001014, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1522, 28, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1523, 28, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1524, 28, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1525, 28, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1526, 28, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1527, 28, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1528, 28, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1529, 28, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1530, 28, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1531, 28, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1532, 28, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1533, 28, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1534, 28, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1561, 28, 1200037000, 1804180329, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1562, 28, 1200038000, 1804180329, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1563, 28, 601002067, 1803290330, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1564, 28, 702001014, 1803260330, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1565, 31, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1566, 31, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1492, 25, 1001001003, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2679, 9, 904007005, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6418, 143, 100003037, 1803242013, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1395, 26, 1001001003, 93, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1485, 25, 702001122, 1803230307, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1514, 25, 300005170, 1803290307, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1567, 31, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1568, 31, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1569, 31, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1570, 31, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1571, 31, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1572, 31, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1573, 31, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1574, 31, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1575, 31, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1576, 31, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1577, 31, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1578, 31, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1579, 31, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1580, 31, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1581, 31, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1582, 31, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1583, 31, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1584, 31, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1586, 31, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2503, 59, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2504, 59, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1596, 33, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1597, 33, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1598, 33, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1599, 33, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1600, 33, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1601, 33, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1602, 33, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1603, 33, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1604, 33, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1605, 33, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1606, 33, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1607, 33, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1608, 33, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1609, 33, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1610, 33, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1611, 31, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1612, 31, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1613, 31, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1614, 31, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1618, 33, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1620, 33, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1621, 33, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1622, 33, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1623, 33, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1624, 33, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1625, 33, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1626, 33, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1627, 34, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1628, 34, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1629, 34, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1630, 34, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1631, 34, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1632, 34, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1633, 34, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1634, 34, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1635, 34, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1636, 34, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1637, 34, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1638, 34, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1639, 34, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1640, 34, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1641, 34, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1642, 34, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1643, 34, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1644, 34, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1645, 34, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1646, 34, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1650, 34, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6427, 148, 1104003013, 1803242014, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1654, 34, 1200026000, 1804181409, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1656, 34, 1200027000, 1804181409, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1619, 33, 200004161, 1803201425, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1659, 34, 1200035000, 1804181410, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1657, 34, 1200037000, 1805181409, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1664, 34, 1200038000, 1804181411, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1661, 34, 100003214, 1803291411, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1663, 34, 601002067, 1803291411, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1666, 34, 1001001003, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1667, 34, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1668, 34, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1670, 34, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1671, 34, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1674, 34, 702015009, 1803291436, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1685, 31, 702001017, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1680, 34, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6275, 143, 300005171, 1803302016, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1683, 31, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1681, 34, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1684, 31, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1687, 9, 100003214, 1803291450, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1690, 15, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1691, 15, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1692, 15, 702001011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1590, 31, 1001001003, 176, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1695, 31, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1696, 31, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1652, 34, 200004008, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6428, 143, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6429, 143, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6430, 143, 702001011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6447, 144, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2505, 59, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1721, 31, 702001014, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1789, 37, 300005114, 1803291713, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1790, 37, 904007051, 1803291713, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1704, 3, 1301047000, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1707, 15, 100003284, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6448, 144, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1792, 37, 1200040000, 1803201715, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1711, 34, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1712, 34, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1713, 34, 702001011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1686, 31, 803007018, 691200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1705, 15, 100003153, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1716, 9, 200004219, 1804181558, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1717, 9, 200004106, 1804181558, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1719, 31, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1720, 31, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1811, 37, 400006082, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1816, 37, 200004327, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1676, 31, 1200002000, 1804231436, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1689, 31, 1200037000, 1803241458, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1615, 31, 702001021, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6449, 144, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1679, 34, 100003037, 2678400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1682, 34, 803007018, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1660, 34, 1001002033, 1805221640, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1662, 34, 400006053, 1804021649, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1724, 34, 200004327, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1722, 34, 100003264, 3801600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1723, 34, 300005161, 1468800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1589, 31, 1001002004, 190, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1678, 31, 1200003000, 1804231436, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1725, 34, 100003299, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1727, 35, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1728, 35, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1729, 35, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1730, 35, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1731, 35, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1732, 35, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1733, 35, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1734, 35, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1735, 35, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1736, 35, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1737, 35, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1738, 35, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1739, 35, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1740, 35, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1741, 35, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1742, 35, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1743, 35, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1744, 35, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1745, 35, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1746, 35, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1749, 35, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1751, 35, 1103003016, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1752, 37, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1753, 37, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1754, 37, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1755, 37, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1756, 37, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1757, 37, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1758, 37, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1759, 37, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1760, 37, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1761, 37, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1762, 37, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1763, 37, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1764, 37, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1765, 37, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1766, 37, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1767, 37, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1768, 37, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1769, 37, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1770, 37, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1771, 37, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1775, 37, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1776, 37, 1001002018, 1803201702, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1777, 37, 100003214, 1803291702, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1778, 37, 702015009, 1803291702, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1779, 37, 1104003013, 1803201702, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1781, 37, 1200079000, 1803291702, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1795, 37, 300005170, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1796, 37, 400006073, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1783, 37, 200004270, 1123200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1785, 37, 1200026000, 1803201712, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1787, 37, 1200027000, 1803201712, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1788, 37, 601002067, 1803291713, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1798, 9, 1200080000, 1804181723, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1799, 37, 1200037000, 1804181734, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1800, 37, 1200038000, 1804181734, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1802, 37, 1200003000, 1804181734, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1803, 37, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1804, 37, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1805, 37, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1806, 37, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1807, 37, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1808, 9, 1001002018, 1804181738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1810, 9, 1102003007, 1804181738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1817, 37, 400006053, 1803291739, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1794, 37, 300005171, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1814, 37, 200004292, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1815, 37, 100003277, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1832, 37, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1819, 31, 400006017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1821, 31, 702001012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6432, 144, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1823, 37, 1200119000, 1803201751, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1825, 37, 1200004000, 1803201751, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1828, 37, 1200002000, 1803201752, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6433, 144, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1833, 37, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1834, 37, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1835, 37, 803007018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1837, 9, 100003096, 1804181757, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1836, 37, 100003143, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1839, 35, 1300044030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1843, 35, 1001002033, 1804181827, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1844, 35, 1001001034, 1804181827, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1846, 35, 1200079000, 1803291828, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1848, 35, 1200003000, 1804181828, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1850, 35, 1200035000, 1804181828, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1852, 35, 1200027000, 1804181828, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6434, 144, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1855, 35, 1200242000, 1803291829, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6435, 144, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1856, 35, 1200078000, 1804181829, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1857, 35, 1200026000, 1804181829, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1858, 35, 1200038000, 1804181829, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1859, 35, 1200037000, 1804181829, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6436, 144, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1715, 9, 200004010, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1838, 35, 601002049, 1804181829, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1950, 42, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1951, 42, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1862, 35, 400006053, 1803291830, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1863, 35, 400006054, 1803291830, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1864, 35, 601002067, 1803291830, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1865, 35, 200004205, 1803291830, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1860, 35, 300005114, 1804081830, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1861, 35, 100003214, 1804081830, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6437, 144, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6438, 144, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1820, 31, 601002021, 345600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1872, 35, 1301047000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1873, 35, 200004136, 1804181835, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1874, 35, 904007051, 1803291836, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1875, 35, 1102003007, 1804181836, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1876, 35, 1001002067, 1804181836, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1877, 35, 1001001068, 1804181836, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1878, 15, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1879, 15, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1881, 31, 100003054, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1883, 9, 702023004, 1804181912, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1884, 40, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1885, 40, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1886, 40, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1887, 40, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1888, 40, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1697, 31, 702001011, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1871, 35, 200004292, 1804070058, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1867, 35, 200004270, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1869, 35, 300005188, 5875200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1818, 31, 100003285, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (284, 3, 1001001003, 83, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1665, 34, 1001002004, 84, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1726, 34, 300005188, 1804061711, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1889, 40, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1890, 40, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1891, 40, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1892, 40, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1893, 40, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1894, 40, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1895, 40, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1896, 40, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1897, 40, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1898, 40, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1899, 40, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1900, 40, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1901, 40, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1903, 40, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1906, 40, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1907, 40, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1909, 40, 1200026000, 1804182001, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1912, 40, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1916, 40, 1103003006, 1804182001, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1911, 40, 1200027000, 1805182001, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1917, 40, 1200035000, 1804182001, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1918, 40, 1200037000, 1804182002, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1919, 40, 100003214, 1803292002, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1920, 40, 702015003, 1804182002, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1913, 40, 601002012, 1804182002, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1922, 40, 1200079000, 1803292002, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1924, 40, 1200242000, 1803292002, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1926, 40, 1200080000, 1803262002, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1929, 40, 1102003007, 1803262003, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1930, 40, 1200038000, 1804182003, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1902, 40, 702001122, 1803202003, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1934, 40, 1200040000, 1803202006, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6439, 144, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1935, 40, 300005030, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1936, 40, 1001002014, 1803262015, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1937, 40, 1001001017, 1803262015, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1938, 40, 300005121, 1804182016, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1939, 40, 904007051, 1803292023, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1940, 40, 702001101, 1803292023, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1941, 40, 200004219, 1803202026, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1996, 42, 300005188, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1942, 42, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1943, 42, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1944, 42, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1945, 42, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1946, 42, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1947, 42, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1948, 42, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1949, 42, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1952, 42, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1953, 42, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1954, 42, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1955, 42, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1956, 42, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1957, 42, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1958, 42, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1959, 42, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1960, 42, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1965, 42, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1985, 42, 200004292, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1986, 42, 100003277, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1992, 42, 702015008, 1804182042, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1971, 42, 200004325, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1977, 42, 1200035000, 1804182038, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1987, 42, 1200037000, 1804182041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1979, 42, 1200026000, 1804182038, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1972, 42, 200004270, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1973, 42, 1200009000, 1803262037, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1988, 42, 1200038000, 1804182041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1974, 42, 100003263, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1970, 42, 300005161, 1804082041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1982, 42, 1001002004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1975, 42, 601002091, 1809152040, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1984, 42, 400006073, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1989, 40, 400006059, 1803202042, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1991, 40, 702001014, 1803262042, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1990, 42, 300005030, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1928, 40, 1001001003, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1995, 42, 200004327, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2010, 31, 200004075, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1967, 42, 100003299, 1806072040, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1997, 40, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1998, 40, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1999, 40, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2000, 40, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2001, 40, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1932, 40, 1200031000, 1803212005, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2003, 42, 1301085000, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1981, 42, 904007051, 1803292051, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1968, 42, 601002100, 1805182051, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2005, 40, 1200003000, 1803202053, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2007, 40, 1200002000, 1803202053, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2009, 40, 1200017000, 1803202053, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1983, 42, 1001001003, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2011, 31, 702015002, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2013, 9, 1200242000, 1803292118, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1927, 40, 1001002004, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1880, 15, 702001014, 1804192253, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2090, 44, 601013001, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6440, 144, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2112, 44, 1200038000, 1804182209, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2113, 44, 1200037000, 1804182209, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2091, 44, 601014001, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1276, 8, 300005032, 104, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2019, 31, 100003264, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2115, 44, 300005121, 1804182209, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2116, 44, 1300030030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2511, 59, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2056, 44, 1103003006, 1804182212, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2024, 31, 300005171, 1987200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2028, 44, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2029, 44, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2030, 44, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2031, 44, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2032, 44, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2033, 44, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2034, 44, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2035, 44, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2036, 44, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2037, 44, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2038, 44, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2039, 44, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2040, 44, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2041, 44, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2042, 44, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2043, 44, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2044, 44, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2045, 44, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2118, 44, 1300078030, 4, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2103, 44, 200004011, 7, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2055, 44, 1300027030, 4, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2060, 44, 1102003003, 1808162159, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2058, 44, 1300044030, 4, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1994, 34, 300005030, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2046, 44, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2047, 44, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2050, 44, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2053, 44, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2052, 44, 100003040, 1804182159, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2063, 44, 1103003016, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6441, 144, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2105, 44, 400006003, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2165, 31, 100003277, 1806202300, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2066, 44, 100003014, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6442, 144, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2070, 44, 1200242000, 1803292206, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2072, 44, 1200080000, 1804182206, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2074, 44, 1200008000, 1804182206, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2076, 44, 1200003000, 1804182206, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2078, 44, 1200002000, 1804182206, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2080, 44, 1200017000, 1804182206, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2081, 44, 601002018, 1804182207, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2082, 44, 702001009, 1804182207, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2088, 44, 1103003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2089, 44, 300005006, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2092, 44, 601014002, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2093, 44, 300005024, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2096, 44, 1103003003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2098, 44, 1103003005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2099, 44, 200004007, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2100, 44, 200004009, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2102, 44, 400006004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2104, 44, 904007005, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2106, 44, 200004013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2107, 44, 1103003002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2108, 44, 1103003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2109, 44, 1200035000, 1804182208, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2110, 44, 1200078000, 1804182208, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2111, 44, 1200027000, 1804182208, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2120, 15, 904007051, 1803292222, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2122, 44, 1200026000, 1804182222, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2123, 44, 1102003007, 1804182223, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2132, 44, 904007051, 1803292226, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2140, 44, 702001012, 1804182228, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2141, 44, 702001018, 1804182229, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2142, 44, 702001101, 1803292229, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2143, 44, 601002071, 1804182229, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2144, 31, 300005033, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2145, 44, 1001002016, 1804182233, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6443, 144, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2135, 44, 300005170, 6566400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2149, 17, 100003214, 1803292237, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2138, 44, 702015003, 1804182228, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2139, 44, 702001014, 1804182228, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2150, 17, 702015009, 1803292237, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2151, 17, 1104003013, 1804182237, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2152, 17, 601002067, 1803292237, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2153, 17, 300005036, 1804182237, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2199, 45, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2155, 15, 100003285, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2156, 15, 400006017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2157, 15, 601002021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2158, 15, 702001012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2160, 15, 100003052, 1803262243, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2162, 44, 1001001015, 1804182251, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2161, 8, 100003037, 1803202251, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2163, 44, 601002022, 1804182252, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2164, 44, 1104003014, 1804182257, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2025, 31, 400006073, 1728000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2166, 44, 400006059, 1804182307, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2084, 44, 100003013, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2087, 44, 100003015, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2167, 44, 100003094, 1804182312, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2168, 31, 400006018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2170, 31, 1300007007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2101, 44, 803007004, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2051, 44, 100003250, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2512, 59, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2513, 59, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2173, 44, 1200011000, 1804182316, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2176, 44, 1001002014, 1804182324, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2177, 44, 1001002051, 1804182324, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2178, 44, 1001001017, 1804182324, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2179, 44, 200004107, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2731, 48, 100003264, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2021, 31, 100003299, 1123200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2517, 59, 1001002033, 1804192021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2183, 45, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2184, 45, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2185, 45, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2186, 45, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2187, 45, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2188, 45, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2189, 45, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2190, 45, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2191, 45, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2192, 45, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2193, 45, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2194, 45, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2195, 45, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2196, 45, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2197, 45, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2208, 39, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2209, 39, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2210, 39, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2211, 39, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2212, 39, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2213, 39, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2214, 39, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2215, 39, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2216, 39, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2217, 39, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2218, 39, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2219, 39, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2220, 39, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2221, 39, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2222, 39, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2518, 59, 1001001034, 1804192021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2519, 31, 702015001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2520, 59, 300005121, 1804192022, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2065, 31, 300005170, 1804041428, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2137, 44, 400006073, 3542400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2094, 44, 300005005, 7, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2130, 44, 300005188, 4579200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2125, 44, 400006082, 2678400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2154, 17, 300005030, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2134, 44, 200004292, 1805212253, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2136, 44, 100003277, 1805072228, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2127, 44, 300005171, 1805202159, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2027, 31, 200004292, 1804071606, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2086, 44, 100003036, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2131, 44, 100003263, 3196800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2129, 44, 300005161, 1123200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2148, 17, 100003250, 1803222337, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2085, 44, 702001004, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2062, 44, 1001001003, 89, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2095, 44, 702001007, 6, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2733, 48, 100003263, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2526, 59, 100003277, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2506, 59, 702001122, 1803212023, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2527, 59, 1200009000, 1803272023, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2528, 59, 400006073, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2529, 59, 702001143, 15552000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2735, 48, 100003299, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2532, 59, 1200027000, 1804192024, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2533, 59, 1200035000, 1804192024, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2534, 59, 1200038000, 1804192024, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2535, 59, 1200037000, 1804192024, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2516, 59, 1103003006, 1804192024, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2536, 59, 601014006, 1804192025, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2524, 59, 100003263, 1803232025, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2522, 59, 200004327, 1803302040, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2537, 59, 702001014, 1804192041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2538, 59, 904007051, 1803302041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2539, 59, 1301085000, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2540, 59, 300005022, 1804192048, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2541, 59, 1001002014, 1804192049, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2181, 31, 400006082, 1814400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2531, 59, 200004270, 1803302104, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2530, 59, 601002091, 1809162105, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2704, 56, 1200002000, 1804192136, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2706, 56, 1200003000, 1804192136, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2708, 56, 1200008000, 1804192136, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2710, 56, 1200119000, 1804192136, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2712, 56, 1200004000, 1804192136, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6444, 144, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2714, 48, 300005006, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2716, 48, 300005024, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2717, 48, 601014001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2719, 48, 300005005, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2720, 48, 1103003003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2722, 48, 1103003005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6445, 144, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2726, 48, 1103003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6446, 144, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2736, 48, 400006082, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2737, 48, 300005188, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2200, 45, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2201, 45, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2202, 45, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2203, 45, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2204, 45, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2206, 45, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2207, 45, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2223, 39, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2224, 39, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2225, 39, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2226, 39, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2227, 39, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2228, 39, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2229, 39, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2231, 39, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2319, 48, 1200038000, 1804191219, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2235, 39, 100003263, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2236, 39, 200004292, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6482, 149, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2238, 39, 300005161, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6483, 149, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2239, 39, 300005170, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2240, 39, 300005188, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2241, 39, 100003264, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2242, 39, 100003277, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2237, 39, 400006082, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2243, 45, 100003214, 1803300008, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2244, 45, 1001002051, 1803210008, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2245, 45, 1104003014, 1803210008, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2246, 45, 601002049, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2250, 45, 1102003003, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2251, 45, 1200026000, 1804190008, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2252, 45, 1200044000, 1804190008, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2253, 45, 1200078000, 1804190008, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2254, 45, 1200037000, 1804190008, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2255, 9, 100003063, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1393, 26, 100003250, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6484, 149, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6485, 149, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2261, 15, 100003063, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2263, 9, 1200037000, 1804190045, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2264, 26, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2265, 26, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2266, 26, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2267, 26, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2268, 26, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6486, 149, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2271, 44, 300005031, 1804190059, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2274, 8, 100003063, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2275, 3, 100003063, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6487, 149, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6488, 149, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6489, 149, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6490, 149, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6491, 149, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2292, 48, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2293, 48, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2294, 48, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2295, 48, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2296, 48, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2297, 48, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2298, 48, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2299, 48, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2300, 48, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2301, 48, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2302, 48, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2303, 48, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2304, 48, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2305, 48, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2306, 48, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2307, 48, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2308, 48, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2309, 48, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2311, 48, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6492, 149, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6493, 149, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6494, 149, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2325, 48, 1200035000, 1804191220, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2349, 49, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2318, 48, 1200037000, 1804191219, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6495, 149, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2328, 48, 300005114, 1803301221, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6496, 149, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2330, 48, 702001101, 1803301221, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2350, 49, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2351, 49, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2725, 48, 400006003, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2715, 48, 601013001, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2083, 44, 702015001, 8, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2718, 48, 601014002, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2728, 48, 300005171, 1987200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2734, 48, 100003277, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2724, 48, 400006004, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2317, 48, 1001001003, 54, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2732, 48, 300005161, 1803251432, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6451, 144, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2337, 31, 100003023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2343, 48, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2344, 48, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2345, 48, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2346, 48, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2347, 48, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2352, 49, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2348, 48, 400006053, 1803301411, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2338, 31, 400006043, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2353, 49, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2354, 49, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2355, 49, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2356, 49, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2357, 49, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2358, 49, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2359, 49, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2360, 49, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2361, 49, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2362, 49, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2363, 49, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2364, 49, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2365, 49, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2366, 49, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2367, 49, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2368, 49, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2369, 49, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2370, 49, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2372, 49, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6456, 144, 1200037000, 1804222031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6457, 144, 1200038000, 1804222031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2377, 49, 601002049, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2378, 49, 1300044030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2379, 49, 1300026030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2380, 49, 1300078030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2381, 49, 1102003003, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2382, 49, 1001001017, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2415, 14, 1200079000, 1803301546, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2383, 49, 1001002018, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2384, 49, 1300003030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2385, 49, 200004136, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2386, 49, 1104003013, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2387, 49, 601002022, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2388, 49, 702015003, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2389, 49, 904007051, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2390, 49, 1300119030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2391, 49, 1300027030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2392, 49, 1300040030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2393, 49, 300005121, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2395, 49, 1001001003, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2396, 49, 200004132, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2397, 49, 100003150, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2542, 59, 1001001013, 1804192049, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2400, 49, 200004270, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2401, 49, 100003264, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2402, 49, 300005161, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2022, 31, 200004327, 1468800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2403, 49, 400006082, 1468800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2404, 49, 1300035030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2405, 49, 100003037, 1803271524, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2406, 49, 1104003014, 1803211525, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2394, 49, 1001002004, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2407, 14, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2409, 14, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2410, 14, 1300035030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2411, 14, 1300027030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2412, 14, 1103003006, 1804191533, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2413, 14, 702001012, 1804191533, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2408, 14, 100003040, 1804191547, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2416, 14, 1300044030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2418, 14, 1200032000, 1804191546, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2420, 14, 1200017000, 1804191546, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2422, 14, 200004219, 1804191546, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2425, 14, 1102003003, 1804191548, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2426, 14, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2427, 14, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2428, 14, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2429, 14, 803007018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2430, 14, 601002022, 1803271600, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2431, 14, 601002015, 1804191600, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2433, 44, 601002005, 1804191600, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2559, 56, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2560, 56, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2561, 56, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6459, 144, 1200026000, 1804222031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2567, 56, 100003250, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2569, 56, 1200037000, 1804192056, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2570, 56, 1001001034, 1804192057, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2571, 56, 1001002033, 1804192057, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2572, 56, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2578, 56, 1200035000, 1804192058, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2576, 56, 1103003006, 1804192058, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2580, 56, 702001101, 1803302058, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2581, 56, 300005114, 1803302058, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2582, 56, 601002067, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2568, 56, 1200038000, 1805192056, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2587, 56, 1200031000, 1804192102, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2589, 56, 1200026000, 1804192103, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2591, 56, 1200040000, 1804192103, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2592, 59, 200004039, 1804192103, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2593, 59, 200004029, 1804192103, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2594, 59, 300005017, 1804192103, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2595, 48, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2596, 48, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2597, 48, 1300035030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2598, 48, 1300027030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2599, 48, 1103003006, 1804192104, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2616, 64, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2617, 64, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2618, 64, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2620, 64, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2624, 64, 100003250, 1803212116, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2619, 64, 702001122, 1803212116, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2625, 64, 1200037000, 1804192117, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2626, 64, 1200038000, 1804192117, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2627, 64, 1001002004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2629, 64, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2630, 64, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2635, 64, 1300044030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2638, 64, 1102003003, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2640, 64, 1200080000, 1804192117, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2642, 64, 1200040000, 1804192118, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2644, 64, 1200079000, 1803302118, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2579, 56, 100003037, 1804202058, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2421, 44, 100003284, 94, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2573, 56, 601002012, 1804222058, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2316, 48, 1001002004, 55, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6463, 144, 1200080000, 1804222031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2577, 56, 1200027000, 1804222058, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6455, 144, 100003155, 1803302032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6461, 144, 1200027000, 1806212031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6465, 144, 100003264, 1804022044, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2423, 44, 100003153, 88, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2646, 64, 300005171, 1803232118, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2634, 64, 601002049, 1804192118, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2633, 64, 1103003006, 1804192118, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2647, 64, 1200027000, 1804192118, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2648, 64, 1200026000, 1804192118, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2649, 64, 1200035000, 1804192118, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2650, 64, 1200078000, 1804192118, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2651, 64, 200004292, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2628, 64, 1001001003, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2652, 31, 200018013, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2653, 31, 1300027003, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2827, 35, 100003299, 8899200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2740, 31, 1301052000, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1703, 3, 1001002004, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6468, 144, 1001001068, 1804222031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2843, 35, 702001041, 1804200131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2741, 35, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2742, 35, 100003014, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2743, 35, 100003013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2744, 35, 702015001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2745, 35, 702001004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2746, 35, 100003036, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2747, 35, 100003015, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2748, 35, 1103003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2826, 35, 200004327, 4060800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2749, 35, 1103003010, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2750, 35, 702001007, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2751, 35, 300005006, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2752, 35, 300005024, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2754, 35, 601014001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2755, 35, 601014002, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2756, 35, 300005005, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2757, 35, 1103003003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2759, 35, 1103003005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2760, 35, 803007004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2761, 35, 200004007, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2762, 35, 200004009, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2763, 35, 400006004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2764, 35, 200004011, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2765, 35, 904007005, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2766, 35, 400006003, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2767, 35, 200004013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2768, 35, 1103003002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2769, 35, 1103003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2832, 24, 1103003016, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6469, 144, 1001002053, 1804222031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2773, 35, 1200080000, 1804200010, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2774, 56, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2775, 56, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2776, 56, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2778, 56, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2780, 35, 702023009, 1, 0);
INSERT INTO "public"."jogador_inventario" VALUES (2781, 35, 702001060, 1, 0);
INSERT INTO "public"."jogador_inventario" VALUES (2782, 35, 300005088, 1, 0);
INSERT INTO "public"."jogador_inventario" VALUES (2784, 35, 100003112, 1, 0);
INSERT INTO "public"."jogador_inventario" VALUES (2785, 69, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2786, 69, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2787, 69, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2788, 69, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2789, 69, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2790, 69, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2791, 69, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2792, 69, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2793, 69, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2794, 69, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2795, 69, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2796, 69, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2797, 69, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2798, 69, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2799, 69, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2800, 69, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2801, 69, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2802, 69, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2803, 69, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2804, 69, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2808, 69, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2783, 48, 100003111, 1803281620, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2809, 35, 100003189, 1, 0);
INSERT INTO "public"."jogador_inventario" VALUES (2810, 15, 100003183, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6467, 144, 200004292, 1803302044, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2753, 35, 601013001, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6474, 144, 1103003006, 1805222032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2813, 35, 1200040000, 1804200040, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6471, 144, 601002012, 1805222032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2815, 15, 1200007000, 1803220040, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2833, 24, 100003111, 1803302244, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2840, 35, 300005030, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2758, 35, 300005032, 104, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2779, 56, 702001021, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2842, 35, 400006059, 1805200131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2820, 35, 100003264, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2834, 35, 200018007, 1804200131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2828, 35, 601002100, 5184000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2835, 35, 200018013, 1804200131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2836, 35, 200018011, 1804200131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2837, 35, 200004026, 1804200131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2838, 35, 200004010, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2821, 35, 400006073, 518400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2823, 35, 100003277, 1468800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2839, 35, 200004219, 1804200131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2830, 35, 300005170, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2841, 35, 300005121, 1804200131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2822, 35, 200004325, 4320000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2844, 35, 702015003, 1804200131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2829, 35, 400006082, 2937600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2845, 35, 702001017, 1804200131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2846, 35, 702015008, 1804200131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2847, 35, 702001018, 1804200131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2848, 35, 702001014, 1804200131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2849, 35, 702001009, 1804200132, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2850, 24, 904007051, 1803310200, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2851, 24, 300005015, 1804200200, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2853, 24, 1200031000, 1804200202, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2854, 53, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2855, 53, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2856, 53, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2857, 53, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2858, 53, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2859, 53, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2860, 53, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2861, 53, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2862, 53, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2863, 53, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2864, 53, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2865, 53, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2866, 53, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2867, 53, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (1127, 17, 1001001003, 93, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2819, 17, 100003063, 1803282342, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2868, 53, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2912, 52, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2913, 52, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2914, 52, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2915, 52, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2916, 52, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2917, 52, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2918, 52, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2919, 52, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2920, 52, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2921, 52, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2922, 52, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2923, 52, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2924, 52, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2925, 52, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2926, 52, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6475, 31, 200004007, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6476, 31, 200004009, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6479, 144, 1200035000, 1805222032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6470, 144, 100003040, 1805222032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6478, 144, 100003263, 1803302032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6477, 144, 300005171, 1803292032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6450, 144, 702001122, 1803242032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6480, 143, 200004010, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2869, 53, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2870, 53, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2871, 53, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2872, 53, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6481, 144, 702015003, 1803302037, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6499, 143, 300005188, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6498, 143, 200004325, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2878, 53, 1200037000, 1804200212, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2879, 53, 1200009000, 1803280212, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2880, 53, 1200038000, 1804200212, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2881, 53, 1001002053, 1804200213, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2882, 53, 1001001054, 1804200213, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2883, 53, 1104003012, 1804200213, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6500, 143, 200004327, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2885, 53, 1200026000, 1804200213, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6501, 144, 1001002004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2887, 53, 1200080000, 1804200213, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6502, 143, 1200003000, 1803242044, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2889, 53, 1200035000, 1804200214, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2977, 52, 100003150, 1803310328, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2891, 53, 200004325, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2955, 52, 100003263, 1804110328, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6504, 143, 702001012, 1803242044, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2956, 52, 100003264, 2419200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2877, 53, 100003155, 1803280215, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2896, 53, 601002071, 1804200215, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2897, 53, 702015003, 1804200216, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6506, 149, 200004161, 1803250054, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2899, 53, 300005036, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6505, 149, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6507, 149, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2948, 52, 400006082, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2947, 52, 300005161, 2073600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2957, 52, 1200037000, 1804200308, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6508, 149, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2959, 52, 1200038000, 1804200308, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2902, 53, 702015012, 15552000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6509, 149, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2941, 52, 200004327, 777600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2904, 53, 100003299, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2905, 53, 200004327, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6503, 144, 1001001003, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2911, 53, 904007007, 1803280238, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2942, 52, 100003299, 3024000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2901, 53, 300005170, 1468800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2895, 53, 100003277, 3456000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2903, 53, 300005161, 518400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2893, 53, 100003263, 4579200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2927, 52, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2928, 52, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2929, 52, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2930, 52, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2935, 52, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2973, 52, 1104003014, 1803291301, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2721, 48, 300005032, 104, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2943, 52, 300005188, 2332800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2949, 52, 200004325, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2972, 52, 1200079000, 1803310312, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2945, 52, 300005171, 1804180313, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2974, 52, 702015003, 1803280314, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2975, 52, 904007007, 1803280314, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2976, 52, 601002067, 1803310314, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2978, 52, 300005114, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2979, 52, 200004075, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2982, 52, 1200242000, 1803310316, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2983, 9, 100003183, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2953, 52, 100003277, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3008, 57, 702015008, 1804200328, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2984, 57, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2950, 52, 200004292, 1728000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2985, 57, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2951, 52, 400006073, 1814400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2952, 52, 300005170, 1123200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2986, 57, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2987, 57, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2988, 57, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2989, 57, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2990, 57, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2991, 57, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2992, 57, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2993, 57, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2994, 57, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2995, 57, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3024, 57, 1200037000, 1803280329, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2996, 57, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2997, 57, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2998, 57, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2999, 57, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3010, 57, 1200079000, 1803310329, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2954, 52, 200004270, 1036800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3000, 57, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3001, 57, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3002, 57, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3003, 57, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3004, 57, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3005, 57, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3012, 57, 1200002000, 1803280329, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3014, 57, 1200003000, 1803280329, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3016, 57, 1200008000, 1803280329, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3018, 57, 1200004000, 1803280329, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3020, 57, 1200119000, 1803280329, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3022, 57, 1200038000, 1803280329, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3026, 57, 1200011000, 1803280329, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3028, 57, 1200036000, 1803280330, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3030, 57, 1200035000, 1803280330, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3032, 57, 1200026000, 1803280330, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3034, 57, 1200027000, 1803280330, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3036, 57, 1200080000, 1803280330, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3038, 57, 1200040000, 1803280330, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3042, 57, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3043, 57, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3044, 57, 1300035030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3045, 57, 1300027030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3047, 57, 1001001034, 1803280331, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3048, 57, 1001002033, 1803280331, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3049, 57, 1102003007, 1803280331, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3046, 57, 1103003006, 1804200331, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3007, 57, 100003155, 1803280331, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3050, 57, 200004270, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3052, 57, 300005171, 518400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3054, 57, 200004327, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3051, 57, 300005161, 2419200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3053, 57, 200004292, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3056, 57, 300005188, 1803240333, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3055, 57, 100003299, 1803280336, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3068, 73, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6513, 149, 100003155, 1803302049, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6515, 149, 1200026000, 1804222049, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3059, 57, 300005170, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6516, 149, 1001001054, 1804222050, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3060, 57, 100003277, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6517, 149, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3066, 52, 601002017, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3083, 73, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3084, 73, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3085, 73, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3086, 73, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3087, 73, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6518, 149, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6519, 149, 1300035030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6522, 149, 1200037000, 1804222051, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6523, 149, 1200038000, 1804222051, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6524, 149, 1200027000, 1804222051, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6521, 149, 1103003006, 1804222051, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3095, 73, 300005170, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2673, 9, 300005032, 86, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3098, 73, 100003264, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3093, 73, 300005161, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3099, 73, 300005171, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3100, 73, 200004325, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3097, 73, 300005188, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3104, 73, 1200242000, 1803310452, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3106, 73, 1200080000, 1803280452, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3108, 73, 1200008000, 1803280452, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3110, 73, 1200035000, 1803280452, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3115, 73, 1301085000, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3118, 73, 1200040000, 1803280454, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3091, 73, 100003155, 1803280455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3102, 73, 1001001068, 1804200455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3101, 73, 1001002051, 1804200455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3119, 73, 1200026000, 1803280455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3120, 73, 1200011000, 1803280455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3121, 73, 1200017000, 1803280455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3122, 73, 1200044000, 1803280455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3123, 73, 1200038000, 1804200455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3124, 73, 1200037000, 1804200455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3125, 73, 1200027000, 1803280455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3126, 73, 702001101, 1803310455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3127, 73, 904007051, 1803310455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3128, 73, 601002067, 1803310455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3129, 73, 702015008, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3130, 73, 1104003012, 1803280456, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3131, 31, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3132, 31, 601002049, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3133, 31, 1300044030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3136, 31, 1102003003, 1804201520, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2678, 9, 803007004, 8, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3067, 52, 601002002, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3065, 52, 400006005, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3061, 52, 100003284, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3062, 52, 100003153, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3063, 52, 200004134, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3064, 52, 200004010, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3069, 73, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3070, 73, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3071, 73, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3072, 73, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3073, 73, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3074, 73, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3075, 73, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3076, 73, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3077, 73, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3078, 73, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3079, 73, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3080, 73, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3081, 73, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3082, 73, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3137, 76, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3138, 76, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3139, 76, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3140, 76, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3141, 76, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3142, 76, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3143, 76, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3144, 76, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3145, 76, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3146, 76, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3147, 76, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3148, 76, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3149, 76, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3150, 76, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3151, 76, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3152, 76, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3153, 76, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3154, 76, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6525, 119, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6526, 119, 200004010, 94, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3160, 76, 100003155, 1803281018, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3155, 76, 702001122, 1803221018, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3161, 3, 100003183, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3162, 76, 1001002053, 1803281020, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3163, 76, 1001001054, 1803281020, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3164, 76, 1104003012, 1803281020, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3165, 76, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3166, 76, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6529, 149, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3169, 76, 1103003006, 1804201021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3170, 76, 1200027000, 1804201021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3171, 76, 1200037000, 1804201021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3172, 76, 1200035000, 1804201021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3173, 76, 1200038000, 1804201021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3174, 76, 1200009000, 1803281021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3175, 76, 601014006, 1803281022, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6530, 149, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3177, 76, 1200026000, 1803281022, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6531, 149, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3179, 76, 1200040000, 1803281023, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6532, 149, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3181, 76, 1200036000, 1803281023, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6533, 149, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3200, 76, 200004292, 1804041054, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3183, 76, 200004270, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3184, 71, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3185, 71, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3186, 71, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3187, 71, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3188, 71, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3189, 71, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3190, 71, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3191, 71, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3192, 71, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3193, 71, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3194, 71, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3195, 71, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3196, 71, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3197, 71, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3198, 71, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6534, 119, 1105003004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6535, 119, 1200038000, 1804222115, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3246, 78, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3203, 71, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3204, 71, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3205, 71, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3206, 71, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3207, 71, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6536, 119, 702015003, 1803242116, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6527, 119, 300005030, 90, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3211, 71, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3212, 71, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3202, 76, 200004325, 1123200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3221, 76, 400006073, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3247, 78, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3248, 78, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3249, 78, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3250, 78, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3223, 76, 702015003, 1803281033, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3224, 76, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3225, 76, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3226, 76, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3227, 76, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3228, 76, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3231, 76, 100003264, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3251, 78, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3235, 76, 1200017000, 1803281110, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3236, 76, 400006053, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3237, 76, 702001101, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3252, 78, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3220, 76, 300005161, 1803311033, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3219, 76, 100003263, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3253, 78, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3238, 76, 300005170, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3233, 76, 300005171, 5443200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3254, 78, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3222, 76, 300005188, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3239, 76, 100003299, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3240, 78, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3241, 78, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3242, 78, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3243, 78, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3244, 78, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3245, 78, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3255, 78, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3256, 78, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3257, 78, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3258, 78, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3263, 78, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3271, 78, 300005171, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3269, 78, 200004325, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3265, 78, 1001001068, 1803281153, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3272, 78, 400006073, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3216, 71, 1103003006, 1804220136, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3264, 78, 1001002018, 1803281154, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3266, 78, 1104003009, 1803281154, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3268, 78, 400006082, 1803311209, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3213, 71, 601002012, 1804220137, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3359, 79, 400006053, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3360, 79, 200004132, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6538, 149, 1001002033, 1804222130, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3364, 79, 100003150, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3275, 78, 100003264, 1468800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3274, 78, 200004270, 1468800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3278, 78, 300005170, 5184000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3280, 78, 200004292, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3277, 78, 200004327, 1804041153, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3281, 78, 1200009000, 1803281154, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3282, 78, 1200037000, 1804201154, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3283, 78, 1200038000, 1804201154, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3284, 78, 702001101, 1803311154, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3285, 78, 904007051, 1803311154, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3286, 78, 601002013, 1804201155, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6541, 119, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6540, 119, 1001001003, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6542, 119, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3292, 78, 1200028000, 1804201156, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3293, 78, 1200027000, 1804201156, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3294, 78, 1200044000, 1804201156, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3295, 78, 1200078000, 1804201156, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3291, 78, 1102003003, 1804201156, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6544, 119, 803007018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3297, 78, 1200080000, 1804201157, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6545, 107, 100003054, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3299, 78, 1200026000, 1804201157, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3300, 78, 1001002053, 1803221157, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3301, 78, 1001001054, 1803221157, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3276, 78, 300005188, 1803241209, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3279, 78, 100003277, 1803241210, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3302, 78, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3303, 78, 400006059, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3305, 78, 702015008, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3306, 78, 702023004, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3307, 78, 702015003, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3308, 78, 702001014, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3309, 78, 702015002, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3310, 78, 1001001003, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3311, 78, 1001002004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3304, 78, 601002071, 1803281235, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3313, 53, 702023004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2898, 53, 200004134, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3378, 56, 702001017, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6546, 107, 300005132, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6547, 82, 1301085000, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6539, 119, 1001002004, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6548, 9, 100003184, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3321, 79, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3322, 79, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3323, 79, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3324, 79, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3325, 79, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3326, 79, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3327, 79, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3328, 79, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3329, 79, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3330, 79, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3331, 79, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3332, 79, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3333, 79, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3334, 79, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3335, 79, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6553, 149, 1200002000, 1803302222, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6550, 135, 1001002051, 1804222228, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2900, 53, 300005030, 95, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6551, 135, 904007051, 1804022230, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6543, 119, 702001017, 1803242253, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3338, 79, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3339, 79, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3341, 79, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6537, 31, 100003153, 697, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3345, 79, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3391, 75, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3346, 79, 1200037000, 1804201331, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3347, 79, 1200038000, 1804201331, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3337, 79, 100003221, 1803221331, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3392, 75, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3340, 79, 702001122, 1803221404, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3371, 79, 1200017000, 1803221404, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3351, 31, 300005014, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3352, 31, 200004032, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3393, 75, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3394, 75, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3353, 31, 1200026000, 1804201351, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3354, 79, 300005114, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3356, 79, 702001101, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3395, 75, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3396, 75, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3397, 75, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3398, 75, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3372, 79, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3373, 79, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3374, 79, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3375, 79, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3376, 79, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3350, 79, 1105003004, 91, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3399, 75, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3377, 56, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3380, 56, 200004132, 1803311428, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3382, 79, 1200026000, 1803221429, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3355, 79, 601002067, 1803311430, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3349, 79, 1001001003, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3379, 56, 803007018, 691200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3409, 75, 100003037, 1803291452, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3385, 75, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3386, 75, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3387, 75, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3388, 75, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3389, 75, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3390, 75, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3400, 75, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3401, 75, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3403, 75, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3408, 75, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3336, 48, 300005170, 1468800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3312, 53, 200004010, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3410, 75, 200004132, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3411, 75, 300005036, 1803281452, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3412, 75, 200004075, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3413, 75, 200004219, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3414, 75, 601014006, 1803281453, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3415, 75, 702023002, 1803281453, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3416, 75, 1001002051, 1803281454, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3417, 75, 1001001068, 1803281454, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3418, 75, 1104003004, 1803281455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3348, 79, 1001002004, 93, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3424, 75, 300005188, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3422, 75, 200004292, 6048000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3420, 75, 300005161, 777600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3383, 79, 300005030, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3426, 75, 1200017000, 1803281455, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6555, 149, 1200003000, 1803302223, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3429, 75, 300005170, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3430, 75, 100003277, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3432, 75, 1200038000, 1804201456, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3433, 75, 1200037000, 1804201457, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3435, 75, 1200026000, 1803281458, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3437, 75, 1200027000, 1803281458, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3439, 75, 1200080000, 1803281458, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3440, 44, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3441, 56, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3442, 56, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3444, 44, 100003037, 1804201530, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3445, 48, 601002067, 1803311551, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3446, 75, 1001002033, 1803281557, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3447, 75, 1001001034, 1803281558, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3448, 75, 1104003012, 1803281558, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6560, 135, 1300044030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6556, 135, 200004132, 1804022230, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3443, 56, 702001011, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3512, 82, 702015003, 1803281711, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3513, 83, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3431, 75, 200004270, 1468800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3514, 83, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3515, 83, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3516, 83, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3451, 75, 200004327, 5702400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3456, 75, 702015008, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3457, 75, 702015003, 1803281604, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3458, 75, 702001014, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3459, 75, 904007010, 1803281604, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3455, 75, 601002100, 1805201605, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3454, 75, 300005171, 1803281605, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3460, 75, 300005023, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3517, 83, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (2061, 44, 1001002004, 78, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3428, 75, 400006082, 1803241631, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3511, 82, 300005030, 95, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3461, 75, 300005030, 89, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3463, 82, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3464, 82, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3465, 82, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3466, 82, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3467, 82, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3468, 82, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3469, 82, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3470, 82, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3471, 82, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3472, 82, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3473, 82, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3474, 82, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3475, 82, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3476, 82, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3477, 82, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3478, 82, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3479, 82, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3480, 82, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3487, 82, 1200009000, 1803281645, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3489, 82, 1200038000, 1804201645, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3539, 82, 200004010, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3491, 82, 1200026000, 1804201646, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3492, 82, 1001001034, 1804201646, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3493, 82, 1001002014, 1804201646, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3494, 82, 1104003014, 1804201646, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3495, 82, 100003040, 1804201647, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3496, 82, 601002067, 1803311647, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3497, 82, 904007051, 1803311647, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3498, 82, 1001002033, 1804201648, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3499, 82, 1105003004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3500, 31, 400006015, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3501, 82, 100003174, 1804201656, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3486, 82, 100003155, 1803281705, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3503, 82, 1200040000, 1804201706, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3505, 82, 1200027000, 1804201706, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3506, 82, 1104003012, 1803281706, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3507, 82, 702015008, 1803281707, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3508, 56, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3509, 56, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3518, 83, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3519, 83, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3520, 83, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3521, 83, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3522, 83, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3523, 83, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3524, 83, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3525, 83, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3526, 83, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3527, 83, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3528, 83, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3529, 83, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3530, 83, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3531, 83, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3533, 83, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3534, 83, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3536, 83, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3537, 83, 300005114, 1803311714, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3538, 83, 601002067, 1803311714, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3540, 82, 400006012, 1803281715, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3541, 82, 702001101, 1803311715, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3551, 84, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3543, 82, 1200036000, 1803281722, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3544, 84, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3545, 84, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3546, 84, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3547, 84, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3548, 84, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3549, 84, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3550, 84, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3552, 84, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3553, 84, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3554, 84, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3555, 84, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3556, 84, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3557, 84, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3558, 84, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3559, 84, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3560, 84, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3561, 84, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3563, 84, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3564, 84, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3565, 84, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3567, 84, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3568, 63, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3569, 63, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3570, 63, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3571, 63, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3562, 84, 702001122, 1803221742, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3427, 31, 1001001015, 1803261456, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3572, 63, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3573, 63, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3574, 63, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3575, 63, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3576, 63, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3577, 63, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3578, 63, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3579, 63, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3580, 63, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3581, 63, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3582, 63, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3583, 84, 100003064, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3584, 63, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3585, 63, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3586, 63, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6563, 82, 100003048, 1803302228, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6549, 135, 1001001068, 1804222228, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6557, 135, 1102003007, 1804222229, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6564, 135, 1200080000, 1804222229, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3593, 84, 200004075, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3595, 84, 300005036, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3596, 84, 702001041, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3597, 84, 702001014, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3598, 84, 702015003, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3599, 84, 702015008, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6565, 135, 1200036000, 1804222229, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6566, 135, 1200026000, 1804222229, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3650, 63, 1200030000, 1804201808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6567, 135, 1200079000, 1804022229, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3652, 63, 1200002000, 1804201808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6568, 135, 904007007, 1804222230, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3654, 63, 1200003000, 1804201808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3605, 84, 300005171, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6570, 135, 1200040000, 1804222231, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3656, 63, 1200242000, 1803311808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3657, 63, 1001002033, 1804201808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3609, 84, 100003263, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3658, 63, 1001001034, 1803281809, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3659, 31, 1200078000, 1804201820, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3660, 87, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3661, 87, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3662, 87, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3663, 87, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3664, 87, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3665, 87, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3666, 87, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3667, 87, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3601, 84, 200004270, 1641600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3668, 87, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3610, 84, 100003264, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3602, 84, 300005161, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3669, 87, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3670, 87, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3671, 87, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3672, 87, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3673, 87, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3674, 87, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3675, 87, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3612, 84, 100003299, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3676, 87, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3677, 87, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6571, 149, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3613, 84, 200004325, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3679, 87, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6572, 149, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3614, 84, 400006082, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3616, 84, 1001002067, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3617, 84, 1104003014, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3607, 84, 200004327, 1382400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3684, 87, 1200037000, 1804201854, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3685, 87, 1200038000, 1804201854, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3611, 84, 300005170, 1728000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3604, 84, 100003277, 1728000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3707, 87, 200004327, 1803260328, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3621, 84, 601002091, 15552000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3608, 84, 300005188, 777600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3624, 84, 1300027007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3615, 84, 1001002051, 1804210426, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3683, 87, 100003155, 1803281857, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3748, 44, 100003299, 1036800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3627, 84, 1001001003, 95, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3629, 84, 100003037, 1803231745, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3630, 63, 300005114, 1803311806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3631, 63, 601002067, 1803311806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3633, 63, 1200080000, 1804201807, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3635, 63, 1200027000, 1804201807, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3637, 63, 1200026000, 1804201807, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3639, 63, 1200036000, 1804201807, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3641, 63, 1200035000, 1804201807, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3643, 63, 1200040000, 1804201808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3645, 63, 1200011000, 1804201808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3647, 63, 1200008000, 1804201808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3687, 87, 100003264, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3693, 87, 1001001034, 1804201855, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3694, 87, 1001002033, 1804201855, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3696, 87, 200004292, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3689, 87, 601002012, 1804201858, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3704, 87, 1200035000, 1804201858, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3699, 87, 300005170, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3692, 87, 1103003006, 1804201856, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3706, 87, 601002100, 1805201859, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3719, 83, 1200027000, 1804201859, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3698, 87, 400006082, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3701, 87, 300005188, 1805231859, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3709, 83, 1200079000, 1803311859, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3711, 83, 1200008000, 1804201859, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3712, 87, 904007051, 1803311859, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3715, 87, 1200242000, 1803311859, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3716, 83, 1200031000, 1804201859, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3726, 83, 1001002033, 1804201900, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3703, 87, 200004270, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3721, 83, 1200026000, 1804201859, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3723, 83, 1200040000, 1804201900, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3727, 83, 1001001034, 1804201900, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3702, 87, 300005161, 1804111857, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3737, 83, 300005170, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3725, 83, 400006073, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3728, 83, 100003037, 1804201900, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3730, 83, 702015003, 1804201901, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3731, 87, 601002071, 1804201901, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3732, 83, 702001012, 1804201901, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3733, 83, 200004075, 1804201901, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3734, 83, 200004219, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3735, 83, 300005030, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3736, 83, 300005121, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3738, 83, 200004292, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3739, 83, 1200009000, 1803281910, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3742, 83, 300005188, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3741, 83, 100003299, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3743, 83, 200004327, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3688, 87, 100003040, 1804210101, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3747, 44, 200004325, 1123200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3746, 44, 200004327, 1804081538, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3760, 90, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3587, 63, 702001122, 1803222247, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3618, 84, 1104003012, 1803230320, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3729, 83, 601002017, 94, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3628, 84, 601002017, 90, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3626, 84, 1001002004, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3594, 84, 300005030, 95, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3700, 87, 200004325, 1803260328, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3751, 56, 1102003007, 1803282013, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3753, 56, 400006017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3754, 56, 601002021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3755, 56, 702001012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3756, 44, 1001001068, 1804202031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6575, 119, 1001001034, 1803242239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6576, 119, 1001002033, 1803242239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6577, 69, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6578, 69, 702015003, 1803242240, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6594, 24, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6595, 153, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6596, 153, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6597, 153, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6598, 153, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6600, 153, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6601, 153, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6602, 153, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6604, 24, 200004325, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6605, 24, 100003299, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6606, 56, 300005014, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6607, 56, 200004032, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6608, 153, 1001002067, 1803302247, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6609, 153, 1001001017, 1803302247, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6610, 153, 200004026, 1804222248, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6612, 153, 702001017, 1804222249, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6614, 153, 1200079000, 1804022249, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6615, 153, 1300030030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6631, 152, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6632, 152, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6633, 152, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6635, 152, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6639, 152, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6642, 56, 803007006, 1804222253, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6643, 152, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6687, 149, 1001001003, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6659, 152, 100003263, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6660, 152, 100003264, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6661, 152, 200004270, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6689, 153, 300005114, 1804022326, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6662, 152, 100003277, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6663, 152, 300005171, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6664, 152, 200004292, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6665, 152, 400006082, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6668, 152, 1200242000, 1804022256, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6669, 152, 1200044000, 1804222256, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6670, 152, 1200040000, 1804222256, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6671, 152, 1200038000, 1804222256, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6672, 152, 1200037000, 1804222256, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6673, 152, 1200035000, 1804222256, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6674, 152, 1200031000, 1804222256, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6675, 152, 1200027000, 1804222256, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6676, 152, 1200026000, 1804222256, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6641, 152, 1001001034, 1804222257, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6640, 152, 1001002033, 1804222257, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6647, 152, 1103003006, 1804222257, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6644, 152, 601002012, 1804222257, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6634, 152, 702001122, 1803242257, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6658, 152, 702015003, 1804222257, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6656, 152, 300005121, 1804222257, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6666, 152, 100003299, 1803262257, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6679, 142, 702015003, 1803242258, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6681, 135, 1200242000, 1804022304, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6682, 69, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6683, 69, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6685, 35, 100003147, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6686, 149, 300005114, 1804022313, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1842, 35, 1102003003, 1804222315, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6688, 135, 1001001054, 1804222322, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6667, 152, 200004325, 1803270032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3752, 56, 100003285, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6684, 69, 702001011, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6603, 153, 100003155, 1803310124, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6657, 152, 702001014, 1804232257, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6678, 152, 200004010, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6574, 149, 803007018, 518400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6677, 152, 100003153, 95, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6611, 153, 601002017, 90, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6573, 149, 702001017, 1803250345, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6579, 153, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3775, 90, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3776, 90, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3777, 90, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6580, 153, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3780, 90, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3781, 90, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6581, 153, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3784, 90, 1200009000, 1803282111, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6582, 153, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6583, 153, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3785, 90, 300005114, 1803312112, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3786, 90, 601002067, 1803312112, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3787, 90, 100003037, 1804202112, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3788, 90, 300005121, 1804202112, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6584, 153, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6585, 153, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3794, 90, 1001002004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3789, 90, 100003040, 1804202113, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3783, 90, 100003155, 1803282113, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3796, 90, 200004219, 1804202113, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3790, 90, 601002012, 1804202113, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3797, 90, 702015003, 1804202113, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3793, 90, 1103003006, 1804202113, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3798, 90, 1200027000, 1804202113, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3799, 90, 1200035000, 1804202113, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3795, 90, 1001001003, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3800, 90, 100003052, 1804202124, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3801, 90, 100003096, 1804202124, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3802, 90, 200004029, 1804202124, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3803, 90, 200004136, 1804202125, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3804, 90, 1001001017, 1804202125, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3805, 44, 200004029, 1804202125, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3806, 44, 200004219, 1804202125, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3807, 90, 1001002018, 1803222125, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6586, 153, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3809, 90, 1200079000, 1803312125, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6587, 153, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6588, 153, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3817, 90, 300005161, 1804102131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3811, 90, 400006073, 1804062131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3778, 90, 702001122, 1803222131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6589, 153, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6590, 153, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6591, 153, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6592, 153, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6593, 153, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6616, 152, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6617, 152, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6618, 152, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3759, 56, 1301085000, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3758, 44, 1301085000, 94, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6619, 152, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6620, 152, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6621, 152, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6622, 152, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6623, 152, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3819, 90, 1200008000, 1804202128, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6624, 152, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3821, 90, 1200003000, 1804202128, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6625, 152, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6626, 152, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6627, 152, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6628, 152, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6629, 152, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6630, 152, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3812, 90, 200004292, 1804072126, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3761, 90, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3762, 90, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3763, 90, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3764, 90, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3765, 90, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3766, 90, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3767, 90, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3768, 90, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3769, 90, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3770, 90, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3771, 90, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3772, 90, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3773, 90, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3774, 90, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3823, 90, 1200002000, 1804202128, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3825, 90, 1200080000, 1804202129, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6690, 107, 1001001015, 1803242336, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3827, 90, 1200026000, 1804202129, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3829, 90, 1200040000, 1804202129, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6691, 107, 1001002012, 1803242336, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6692, 107, 200004136, 1803242336, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6693, 107, 1102003007, 1803242337, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6694, 107, 200004075, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6695, 107, 702015002, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3908, 88, 1200079000, 1803312214, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6697, 149, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3834, 90, 100003263, 1804072131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3837, 90, 100003277, 1804032131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3833, 90, 100003264, 1804112131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3841, 90, 100003299, 1803282131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3832, 90, 200004270, 1804042131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3830, 90, 200004327, 1807032131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3839, 90, 200004325, 1804032131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3844, 44, 200004270, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3836, 90, 300005170, 1803312131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3838, 90, 300005171, 1804042131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3842, 90, 300005188, 1803282131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3840, 90, 400006082, 1804032131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3835, 90, 702001143, 1809172131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3831, 90, 601002100, 1806192131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3845, 90, 1001001034, 1804202132, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3846, 90, 1001002033, 1804202132, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3592, 63, 100003155, 1803282137, 2);
INSERT INTO "public"."jogador_inventario" VALUES (238, 3, 300005032, 104, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3847, 90, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3848, 90, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3849, 90, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3850, 90, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3851, 90, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3852, 56, 100003054, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3853, 56, 300005132, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6737, 155, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3855, 90, 100003284, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3856, 90, 100003153, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6696, 149, 200004026, 1803252359, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3861, 90, 1200036000, 1804202150, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3911, 88, 1001002004, 186, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3864, 88, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3865, 88, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3866, 88, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3867, 88, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3868, 88, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3869, 88, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3870, 88, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3871, 88, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3872, 88, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3873, 88, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3874, 88, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3875, 88, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3876, 88, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3877, 88, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3878, 88, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3879, 88, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3880, 88, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3881, 88, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3882, 88, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3888, 88, 1200037000, 1804202213, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3889, 88, 1200038000, 1804202213, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3891, 88, 1200003000, 1804202213, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3893, 88, 1200002000, 1804202213, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3942, 92, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3887, 88, 100003155, 1803282224, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3914, 88, 300005114, 1803312215, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3915, 88, 601002067, 1803312215, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3943, 92, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3926, 88, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3919, 88, 100003264, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3927, 88, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3920, 88, 200004292, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3928, 88, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3929, 88, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3922, 88, 300005161, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3930, 88, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3923, 88, 300005171, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3924, 88, 300005170, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3944, 92, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3925, 88, 400006082, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3921, 88, 200004325, 518400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3945, 92, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3946, 92, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3931, 63, 1200009000, 1803282248, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3932, 63, 1200037000, 1804202248, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3933, 63, 1200038000, 1804202248, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3934, 63, 1102003003, 1803222249, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3901, 88, 1200035000, 1805212213, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3935, 92, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3936, 92, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3937, 92, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3938, 92, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3939, 92, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3940, 92, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3941, 92, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3947, 92, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3948, 92, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3949, 92, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3950, 92, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3951, 92, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3952, 92, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3953, 92, 702001122, 1803222256, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3958, 92, 100003155, 1803282257, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3960, 92, 1200037000, 1804202257, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3961, 92, 1200038000, 1804202257, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3962, 88, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3963, 88, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3964, 88, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3903, 88, 601002012, 5184000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3906, 88, 1103003006, 1805211832, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3897, 88, 1200027000, 1804212213, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3912, 88, 1001001003, 193, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3895, 88, 1200026000, 1804212213, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3905, 88, 1300027030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3966, 92, 702015003, 1803222301, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6699, 149, 1001002051, 1803302349, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6700, 149, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6701, 149, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3971, 92, 300005022, 1803222302, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6702, 149, 702001014, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6703, 130, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3974, 92, 1001001034, 1803222302, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3975, 92, 1001002053, 1803222302, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6705, 130, 803007018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3902, 88, 100003040, 5184000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3977, 92, 300005017, 1803222308, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3978, 88, 1300044030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6707, 56, 1001001015, 1803242357, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4059, 17, 300005031, 1804202352, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4060, 17, 300005015, 1804202352, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6708, 130, 1001002051, 1803242357, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3984, 92, 1200031000, 1803222312, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3986, 92, 1200035000, 1803222312, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6709, 56, 1001002016, 1803242357, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3988, 92, 1200026000, 1803222313, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3989, 17, 1103003010, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (3990, 17, 1103003016, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6710, 56, 1104003012, 1803242357, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6711, 130, 1104003014, 1803242358, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3994, 17, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3995, 17, 702001011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6706, 130, 1001002067, 1803242358, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3998, 92, 1200027000, 1803222336, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3999, 44, 1102003006, 1804202337, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3993, 17, 200004026, 1803222338, 2);
INSERT INTO "public"."jogador_inventario" VALUES (1059, 17, 200004161, 1803222338, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6704, 130, 702001017, 1803242358, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4003, 17, 1200242000, 1803312339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6712, 107, 1200031000, 1803242359, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4005, 17, 1200002000, 1804202339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4007, 17, 1200003000, 1804202339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6713, 130, 904007010, 1803302359, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4010, 17, 1200008000, 1804202339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4012, 17, 1200044000, 1804202339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (3981, 92, 200004327, 1804032339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4001, 92, 200004219, 1803222339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4014, 17, 1200032000, 1804202339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4016, 17, 1200040000, 1804202340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4018, 17, 1200035000, 1804202340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4020, 17, 1200026000, 1804202340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4022, 17, 1200027000, 1804202340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4024, 17, 1200080000, 1804202340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4000, 92, 300005121, 1803222340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4025, 17, 904007051, 1803312340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4026, 17, 100003014, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4027, 17, 702015001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4028, 17, 300005006, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4029, 17, 601013001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4030, 17, 200004007, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4031, 17, 200004009, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4032, 17, 803007004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4033, 17, 400006004, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4034, 17, 100003013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4036, 17, 300005024, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4037, 17, 601014001, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4038, 17, 601014002, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4039, 17, 200004011, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4041, 17, 400006003, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4042, 17, 100003036, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4043, 17, 100003015, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4045, 17, 300005005, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4046, 17, 200004013, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4047, 17, 1103003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4048, 17, 1103003003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4050, 17, 1103003005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4051, 17, 1103003002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4052, 17, 1103003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4053, 17, 1001002053, 1804202343, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4054, 17, 1001001054, 1804202343, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4049, 17, 300005032, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4035, 17, 702001004, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4044, 17, 702001007, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4055, 92, 702001014, 1803222352, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4056, 92, 702001017, 1803222352, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4057, 17, 1300079010, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4058, 17, 300005020, 1804202352, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4061, 17, 300005121, 1804202353, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4083, 17, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4065, 17, 200004327, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4084, 17, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4066, 17, 400006082, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4067, 17, 100003299, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4085, 17, 702001014, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3996, 17, 803007018, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4069, 17, 100003277, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4086, 92, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4087, 92, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4071, 17, 100003263, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4072, 17, 200004270, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4070, 17, 300005170, 1803242353, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4068, 17, 300005171, 1803282353, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4073, 17, 702001101, 1803312354, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4074, 17, 702001041, 1804202354, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4075, 17, 702001018, 1804202354, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4040, 17, 904007005, 9, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4076, 9, 702001101, 1804010002, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4077, 56, 200004075, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4078, 56, 702015002, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4079, 88, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4080, 88, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4088, 92, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4089, 92, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4090, 92, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4093, 44, 702015008, 1804210012, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4094, 44, 702001041, 1804210012, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4096, 92, 1200008000, 1803230018, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4097, 26, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4098, 26, 702001009, 1803230021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4100, 26, 100003037, 1803230035, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4101, 87, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4103, 87, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4104, 87, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4105, 87, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4107, 87, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4108, 83, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4110, 83, 1200003000, 1803290101, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4114, 56, 300005033, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4115, 52, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4116, 47, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4117, 47, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4111, 31, 601002012, 2851200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4112, 31, 1001001036, 1803251450, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4081, 88, 702001011, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (3965, 88, 803007018, 432000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4118, 47, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4119, 47, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4120, 47, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4121, 47, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4122, 47, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4123, 47, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4124, 47, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4125, 47, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4126, 47, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4127, 47, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4128, 47, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4129, 47, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4130, 47, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4131, 47, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4132, 47, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4133, 47, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4134, 47, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4266, 9, 1301085000, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6714, 155, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6715, 155, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6716, 155, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4140, 47, 1200009000, 1803290238, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4141, 47, 702015008, 1804210239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4143, 47, 1200044000, 1804210239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4145, 47, 1200026000, 1804210239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4147, 47, 1200027000, 1804210240, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4149, 47, 1200040000, 1804210240, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4151, 47, 1200031000, 1804210240, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4166, 47, 601002017, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4165, 47, 400006005, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4206, 9, 100003147, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4158, 47, 1001002033, 1804210240, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4159, 47, 1001001034, 1804210240, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4160, 47, 1102003007, 1804210241, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4161, 47, 100003037, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4167, 47, 200004026, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4207, 96, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4208, 96, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4209, 96, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4210, 96, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4211, 96, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4171, 47, 200004325, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4153, 47, 100003277, 1804010243, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4157, 47, 100003299, 1803280243, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4168, 47, 100003263, 1803250243, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4139, 47, 100003155, 1803290243, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4170, 47, 200004292, 1803290243, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4155, 47, 200004270, 1803290243, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4169, 47, 300005161, 1803250243, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4172, 47, 702001014, 1804210244, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4177, 47, 200004134, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4212, 96, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4164, 47, 300005030, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4178, 25, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4179, 25, 1200009000, 1803290302, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4181, 47, 1200008000, 1803290302, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4173, 47, 702001018, 1803230303, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4174, 47, 702001041, 1803230303, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4176, 47, 702015003, 1803230303, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4175, 47, 702023002, 1803230303, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4182, 79, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4183, 63, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4184, 25, 601002071, 1803230307, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4186, 48, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4185, 25, 100003284, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4163, 47, 200004010, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4162, 47, 100003153, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4188, 84, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4189, 25, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4190, 25, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4191, 25, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4192, 25, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4193, 25, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4194, 25, 200004219, 1803230319, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4195, 25, 1104003014, 1803230319, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4200, 79, 1001001054, 1803230320, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4201, 79, 1104003012, 1803230320, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4203, 47, 1200035000, 1803290320, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4204, 47, 1200037000, 1804210321, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4205, 47, 1200038000, 1804210321, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4213, 96, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4214, 96, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4215, 96, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4216, 96, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4217, 96, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4218, 96, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4219, 96, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4220, 96, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4221, 96, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4222, 96, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4223, 96, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4233, 96, 1102003007, 1804210340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4235, 96, 1200027000, 1804210340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4237, 96, 1200026000, 1804210340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4240, 84, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4241, 84, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4242, 84, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4243, 84, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4244, 84, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4246, 96, 1200031000, 1804210341, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4248, 96, 1200040000, 1804210341, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4239, 96, 1200079000, 1804210341, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4252, 96, 400006073, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4254, 96, 100003263, 1804010346, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4271, 96, 702001018, 1803290346, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4224, 96, 300005094, 1803240147, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4260, 79, 1001002018, 1803230343, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4261, 9, 1300031030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4263, 84, 1200035000, 1803230343, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4262, 96, 601002067, 1804010343, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4265, 9, 1200017000, 1804210343, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4268, 84, 1200040000, 1803290343, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4267, 96, 702015003, 1804210343, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4278, 96, 1200008000, 1804210344, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4231, 96, 1001002004, 92, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4230, 96, 100003155, 1803290346, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4272, 96, 702023002, 1803290347, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4258, 96, 100003153, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4225, 96, 702001122, 1803230402, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4259, 96, 300005030, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4302, 98, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4256, 96, 200004325, 1803290420, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4270, 96, 702001014, 1803300346, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4303, 98, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4304, 98, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4305, 98, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4306, 98, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4307, 98, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4257, 96, 100003037, 1804220342, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4232, 96, 1001001003, 93, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4275, 96, 702001009, 1803290344, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6717, 155, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4276, 96, 904007010, 1804210346, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4274, 96, 702001041, 1803290346, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4292, 84, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4273, 84, 702001017, 1803240344, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4293, 84, 803007018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4294, 84, 1200026000, 1803290426, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4295, 96, 1001001068, 1803230426, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4296, 96, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4297, 96, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4299, 96, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4300, 96, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6718, 155, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4301, 96, 702001012, 1803240440, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4317, 98, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4319, 98, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4321, 98, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4322, 98, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4323, 98, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6719, 155, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4325, 98, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4326, 98, 1001002004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4327, 98, 1001001003, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4328, 98, 1104003013, 1804210805, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6720, 155, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4330, 98, 1200027000, 1804210806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6721, 155, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4332, 98, 1200026000, 1804210806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4333, 98, 300005114, 1804010807, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4334, 98, 601002067, 1804010807, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4335, 98, 702001101, 1804010807, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4336, 98, 400006053, 1804010807, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4337, 98, 904007051, 1804010807, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4338, 98, 200004132, 1804010807, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4339, 98, 1001001034, 1804210807, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4340, 98, 1001002053, 1804210808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6722, 155, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4342, 98, 1200242000, 1804010808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6723, 155, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4344, 98, 1200080000, 1804210808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6724, 155, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4346, 98, 1200032000, 1804210808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6725, 155, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4348, 98, 1200040000, 1804210808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6726, 155, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4350, 98, 1200008000, 1804210808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6727, 155, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4352, 98, 1200035000, 1804210808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6728, 155, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4354, 98, 1200079000, 1804010808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4357, 98, 601002017, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4320, 98, 702001122, 1803230810, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4355, 98, 100003048, 1804210823, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4356, 98, 702015003, 1804210823, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4318, 98, 200004161, 1803230823, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4298, 96, 400006038, 1803240147, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6746, 157, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6747, 157, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6748, 157, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6749, 157, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6750, 157, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6751, 157, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6752, 157, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6753, 157, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6754, 157, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6755, 157, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6756, 157, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6757, 157, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6758, 157, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6759, 157, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6760, 157, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6781, 158, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6782, 158, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6783, 158, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6784, 158, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6785, 158, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6786, 158, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6787, 158, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6788, 158, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6789, 158, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6790, 158, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6791, 158, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6792, 158, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6793, 158, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6794, 158, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6795, 158, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6823, 159, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6824, 159, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6825, 159, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6826, 159, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6827, 159, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6828, 159, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6829, 159, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6830, 159, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6831, 159, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6832, 159, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6833, 159, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6834, 159, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6835, 159, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6836, 159, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6837, 159, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4280, 96, 1200035000, 1804210344, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4281, 96, 300005114, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4282, 96, 200004219, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4269, 96, 702015008, 1804210346, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6739, 9, 1001001015, 1804230003, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4288, 96, 200004270, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4290, 96, 1200038000, 1804210347, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4291, 96, 1200037000, 1804210347, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4289, 96, 100003277, 1803250347, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4286, 96, 100003299, 1804080347, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4287, 96, 200004327, 1803290348, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4285, 96, 300005188, 1803250402, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4283, 96, 200004136, 1803240131, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6740, 9, 1001002012, 1804230003, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6741, 9, 200004136, 1804230003, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6742, 16, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6743, 16, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6744, 16, 702001011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6761, 157, 100003221, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6762, 157, 200004161, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6763, 157, 300005094, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6764, 157, 702001122, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6765, 157, 1300009007, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6766, 157, 1300038030, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6767, 157, 1300037030, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6768, 157, 1301117000, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6769, 157, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6770, 107, 300005033, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6773, 149, 601002021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6774, 149, 702001012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6775, 44, 1103003010, 1, 0);
INSERT INTO "public"."jogador_inventario" VALUES (6776, 31, 100003184, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6777, 16, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6778, 16, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6780, 69, 100003183, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6796, 69, 1001002067, 1803250029, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6805, 69, 1104003013, 1803250029, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6806, 158, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6807, 152, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6812, 158, 1102003003, 1804230032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6813, 152, 1104003012, 1803250032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6814, 158, 1200028000, 1804230032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6815, 158, 1200027000, 1804230032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6816, 158, 1200078000, 1804230032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6817, 158, 1200044000, 1804230032, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6818, 31, 100003143, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6772, 149, 400006017, 1803250040, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6771, 149, 100003285, 1803250049, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6779, 16, 702001014, 1803250347, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4308, 98, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4309, 98, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4310, 98, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4311, 98, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4312, 98, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4313, 98, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4314, 98, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4315, 98, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4316, 98, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4358, 99, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4359, 99, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4360, 99, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4361, 99, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4362, 99, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4363, 99, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4364, 99, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4365, 99, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4366, 99, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4367, 99, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4368, 99, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4369, 99, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4370, 99, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4371, 99, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4372, 99, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4373, 99, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4374, 99, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4375, 99, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4376, 99, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4377, 99, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4378, 99, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4379, 99, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6738, 16, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4381, 99, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4382, 99, 1300079010, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4386, 99, 1300003030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4387, 99, 1300002030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4388, 99, 1300026030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4389, 99, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4390, 99, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4391, 99, 1300035030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4392, 99, 1300027030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4394, 99, 1300031030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4395, 99, 200004134, 300, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4396, 99, 300005121, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4397, 99, 1001002018, 1803230828, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4398, 99, 1001001017, 1803230828, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4399, 99, 1102003007, 1803230828, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4401, 99, 1200027000, 1803230828, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4403, 99, 1200026000, 1803230828, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4405, 99, 1200080000, 1803230828, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4407, 99, 1200040000, 1803230828, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4409, 99, 1200035000, 1803230828, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4411, 99, 1200031000, 1803230829, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4412, 99, 1300044030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4414, 99, 1200044000, 1803230829, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4415, 99, 1300040030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4416, 99, 100003037, 1803230830, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4478, 13, 200004136, 1804211238, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4445, 13, 200004325, 1814400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4418, 99, 200004327, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4419, 99, 300005170, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4420, 99, 200004270, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4450, 13, 1200242000, 1804011237, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4421, 99, 100003299, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4422, 99, 200004292, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4417, 99, 300005161, 5443200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4423, 99, 100003277, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4424, 99, 200004325, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4425, 99, 200004039, 1803230843, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4426, 99, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4393, 99, 1103003006, 1804210856, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4427, 88, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4428, 17, 100003183, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4429, 56, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4430, 31, 100003183, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4431, 56, 400006018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4432, 56, 702001041, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4434, 13, 1103003010, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4435, 13, 1103003016, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4436, 13, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4437, 13, 1001002033, 1804211236, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4438, 13, 1001001034, 1804211237, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4439, 13, 100003150, 1804011237, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4452, 13, 1200079000, 1804011237, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4454, 13, 1200002000, 1804211237, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4456, 13, 1200003000, 1804211237, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4458, 13, 1200008000, 1804211237, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4460, 13, 1200119000, 1804211238, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4462, 13, 1200004000, 1804211238, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4465, 13, 1200031000, 1804211238, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4467, 13, 1200017000, 1804211238, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4471, 13, 1200040000, 1804211238, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4475, 13, 1200026000, 1804211238, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4477, 13, 1200080000, 1804211238, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4479, 13, 200004075, 1804211239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4480, 13, 200004219, 1804211239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4481, 13, 601002067, 1804011239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4482, 13, 702015003, 1804211239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4483, 13, 702001018, 1804211239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4484, 13, 702001014, 1804211239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4485, 13, 803007006, 1804211239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4486, 13, 904007051, 1804011239, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4487, 13, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4488, 13, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4491, 13, 1103003006, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4493, 13, 100003277, 1806041241, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4463, 13, 1200038000, 1805211238, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4494, 13, 1200037000, 1804211240, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4469, 13, 1200035000, 1805211238, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4473, 13, 1200027000, 1805211238, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4495, 13, 100003264, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4448, 13, 200004270, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4496, 13, 200004292, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4446, 13, 400006073, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4443, 13, 300005170, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4498, 13, 400006082, 2419200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4504, 13, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4497, 13, 300005171, 6048000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4499, 13, 200004327, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4500, 13, 1001002051, 1804211241, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4501, 13, 1001002067, 1804211241, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4502, 13, 1001001068, 1804211241, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4503, 13, 1102003007, 1804211242, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4492, 13, 300005161, 1804011242, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4505, 13, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4506, 13, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4507, 13, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4508, 13, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4509, 31, 601002005, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4447, 13, 300005188, 1804121242, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4441, 13, 100003263, 1123200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4510, 52, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4511, 52, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4512, 52, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4513, 52, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4514, 52, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4515, 13, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4516, 13, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4517, 13, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4520, 48, 1200026000, 1803231331, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4523, 48, 1200027000, 1803231343, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4526, 56, 1200007000, 1803291355, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6820, 158, 1001002004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6821, 56, 100003147, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6819, 158, 1001001003, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4532, 48, 1200080000, 1803231356, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6822, 152, 1001002016, 1803250035, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4538, 48, 1200032000, 1803231410, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4539, 44, 100003183, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4536, 31, 1200080000, 1803301357, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4518, 13, 803007018, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (2097, 44, 300005032, 186, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4540, 56, 702015003, 1804211429, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4561, 56, 400006043, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4589, 31, 1001002018, 518400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4591, 44, 1301047000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6838, 107, 400006018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4543, 31, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6839, 107, 702001041, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4625, 104, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4548, 56, 200004327, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4546, 31, 1103003006, 1804211432, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6840, 107, 1300007007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6841, 152, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6842, 152, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4552, 75, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4553, 75, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4554, 75, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4555, 75, 1300035030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4556, 75, 1300027030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4557, 75, 1103003006, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6843, 152, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4559, 75, 200018013, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4560, 56, 100003023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6844, 152, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4626, 104, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4564, 56, 200004325, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4627, 104, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4628, 104, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4566, 44, 1300028030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4567, 44, 1200028000, 1804211527, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4562, 44, 1300079010, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4568, 44, 1200079000, 1804011527, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4565, 56, 100003299, 1803251532, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4570, 44, 1104003012, 1804211533, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4629, 104, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4630, 104, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4631, 104, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4632, 104, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4633, 104, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4634, 104, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4635, 104, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4636, 104, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4637, 104, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4638, 104, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4639, 104, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4640, 75, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4641, 75, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4642, 75, 803007018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4643, 106, 400006053, 1804011650, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4644, 106, 601002067, 1804011650, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4575, 63, 1001001017, 1803231558, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4577, 88, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4578, 88, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4579, 88, 702001014, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4580, 92, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4581, 34, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4582, 75, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4583, 75, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4584, 75, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4585, 75, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4586, 75, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4576, 63, 200004134, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4587, 92, 1001001013, 1803231619, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4588, 31, 601014006, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4590, 35, 100003183, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4593, 92, 1200011000, 1803231631, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4594, 88, 100003285, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4596, 88, 601002021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4597, 88, 702001012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4598, 56, 200004136, 1803291637, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4600, 31, 1200079000, 1804011639, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4573, 88, 200004134, 200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4601, 106, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4602, 106, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4603, 106, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4604, 106, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4605, 106, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4606, 106, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4607, 106, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4608, 106, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4609, 106, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4610, 106, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4611, 106, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4612, 106, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4613, 106, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4614, 106, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4615, 106, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4616, 106, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4617, 106, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4618, 106, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4619, 106, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4620, 106, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4621, 106, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4622, 106, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4624, 106, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4645, 106, 702015002, 1803231650, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4646, 104, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4647, 104, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4648, 104, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4649, 104, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4650, 104, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4651, 104, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4652, 104, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4653, 104, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4654, 106, 904007007, 1803231650, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4655, 104, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4656, 106, 1300003030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4657, 106, 1300002030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4658, 106, 1300028030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4664, 106, 1200026000, 1803231651, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4667, 106, 1200027000, 1803231651, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4665, 104, 300005036, 1803231651, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4669, 106, 1200040000, 1803231651, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4670, 104, 1001002053, 1803231651, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4672, 106, 1200035000, 1803231651, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4673, 104, 1001001054, 1803231651, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4675, 106, 1200079000, 1804011651, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4677, 104, 1200026000, 1803231652, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4678, 106, 1001001015, 1803231652, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4679, 106, 1001002016, 1803231652, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4680, 106, 1104003013, 1803231652, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4682, 106, 1200003000, 1803231653, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4684, 106, 1200037000, 1803231653, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4687, 106, 1200031000, 1803231653, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4688, 63, 300005030, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4690, 106, 1200002000, 1803231653, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4698, 107, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4660, 106, 1300027030, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4661, 106, 1300078030, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4662, 106, 1102003003, 5184000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4595, 88, 400006017, 1803231911, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4691, 104, 702001018, 1803231653, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4693, 104, 803007018, 1803231653, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4694, 63, 601002017, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4695, 104, 904007007, 1803231653, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6845, 152, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4697, 106, 1200008000, 1803231654, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4721, 107, 100003155, 1803291702, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4692, 63, 300005072, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6855, 135, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6864, 152, 200004136, 1803250040, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6867, 159, 1200026000, 1803310041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6868, 159, 1200027000, 1803310041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6869, 159, 1200035000, 1803310041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6870, 159, 1200036000, 1803310041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6871, 159, 1200040000, 1803310041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6863, 159, 702015003, 1803310041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6901, 9, 100003095, 1804230054, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6902, 9, 100003094, 1804230054, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6903, 9, 601002071, 1804230054, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6904, 9, 702001041, 1804230054, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6907, 159, 200004136, 1803310055, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6908, 149, 200004136, 1803250055, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6909, 159, 1001001015, 1803310055, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6910, 110, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6905, 9, 904007003, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6924, 159, 702001009, 1803250114, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6854, 159, 100003155, 1803310116, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6925, 31, 1001002035, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6926, 31, 702001025, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6927, 107, 100003023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6928, 107, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6929, 107, 400006043, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6930, 110, 300005033, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6934, 126, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6935, 69, 200004075, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6936, 69, 702015002, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6937, 126, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6938, 126, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6939, 126, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6940, 126, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6941, 126, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6862, 159, 100003037, 1804010041, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6942, 159, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6943, 159, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6949, 153, 200004136, 1803310134, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6950, 153, 1104003012, 1804230134, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6944, 159, 803007018, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6906, 130, 100003111, 1803310154, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4699, 107, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4700, 107, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4701, 107, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4702, 107, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4703, 107, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4704, 107, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4705, 107, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4706, 107, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4707, 107, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4708, 107, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4709, 107, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4710, 107, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4711, 107, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4712, 107, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4685, 104, 601002007, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4187, 63, 100003153, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4713, 107, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4714, 107, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4715, 107, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4717, 107, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6857, 31, 904007051, 1804030039, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6873, 69, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6874, 69, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6876, 31, 1200242000, 1804030042, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6856, 159, 1001001003, 93, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6884, 149, 100003054, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4725, 107, 1200037000, 1804211702, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4726, 107, 1200038000, 1804211702, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6877, 152, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6878, 152, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6879, 152, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6881, 152, 400006008, 1803250043, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6882, 152, 400006006, 1803250043, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6883, 159, 300005114, 1804030043, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4824, 110, 702001021, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4739, 106, 100003064, 1803231705, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4740, 106, 200004136, 1803231706, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6885, 149, 300005132, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6872, 159, 601002017, 85, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4742, 63, 702001009, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4743, 63, 702001012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4744, 63, 702015003, 1803231709, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4745, 106, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4746, 106, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4747, 106, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4748, 106, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4749, 106, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6858, 159, 1001002004, 93, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4752, 110, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4753, 110, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4754, 110, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4755, 110, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4756, 110, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4757, 110, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4758, 110, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4759, 110, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4760, 110, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4761, 110, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4762, 110, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4763, 110, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4764, 110, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4765, 110, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4766, 110, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4769, 110, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4770, 110, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4772, 110, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4777, 110, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4778, 107, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4783, 110, 1200009000, 1803291712, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4784, 107, 1200035000, 1804211712, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4736, 107, 1200027000, 1804221703, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4782, 107, 1103003006, 1804211712, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4803, 106, 1200080000, 1803231714, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4785, 110, 1300026030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4786, 110, 1200026000, 1804211712, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4788, 110, 1001002053, 1804211713, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4789, 110, 1001001054, 1804211713, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4790, 110, 1104003014, 1804211713, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4791, 110, 702001101, 1804011713, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4793, 110, 400006008, 1804211714, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4795, 110, 702015003, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4797, 106, 1200004000, 1803231714, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4799, 106, 1200119000, 1803231714, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4801, 106, 1200038000, 1803231714, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4792, 110, 300005015, 1804211715, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4849, 109, 300005094, 1803240501, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4806, 110, 1200079000, 1804011716, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4807, 110, 1300030030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4808, 106, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4809, 106, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4810, 106, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4811, 106, 803007018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4812, 106, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4813, 106, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4814, 106, 1300035030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4815, 106, 1103003006, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4817, 110, 200004219, 1804211730, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4818, 56, 1200079000, 1804011730, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4819, 106, 300005036, 1803231730, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4779, 107, 601002012, 1804211732, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4820, 110, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4821, 110, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4822, 110, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4823, 110, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4825, 106, 601002049, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4659, 106, 1300044030, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4826, 106, 1300026030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4827, 48, 1300044001, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4829, 48, 1200079000, 1804011748, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4831, 48, 1200040000, 1803231749, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4832, 109, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4833, 109, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4834, 109, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4835, 109, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4836, 109, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4837, 109, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4838, 109, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4839, 109, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4840, 109, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4841, 109, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4842, 109, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4843, 109, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4844, 109, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4845, 109, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4846, 109, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4847, 109, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4850, 109, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4851, 109, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4857, 111, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4804, 110, 100003037, 1804221716, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6891, 152, 1001001015, 1803250045, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6892, 69, 1001001068, 1803250048, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4794, 110, 400006059, 1804211753, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4856, 109, 100003048, 1804211754, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4872, 109, 300005114, 1804011754, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4873, 109, 601002067, 1804011754, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4874, 109, 702001101, 1804011754, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4876, 111, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4877, 111, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4878, 111, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4879, 111, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4880, 111, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6893, 9, 100003159, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6894, 152, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6895, 152, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4884, 111, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4886, 109, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4931, 69, 1001002004, 191, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4929, 69, 1001001003, 296, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4890, 109, 1001001015, 1804211755, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4891, 109, 1104003012, 1804211756, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4978, 107, 702001021, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4893, 109, 1200003000, 1804211756, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4894, 111, 300005114, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4939, 69, 200004292, 1804100034, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4896, 109, 1200008000, 1804211757, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4885, 109, 100003040, 1804211757, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4897, 111, 100003064, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4899, 107, 300005114, 1804011758, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4945, 69, 702001014, 1804221805, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4901, 111, 200004004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4902, 111, 200004075, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4903, 111, 200004043, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4904, 111, 300005036, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4905, 111, 400006059, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4906, 69, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6698, 149, 702001011, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6886, 16, 100003285, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6887, 16, 400006017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6888, 16, 601002021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6889, 16, 702001012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4913, 111, 601013004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (1243, 16, 803007018, 345600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6890, 69, 904007051, 1804030045, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4917, 111, 702001018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6896, 152, 702001011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6897, 69, 100003285, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6898, 69, 400006017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6899, 69, 601002021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6880, 152, 803007018, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4926, 69, 1001002033, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4927, 69, 1001001034, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4930, 111, 1001002051, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4932, 111, 1001001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4955, 69, 1200002000, 1804211806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4933, 69, 200004270, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4956, 69, 1200003000, 1804211806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4935, 111, 1104003015, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4957, 69, 1200008000, 1804211806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4958, 69, 1200026000, 1804211806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4959, 69, 1200027000, 1804211806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4960, 69, 1200031000, 1804211806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5021, 109, 1200080000, 1804211832, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4961, 69, 1200035000, 1804211806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4962, 69, 1200037000, 1804211806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4963, 69, 1200038000, 1804211806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6900, 69, 702001012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4938, 69, 100003277, 2073600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4965, 69, 1200080000, 1804211806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4966, 69, 1200242000, 1804011806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2662, 9, 702001007, 5, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4942, 111, 1105003004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6911, 56, 400006015, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4941, 111, 1104003014, 1803231809, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6912, 69, 100003054, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6913, 69, 300005132, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6914, 159, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5022, 88, 1102003007, 1803291832, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4951, 111, 200004325, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4967, 69, 1200040000, 1804211806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4952, 69, 300005171, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6915, 159, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4953, 69, 400006073, 6048000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6916, 159, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6917, 159, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4937, 69, 100003263, 1804081806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4969, 69, 1200079000, 1804011806, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6918, 159, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4889, 109, 1103003006, 1804211920, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4855, 109, 100003155, 1803291920, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5000, 46, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5001, 46, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5002, 46, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4944, 111, 300005171, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4971, 111, 200004292, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5003, 46, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4972, 111, 100003299, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4973, 111, 200004327, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4947, 111, 100003264, 1804041808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4908, 111, 601014004, 1803231808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4920, 111, 702015008, 1803231808, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4974, 107, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4975, 107, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4976, 107, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4977, 107, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4928, 111, 1001002016, 1803231809, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4925, 111, 1001001015, 1803231809, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5004, 46, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6920, 69, 702015012, 1809200105, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5008, 46, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5009, 46, 1200037000, 1804211816, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5010, 46, 1200038000, 1804211816, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6922, 152, 1200008000, 1804230105, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4898, 111, 100003284, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6932, 35, 100003184, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6946, 159, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6933, 153, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5013, 69, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5014, 69, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5015, 69, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5016, 69, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5017, 69, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4940, 69, 300005170, 1382400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6947, 159, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4923, 111, 904007003, 95, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6948, 159, 702001011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4936, 69, 300005161, 1808021805, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4900, 111, 100003053, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4875, 109, 803007008, 71, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4948, 69, 601002018, 1804221805, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5011, 107, 400006017, 1803241820, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4858, 111, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4859, 111, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4860, 111, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4861, 111, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4862, 111, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4863, 111, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4864, 111, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4865, 111, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4866, 111, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4867, 111, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4868, 111, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4869, 111, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4870, 111, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4871, 111, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4979, 111, 1200026000, 1803231809, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4980, 111, 1200027000, 1803231809, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4981, 111, 1200031000, 1803231809, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4982, 111, 1200037000, 1804211809, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4983, 111, 1200038000, 1804211809, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4984, 111, 1200080000, 1803231809, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4985, 46, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4986, 46, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4987, 46, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4988, 46, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4989, 46, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4990, 46, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4991, 46, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4992, 46, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4993, 46, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4994, 46, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4995, 46, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4996, 46, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4997, 46, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4998, 46, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (4999, 46, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5023, 107, 400006053, 1804011842, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5024, 69, 400006053, 1804011843, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5025, 109, 400006018, 1804211843, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5026, 109, 400006053, 1804011850, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5027, 109, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5028, 109, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5029, 109, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5030, 109, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5031, 109, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5032, 69, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5033, 69, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5035, 107, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5036, 107, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5039, 113, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5040, 113, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5041, 113, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5042, 113, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5043, 113, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5044, 113, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5045, 113, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5046, 113, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5047, 113, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5048, 113, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5049, 113, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5050, 113, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5051, 113, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5052, 113, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5053, 113, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5054, 113, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5055, 113, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5056, 113, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5057, 113, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5058, 113, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5059, 113, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5060, 113, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5061, 113, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5062, 113, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5034, 69, 803007018, 518400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (4848, 109, 200004161, 1803231906, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5065, 109, 300005030, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5066, 109, 1200037000, 1804211925, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5067, 109, 1200038000, 1804211925, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5068, 109, 1200035000, 1804211925, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5069, 109, 200004132, 1804011928, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5070, 107, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5071, 107, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5072, 107, 702001011, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5073, 109, 100003150, 1804011936, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5074, 88, 100003054, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5075, 88, 300005132, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5076, 109, 904007051, 1804011945, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5077, 109, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5078, 109, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5079, 109, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5063, 107, 1001002004, 82, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5081, 109, 803007006, 1804212004, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5082, 114, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5083, 114, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5084, 114, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5085, 114, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5086, 114, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5087, 114, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5088, 114, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5089, 114, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5090, 114, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5091, 114, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5092, 114, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5093, 114, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5094, 114, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5095, 114, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5096, 114, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5097, 114, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5098, 114, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5099, 114, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6951, 159, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5038, 107, 803007018, 691200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6952, 159, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5106, 114, 1200009000, 1803292054, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5107, 114, 1200037000, 1804212054, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5108, 114, 1200038000, 1804212054, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5111, 114, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5117, 114, 1200008000, 1803232055, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5124, 114, 1200004000, 1803232056, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5126, 114, 1200036000, 1803232056, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5128, 114, 1200040000, 1803232056, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5109, 114, 1001002033, 1803232057, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5110, 114, 1001001034, 1803232057, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5115, 114, 1103003006, 1804212057, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5105, 114, 100003155, 1803292058, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5100, 114, 702001122, 1803232101, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5150, 115, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5151, 115, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5152, 115, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5153, 115, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5154, 115, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5155, 115, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5156, 115, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6955, 153, 1200036000, 1804230137, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5131, 114, 1200080000, 1803232057, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5112, 114, 601002012, 1804212057, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5132, 114, 1200002000, 1803232057, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5133, 114, 1200003000, 1803232057, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5134, 114, 1200026000, 1803232057, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6957, 153, 1200040000, 1804230137, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5136, 114, 1200035000, 1804212058, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5137, 114, 1200119000, 1803232058, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5138, 114, 1200027000, 1804212058, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5145, 114, 200004075, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5146, 114, 1001001068, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5147, 114, 1001002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5148, 114, 1104003012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5140, 114, 300005121, 1803232101, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5149, 114, 100003153, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5165, 115, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5166, 115, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5167, 115, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5168, 115, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5169, 115, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5170, 115, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5171, 115, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5172, 115, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5173, 115, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5174, 3, 100003147, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5176, 48, 1200008000, 1803232156, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5177, 44, 500010002, 1804212225, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5179, 110, 1200027000, 1803292240, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5180, 110, 601002071, 1803292241, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5196, 118, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5197, 118, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5198, 118, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5199, 118, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5293, 119, 200004325, 1804062207, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5201, 118, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5202, 118, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5204, 118, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5220, 119, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5221, 119, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5222, 119, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5224, 119, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5226, 119, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5316, 119, 904007003, 85, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5223, 119, 702001122, 1803232358, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5228, 119, 100003155, 1803292358, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5229, 119, 1001002051, 1804212359, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5230, 119, 1001001068, 1804212359, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5231, 119, 601002067, 1804020001, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6953, 159, 702001014, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5233, 119, 1200002000, 1804220001, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5235, 119, 1200008000, 1804220001, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5237, 119, 1200044000, 1804220001, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5239, 119, 1200026000, 1804220001, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5241, 119, 1200027000, 1804220001, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5243, 119, 1200080000, 1804220001, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5245, 119, 1200040000, 1804220002, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5246, 119, 1102003007, 1804220004, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5247, 48, 100003183, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5264, 120, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5271, 120, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5272, 120, 100003037, 1804220013, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5273, 120, 300005114, 1804020013, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5274, 120, 100003150, 1804120013, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5275, 120, 601002071, 1804220014, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5276, 120, 601002067, 1804020014, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5277, 120, 1104003014, 1804220015, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5278, 120, 1001001015, 1804220015, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5279, 120, 1001001017, 1804220015, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5332, 120, 1200009000, 1803300037, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5339, 119, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5284, 120, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5285, 120, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5288, 120, 1103003006, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5266, 120, 702001122, 1803240017, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5263, 120, 100003221, 1803240017, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5289, 119, 400006053, 1804020018, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5315, 120, 200004327, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5292, 119, 200004327, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5317, 120, 100003263, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5281, 120, 100003299, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5294, 119, 300005188, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5340, 119, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5295, 119, 400006082, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5318, 120, 1200027000, 1804220036, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5319, 120, 1200035000, 1804220036, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5320, 120, 1200037000, 1804220037, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5321, 120, 1200038000, 1804220037, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5296, 119, 300005171, 1804010031, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5333, 120, 100003264, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5283, 120, 200004270, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5312, 48, 904007051, 1804020033, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5322, 120, 300005161, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5334, 121, 100003037, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5314, 48, 200004292, 518400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5323, 121, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5324, 121, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5325, 121, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5326, 121, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5327, 121, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5328, 121, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5329, 121, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5330, 121, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5331, 121, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5265, 120, 300005094, 1803240040, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5335, 121, 300005114, 1804020040, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5141, 114, 702001041, 1803241616, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5336, 119, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5337, 119, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5338, 119, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5143, 114, 200004136, 1803241616, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5144, 114, 200004219, 1803241616, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5139, 114, 702001009, 1803241616, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5142, 114, 702015003, 1803241616, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5157, 115, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5158, 115, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5159, 115, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5160, 115, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5161, 115, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5162, 115, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5163, 115, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5164, 115, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5181, 118, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5182, 118, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5183, 118, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5184, 118, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5185, 118, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5186, 118, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5187, 118, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5188, 118, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5189, 118, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5190, 118, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5191, 118, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5192, 118, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5193, 118, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5194, 118, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5195, 118, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5205, 119, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5206, 119, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5207, 119, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5208, 119, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5209, 119, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5210, 119, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5211, 119, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5212, 119, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5213, 119, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5214, 119, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5215, 119, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5216, 119, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5217, 119, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5218, 119, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5219, 119, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5248, 120, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5249, 120, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5250, 120, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5251, 120, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5252, 120, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5253, 120, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5254, 120, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5255, 120, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5256, 120, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5257, 120, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5258, 120, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5259, 120, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5260, 120, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5261, 120, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5262, 120, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5297, 121, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5298, 121, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5299, 121, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5300, 121, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5301, 121, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5302, 121, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5303, 121, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5304, 121, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5305, 121, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5306, 121, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5307, 121, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5308, 121, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5309, 121, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5310, 121, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5311, 121, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5341, 122, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5342, 122, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5343, 122, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5344, 122, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5345, 122, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5346, 122, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5347, 122, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5348, 122, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5349, 122, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5350, 122, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5351, 122, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5352, 122, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5353, 122, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5354, 122, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5355, 122, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5356, 122, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5357, 122, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5358, 122, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5359, 122, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5360, 122, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5361, 122, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5362, 122, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5363, 122, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5364, 122, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5365, 123, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5366, 123, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5367, 123, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5368, 123, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5369, 123, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5370, 123, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5371, 123, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5372, 123, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5373, 123, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5374, 123, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5375, 123, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5376, 123, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5377, 123, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5378, 123, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5379, 123, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5380, 123, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5381, 123, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5382, 123, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5383, 123, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5384, 123, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5385, 123, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5386, 123, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5387, 123, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5389, 116, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5390, 116, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5391, 116, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5392, 116, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5393, 116, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5394, 116, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5395, 116, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5396, 116, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5397, 116, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5398, 116, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5399, 116, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5400, 116, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5401, 116, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5402, 116, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5403, 116, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5404, 116, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5405, 116, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5406, 116, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5407, 116, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5408, 116, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5455, 128, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5409, 116, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5410, 116, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5411, 116, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5412, 116, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5413, 96, 100003111, 1803300111, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5414, 110, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5388, 123, 100003155, 1803300114, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5415, 96, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5416, 96, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5418, 110, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5419, 110, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5421, 123, 1001002018, 1804220132, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5422, 123, 1104003013, 1804220133, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5423, 71, 100003111, 1803300136, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5424, 71, 1200027000, 1804220137, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5425, 71, 1200035000, 1804220137, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5426, 71, 1200037000, 1804220137, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5427, 71, 1200038000, 1804220137, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5428, 110, 1200037000, 1804220143, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5429, 110, 1200038000, 1804220143, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5430, 48, 1102003007, 1803240146, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5431, 123, 300005015, 1803240147, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5432, 110, 702001018, 1803240147, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5433, 48, 702015003, 1803240147, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5434, 110, 100003150, 1804020148, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5435, 110, 300005114, 1804020151, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5453, 118, 1001001003, 81, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5437, 123, 1200026000, 1804220153, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5439, 96, 1102003002, 1803240205, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5528, 129, 1200080000, 1803300310, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5440, 123, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5441, 123, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5442, 123, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5443, 123, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5444, 123, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5445, 96, 1300032001, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5420, 110, 803007018, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5447, 48, 1200011000, 1803240227, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5438, 123, 1001002004, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5448, 96, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5449, 96, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5450, 96, 702001011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5454, 118, 1001002004, 93, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5451, 123, 1001001003, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5452, 118, 100003111, 1803300243, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5588, 126, 200004134, 192, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5592, 126, 702015003, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5530, 129, 1200026000, 1803300310, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5470, 128, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5471, 128, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5472, 128, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5473, 128, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5474, 128, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5475, 128, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5476, 128, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5478, 128, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6958, 130, 702023004, 1803250155, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5532, 129, 1200027000, 1803300310, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5479, 128, 300005114, 1804220300, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5480, 128, 702001101, 1728000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5557, 129, 904007051, 1804020314, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5483, 128, 200004010, 200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5484, 128, 200004075, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5485, 128, 300005015, 1804220301, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5486, 128, 702001014, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5488, 128, 702001012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5489, 128, 904007051, 1728000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5492, 128, 1102003007, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5493, 128, 1300079010, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5494, 128, 1300002030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5495, 128, 1300003007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5496, 128, 1300119030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5497, 128, 1300004030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5499, 118, 1200026000, 1804220303, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5500, 118, 300005015, 1804220304, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5583, 126, 300005114, 1804221537, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5490, 128, 1001002033, 1804220305, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5491, 128, 1001001034, 1804220305, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5487, 128, 702015003, 1804220305, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5481, 128, 100003037, 1804220305, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5516, 129, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5517, 129, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5518, 129, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5519, 129, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5520, 129, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6959, 130, 702001018, 1803250155, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5523, 129, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5524, 129, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5525, 129, 1200038000, 1804220309, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5526, 129, 1200037000, 1804220309, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6960, 130, 702001041, 1803250155, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6961, 107, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5534, 129, 1200035000, 1803300310, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5536, 129, 1200031000, 1803300310, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5589, 126, 200004010, 198, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5538, 129, 1200044000, 1803300311, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5540, 129, 1200008000, 1803300311, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5542, 129, 1200003000, 1803300311, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5544, 129, 1200002000, 1803300311, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5545, 129, 1300079010, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5482, 128, 200004134, 199, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5546, 129, 1102003007, 1803300312, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5547, 129, 1001001034, 1803300312, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5548, 129, 1001002033, 1803300312, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5549, 118, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5550, 118, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5551, 118, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5552, 118, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5553, 118, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5554, 129, 702001101, 1804020313, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5555, 129, 601002067, 1804020313, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5556, 129, 300005114, 1804020313, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5558, 129, 100003037, 1803300314, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5574, 126, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5575, 126, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5576, 126, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5577, 126, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5582, 126, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5594, 126, 702001012, 1804220320, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5584, 126, 702001101, 1728000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5585, 126, 100003037, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5586, 126, 100003040, 1804220315, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5587, 126, 200004075, 1804220315, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5590, 126, 300005015, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5593, 126, 702001014, 1804220316, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5599, 126, 1200032000, 1804220317, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5601, 126, 1200040000, 1804220317, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5595, 126, 1001002033, 1804220318, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5591, 126, 601002011, 1804221537, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5417, 96, 803007018, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5456, 128, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5457, 128, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5458, 128, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5459, 128, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5460, 128, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5461, 128, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5462, 128, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5463, 128, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5464, 128, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5465, 128, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5466, 128, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5467, 128, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5468, 128, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5469, 128, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5501, 129, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5502, 129, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5503, 129, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5504, 129, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5505, 129, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5506, 129, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5507, 129, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5508, 129, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5509, 129, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5510, 129, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5511, 129, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5512, 129, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5513, 129, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5514, 129, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5515, 129, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5559, 126, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5560, 126, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5561, 126, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5562, 126, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5563, 126, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5564, 126, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5565, 126, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5566, 126, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5567, 126, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5568, 126, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5569, 126, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5570, 126, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5571, 126, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5572, 126, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5573, 126, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5615, 130, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5616, 130, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5617, 130, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5618, 130, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5619, 130, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5620, 130, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5621, 130, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5622, 130, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5623, 130, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5624, 130, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5625, 130, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5626, 130, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5627, 130, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5628, 130, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5629, 130, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6965, 107, 1200079000, 1804030204, 2);
INSERT INTO "public"."jogador_inventario" VALUES (2018, 31, 200004270, 1805030054, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6963, 31, 100003263, 1209600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6968, 31, 1200008000, 1804230205, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6969, 31, 1200027000, 1804230206, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6970, 31, 1200035000, 1804230206, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6973, 149, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6998, 44, 100003184, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7000, 161, 1200026000, 1804230217, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7003, 161, 300005114, 1804030217, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6997, 161, 100003155, 1803310224, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7042, 126, 1200003000, 1803250314, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7043, 149, 1001001015, 1804230315, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5064, 107, 1001001003, 88, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7022, 149, 200004029, 1803250249, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7023, 161, 200004134, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7001, 161, 1001002004, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7024, 152, 904007007, 1803250254, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7025, 161, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7026, 161, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7027, 161, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7028, 161, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7029, 161, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7030, 161, 100003277, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7031, 161, 300005170, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7032, 161, 300005171, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7034, 161, 200004327, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7033, 161, 200004325, 518400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7035, 161, 100003143, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7002, 161, 1001001003, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7036, 152, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7037, 152, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7038, 126, 904007051, 1804030305, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7044, 149, 1104003013, 1804230316, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7045, 149, 200004075, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7046, 149, 702015002, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7047, 24, 100003183, 1803310325, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7048, 24, 702001014, 1804230326, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7049, 153, 200018013, 1804230326, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7050, 153, 1200009000, 1803310331, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7051, 24, 1001001015, 1804230331, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7052, 24, 1001002016, 1804230331, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7053, 152, 1104003013, 1803250332, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5704, 118, 803007018, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5603, 126, 1200026000, 1804220317, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5605, 126, 1200079000, 1804020318, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5596, 126, 1001001034, 1804220318, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5606, 126, 1200002000, 1803300318, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5607, 126, 1200037000, 1804220318, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5608, 126, 1200038000, 1804220318, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5609, 126, 1102003006, 1803300320, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5610, 109, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5611, 96, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5612, 96, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5613, 118, 400006059, 1803240327, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5614, 87, 100003063, 1803300328, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5630, 130, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5631, 130, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5632, 130, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5634, 130, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5664, 130, 1001001003, 93, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5665, 130, 100003037, 1804230341, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5675, 130, 200004292, 1803262359, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5639, 130, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5640, 130, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5663, 130, 1001002004, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5683, 130, 200004010, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5645, 130, 1300044030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5638, 130, 100003155, 1803310154, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5671, 130, 100003263, 1804030154, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5648, 130, 1102003003, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5643, 130, 1103003006, 1804220339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5649, 130, 1200026000, 1804220339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5650, 130, 1200027000, 1804220339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5651, 130, 1200035000, 1804220339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5652, 130, 1200078000, 1804220339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5653, 130, 1200037000, 1804220339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5654, 130, 1200038000, 1804220339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5677, 130, 100003277, 1803310154, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5679, 130, 200004325, 1803270154, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5701, 118, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5678, 130, 200004327, 1803270154, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5656, 130, 1200079000, 1804220340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5681, 130, 300005188, 1803310155, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5660, 130, 1200008000, 1804220340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6971, 56, 1001001036, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5662, 130, 1200040000, 1804220340, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6972, 56, 1300038001, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5702, 118, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5682, 130, 400006005, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7004, 161, 601002007, 94, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5670, 130, 702015008, 1804220342, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5644, 130, 601002049, 1804220342, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5672, 130, 100003264, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5705, 118, 1001002051, 1804220425, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5706, 118, 1104003014, 1804220425, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5707, 110, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5673, 130, 300005170, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5708, 110, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5676, 130, 400006073, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5710, 110, 200018011, 1803240438, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5703, 118, 702001017, 1803240449, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5711, 109, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5712, 109, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5713, 109, 702001014, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5674, 130, 300005171, 1803260343, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5680, 130, 100003299, 1804090344, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5684, 130, 702001009, 1803300345, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5685, 130, 702001014, 1803240345, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5080, 109, 803007018, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5686, 109, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5687, 109, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5688, 109, 702001011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5689, 87, 702001018, 1804220348, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5690, 87, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5691, 87, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5692, 87, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5693, 87, 803007018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5694, 109, 1200027000, 1804220358, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5695, 87, 1200027000, 1804220359, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5666, 130, 100003153, 99, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5696, 130, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5697, 130, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5698, 130, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5699, 130, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5700, 130, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5714, 118, 300005114, 1804020513, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5715, 110, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5716, 110, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5717, 110, 702001014, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5718, 110, 200004029, 1803240523, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5736, 118, 300005170, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5720, 118, 400006006, 1803240531, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5721, 118, 702015003, 1803240531, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5746, 118, 1103003006, 1804220613, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5737, 118, 601002049, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5722, 118, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5723, 118, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5724, 118, 702001011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5738, 118, 1300044030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5743, 118, 601002012, 1804221705, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5725, 110, 100003285, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5726, 110, 400006017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5727, 110, 601002021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5729, 118, 1200009000, 1803300558, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5730, 118, 1301085000, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5749, 118, 200004292, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5739, 118, 1300026030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5740, 118, 1300078030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5741, 118, 1102003003, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5742, 118, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5744, 118, 1300035030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5745, 118, 1300027030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5750, 118, 400006073, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5747, 118, 300005161, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5748, 118, 100003263, 1803300604, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5751, 118, 100003264, 518400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5733, 118, 200004270, 1804020607, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5752, 110, 100003054, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5753, 110, 300005132, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5709, 110, 702001011, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5755, 31, 100003147, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5759, 31, 1200038000, 1804230831, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5763, 31, 1200004000, 1803300832, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5761, 31, 1200119000, 1803310832, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5766, 31, 1200017000, 1803300832, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5767, 31, 1001002016, 1803300833, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5768, 31, 100003014, 10, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5769, 71, 200004010, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5770, 71, 300005030, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5771, 71, 702001009, 1804221020, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5772, 71, 1300008030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5728, 110, 702001012, 1803241724, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5832, 56, 100003153, 175, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5774, 71, 1200044000, 1804221020, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5859, 75, 100003116, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5776, 71, 1200031000, 1804221021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6974, 161, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5778, 71, 1200040000, 1804221021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5780, 71, 1200026000, 1804221021, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5781, 71, 1001002004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5782, 71, 1001001003, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5783, 53, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5858, 126, 601002017, 192, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5785, 107, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5787, 107, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5788, 107, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5786, 82, 100003111, 1803301250, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5790, 82, 1001001068, 1803241303, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5791, 82, 1001002053, 1803241304, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5792, 82, 702001014, 1803241304, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5793, 82, 702001012, 1803241304, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5794, 82, 702001041, 1803241304, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5795, 82, 200004136, 1803241304, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5797, 82, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5798, 82, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5800, 82, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5796, 82, 100003099, 1803241322, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5799, 82, 601014011, 1803241322, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5801, 82, 200004075, 1803241323, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5802, 56, 100003183, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5803, 88, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5804, 75, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5805, 88, 100003045, 1803241501, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5806, 88, 200004107, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5807, 44, 100003147, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5808, 136, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5809, 136, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5810, 136, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5811, 136, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5812, 136, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5813, 136, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5814, 136, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5815, 136, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5816, 136, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5817, 136, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5818, 136, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5819, 136, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5820, 136, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5821, 136, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5822, 136, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5823, 136, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5824, 136, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5825, 136, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5826, 136, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5827, 136, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5831, 136, 100003155, 1803301515, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5833, 136, 1200037000, 1804221515, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5834, 136, 1200038000, 1804221515, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5836, 136, 1200026000, 1804221516, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5838, 136, 1200027000, 1804221516, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5840, 136, 1200035000, 1804221516, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5842, 136, 1200032000, 1804221516, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5844, 136, 1200044000, 1804221516, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5846, 136, 1200040000, 1804221517, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5848, 136, 1001001003, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5849, 136, 1001002004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5850, 136, 200004292, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5863, 114, 1102003007, 1803241602, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5864, 137, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5865, 137, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5866, 137, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5852, 136, 300005170, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5867, 137, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5851, 136, 400006073, 1468800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5853, 136, 100003277, 1803301518, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5854, 136, 601002067, 1804021518, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5855, 136, 702015003, 1804221518, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5856, 44, 1001002033, 1804221532, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5857, 44, 1001001034, 1804221532, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5719, 109, 200004010, 94, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5868, 137, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5869, 137, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5870, 137, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5860, 44, 1104003013, 1804221556, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5861, 114, 100003111, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5902, 137, 1200038000, 1803241604, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5862, 126, 1300036001, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5871, 137, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5872, 137, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5873, 137, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5874, 137, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5875, 137, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5876, 137, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5877, 137, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5878, 137, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5879, 137, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5880, 137, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5881, 137, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5882, 137, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5883, 137, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5884, 137, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5885, 137, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5887, 137, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5934, 137, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5888, 137, 1001001015, 1803241604, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5889, 137, 1001002016, 1803241604, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5890, 137, 1104003013, 1803241604, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5892, 137, 1200002000, 1803241604, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5894, 137, 1200003000, 1803241604, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5896, 137, 1200008000, 1803241604, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5898, 137, 1200119000, 1803241604, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5900, 137, 1200004000, 1803241604, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5906, 137, 1200037000, 1803241605, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5908, 137, 1200035000, 1803241605, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5910, 137, 1200026000, 1803241605, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5912, 137, 1200027000, 1803241605, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5915, 137, 1200080000, 1803241605, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5918, 137, 1200079000, 1804021606, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5919, 137, 200004136, 1803241606, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5920, 137, 601002071, 1803241606, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5921, 137, 702001009, 1803241606, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5922, 137, 904007007, 1803241606, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5924, 137, 100003263, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5926, 137, 300005161, 1641600, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5925, 137, 100003264, 1814400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5927, 137, 200004270, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5929, 137, 100003277, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5930, 137, 400006073, 1468800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5935, 137, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5933, 137, 300005170, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5931, 137, 200004292, 1468800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5932, 137, 300005171, 1728000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5936, 137, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5937, 137, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5938, 137, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5965, 135, 702001122, 1803242230, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5940, 56, 200018013, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5941, 56, 702001014, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5943, 126, 1200009000, 1803301618, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5944, 137, 100003017, 1803241619, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5987, 110, 1001002004, 94, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5946, 137, 1200031000, 1803241619, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5947, 135, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5948, 135, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5949, 135, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5950, 135, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5951, 135, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5952, 135, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5953, 135, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5954, 135, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5955, 135, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5956, 135, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5957, 135, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5958, 135, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5959, 135, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5960, 135, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5961, 135, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5962, 135, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5964, 135, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5966, 135, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6975, 161, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6976, 161, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6977, 161, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5970, 135, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5971, 135, 1200037000, 1804221625, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5972, 135, 1200038000, 1804221625, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5963, 135, 200004161, 1803241626, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5973, 137, 1001001034, 1803241627, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5974, 137, 1001002033, 1803241627, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5975, 137, 100003045, 1803241627, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6978, 161, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5977, 137, 1200040000, 1803241628, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6979, 161, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5981, 114, 1200030000, 1803241630, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5982, 107, 1300036001, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6060, 34, 1300078030, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5984, 137, 300005021, 1803241633, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5985, 110, 1200002000, 1803241637, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5986, 110, 1200003000, 1803241637, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6165, 142, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5989, 140, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5990, 140, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5991, 140, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5992, 140, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5993, 140, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5994, 140, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5995, 140, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5996, 140, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5997, 140, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5998, 140, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5999, 140, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6000, 140, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6001, 140, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6002, 140, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6003, 140, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6004, 140, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6005, 140, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6006, 140, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6007, 140, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6008, 140, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6980, 161, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6010, 140, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6012, 140, 100003155, 1803301640, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6013, 34, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6061, 34, 1102003003, 5184000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6019, 34, 1300242010, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6022, 140, 1200008000, 1804221641, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6026, 140, 1200032000, 1804221641, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6027, 52, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6029, 140, 1200027000, 1804221641, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6031, 34, 1200036000, 1804221641, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6035, 140, 1200026000, 1804221641, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6036, 140, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6037, 140, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6039, 140, 1300027030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6041, 140, 400006053, 1804021642, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6042, 140, 300005114, 1804021642, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6043, 140, 601002067, 1804021642, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6044, 140, 904007051, 1804021642, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6040, 140, 1103003006, 1804221642, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6046, 140, 1200038000, 1804221642, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6033, 140, 1200035000, 1805221641, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6071, 138, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (5983, 137, 100003037, 1803251631, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6047, 137, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6048, 137, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6049, 137, 803007018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6050, 52, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6051, 52, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6052, 52, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6014, 34, 1001001034, 1805221640, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6054, 34, 100003150, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6055, 34, 200004132, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6056, 34, 702001101, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6062, 34, 601002049, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5988, 110, 1001001003, 97, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6063, 34, 1300026030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6058, 34, 1300044030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6064, 138, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6065, 138, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6066, 138, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6067, 138, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6068, 138, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6069, 138, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6070, 138, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6072, 138, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6073, 138, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6074, 138, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6075, 138, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6076, 138, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6077, 138, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6078, 138, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6079, 138, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6080, 138, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6081, 138, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6087, 138, 100003155, 1803301701, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6018, 140, 1001002004, 96, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6100, 107, 100003285, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6053, 52, 803007018, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6015, 140, 1001001003, 95, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6166, 142, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6167, 142, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6168, 142, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6169, 142, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6082, 138, 702001122, 1803241701, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6090, 110, 200004075, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6091, 110, 702015002, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6093, 107, 1200008000, 1803241704, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6088, 138, 1001002004, 94, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6095, 107, 1200026000, 1803241704, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6197, 142, 1001001003, 198, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6097, 107, 1200002000, 1803241704, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6981, 161, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6099, 107, 1200003000, 1803241705, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6982, 161, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6983, 161, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6117, 138, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6118, 138, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6119, 138, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6121, 138, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6120, 138, 601014011, 1803241721, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6984, 161, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6123, 107, 1200040000, 1803241721, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6124, 140, 1301203000, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6125, 140, 300005161, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6985, 161, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6986, 161, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6987, 161, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6128, 140, 200004075, 1804221722, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6129, 110, 702015008, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6988, 161, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (7060, 165, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (7061, 165, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6156, 31, 100003229, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6157, 31, 601014005, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6158, 31, 1001002051, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7062, 165, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (7063, 165, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6160, 52, 1200026000, 1803241807, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6161, 138, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6162, 138, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6163, 138, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6164, 138, 803007018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6089, 138, 1001001003, 95, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6180, 142, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6181, 142, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6182, 142, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6184, 142, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6185, 142, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7064, 165, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (7065, 165, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (7066, 165, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (7067, 165, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6192, 142, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7068, 165, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (7069, 165, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (7070, 165, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6196, 142, 1001002033, 1804221843, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6190, 142, 1300027030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7071, 165, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (7072, 165, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6195, 142, 1103003006, 1804221845, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6188, 142, 100003155, 1803301845, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6183, 142, 702001122, 1803241845, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6193, 142, 601002012, 1804221845, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7073, 165, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (7074, 165, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6101, 107, 601002021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6102, 107, 702001012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6103, 140, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6104, 140, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6105, 140, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6106, 140, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6107, 140, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6108, 34, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6109, 34, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6110, 34, 1300035030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6059, 34, 1300027030, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6111, 34, 1103003006, 1804221711, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7006, 56, 1200242000, 1804030219, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6113, 138, 1200037000, 1804221714, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6114, 138, 1200038000, 1804221714, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6115, 34, 1200044000, 1804221717, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6116, 34, 1200028000, 1804221717, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6130, 34, 300005173, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6131, 34, 601002023, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6132, 34, 702001014, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6133, 140, 100003037, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6134, 140, 601002018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6135, 140, 702001017, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6136, 140, 803007018, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6137, 138, 300005017, 1804221737, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7007, 56, 904007051, 1804030219, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6139, 138, 1200026000, 1804221737, 2);
INSERT INTO "public"."jogador_inventario" VALUES (5633, 130, 702001122, 1803250220, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6141, 138, 1200035000, 1804221738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6143, 138, 1200027000, 1804221738, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6144, 138, 1200009000, 1803301739, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6145, 140, 702015003, 1804221739, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6146, 138, 200004029, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6147, 138, 200004075, 1804221740, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6148, 52, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6149, 52, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6150, 52, 702001011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6151, 31, 200004219, 1803241751, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6152, 34, 200004075, 1804221751, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6153, 31, 200004036, 1803241751, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6154, 52, 1001002033, 1803241751, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6155, 52, 1001001034, 1803241751, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7008, 161, 702001014, 1804230223, 2);
INSERT INTO "public"."jogador_inventario" VALUES (4934, 69, 100003264, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7010, 35, 100003109, 1, 0);
INSERT INTO "public"."jogador_inventario" VALUES (7011, 107, 200018013, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (5789, 107, 702001014, 172800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7012, 107, 1300027003, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7013, 159, 702001018, 1803250227, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7017, 161, 1200027000, 1804230228, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7018, 35, 702001022, 1, 0);
INSERT INTO "public"."jogador_inventario" VALUES (7019, 161, 100003037, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7055, 24, 200004136, 1804230334, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7056, 153, 400006059, 1804230336, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7057, 153, 200004219, 1804230339, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7075, 165, 100003221, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7076, 165, 200004161, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7077, 165, 300005094, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7078, 165, 702001122, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7079, 165, 1300009007, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7080, 165, 1300038030, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7081, 165, 1300037030, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7082, 165, 1301117000, 86400, 2);
INSERT INTO "public"."jogador_inventario" VALUES (7083, 165, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7084, 165, 1001002004, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7085, 165, 1001001003, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7086, 165, 601002049, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7087, 165, 1300044030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7088, 165, 1300026030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7089, 165, 1300078030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7090, 165, 1102003003, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7091, 165, 702001014, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7092, 165, 300005114, 864000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6170, 142, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6171, 142, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6172, 142, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6173, 142, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6174, 142, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6175, 142, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6176, 142, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6177, 142, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6178, 142, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6179, 142, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6198, 142, 1200035000, 1804221843, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6199, 142, 1200026000, 1804221843, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6200, 142, 1200027000, 1804221843, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6201, 142, 1200037000, 1804221844, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6254, 143, 1001001068, 1804222042, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6268, 143, 100003264, 1803302042, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6205, 142, 1200003000, 1803241845, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6206, 142, 1200002000, 1803241845, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6207, 142, 1200008000, 1804221845, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6209, 142, 100003277, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6208, 142, 200004292, 1804061845, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6318, 146, 1001002033, 1804221950, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6319, 146, 1001001034, 1804221950, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6210, 34, 100003263, 1123200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6283, 13, 100003299, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6284, 13, 200004026, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6212, 34, 100003277, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6213, 34, 400006073, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6211, 34, 200004292, 1468800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6214, 34, 300005171, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6215, 34, 200004325, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6216, 143, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6217, 143, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6218, 143, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6219, 143, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6220, 143, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6221, 143, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6222, 143, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6223, 143, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6224, 143, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6225, 143, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6226, 143, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6227, 143, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6228, 143, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6229, 143, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6230, 143, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6232, 34, 1200011000, 1804221911, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6233, 34, 1001001015, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6234, 34, 1001001017, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6235, 34, 1001001011, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6236, 34, 1001001068, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6237, 34, 1001001013, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6238, 34, 1102003007, 5184000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6239, 143, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6240, 143, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6241, 143, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6243, 143, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6244, 143, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6246, 143, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6248, 143, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6255, 143, 1001001003, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6252, 143, 1103003006, 1804221915, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6253, 143, 1001002033, 1804221915, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6262, 143, 1200026000, 1804221915, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6263, 143, 1200002000, 1803241915, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6264, 143, 1200008000, 1804221915, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6265, 143, 1200035000, 1804221915, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6266, 143, 1200027000, 1804221915, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6267, 143, 1200037000, 1804221915, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6285, 13, 601014004, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6286, 13, 702001011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6247, 143, 100003155, 1803301915, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6269, 143, 200004270, 1804061915, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6242, 143, 702001122, 1803241915, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6249, 143, 601002012, 1804221915, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6270, 143, 702001018, 1803301927, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6272, 143, 1200080000, 1804221927, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6288, 143, 1200040000, 1804221946, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6289, 143, 100003099, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6274, 143, 400006073, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6273, 143, 300005170, 1803261927, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6276, 13, 100003063, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6278, 143, 1001002018, 1803241940, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6279, 143, 1102003007, 1803241940, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6321, 146, 1200079000, 1804021950, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6290, 143, 300005012, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6291, 143, 400006038, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6292, 143, 601014011, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6293, 143, 702001021, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6294, 146, 100003004, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6295, 146, 200004006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6296, 146, 300005003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6297, 146, 400006001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6298, 146, 601002003, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6299, 146, 702001001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6300, 146, 702023001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6301, 146, 803007001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6302, 146, 904007002, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6303, 146, 1001001005, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6304, 146, 1001002006, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6305, 146, 1102003001, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6306, 146, 1006003041, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6307, 146, 1006003042, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6308, 146, 1006003043, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6309, 146, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6310, 146, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6311, 146, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6312, 146, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6313, 146, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6314, 146, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6315, 146, 1300037030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6316, 146, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6317, 146, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6323, 146, 1200242000, 1804021950, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6324, 146, 1301335000, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6325, 146, 400006082, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6326, 146, 1301299000, 2, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6327, 146, 100003277, 259200, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6329, 146, 1200002000, 1804221951, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6331, 146, 1200008000, 1804221951, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6333, 146, 1200032000, 1804221951, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6335, 146, 1200035000, 1804221951, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6337, 146, 1200027000, 1804221951, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6339, 146, 1200080000, 1804221951, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6341, 146, 1200026000, 1804221951, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6342, 146, 1301085000, 100, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6344, 146, 1200040000, 1804221951, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6346, 146, 1200017000, 1804221951, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6348, 146, 1200007000, 1804221951, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6350, 146, 1200064000, 1803301951, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6351, 146, 100003037, 1803241952, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6353, 146, 702001011, 1803241952, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6408, 148, 100003263, 1803301959, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6410, 148, 300005161, 1803302015, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6355, 31, 1104003014, 1803241954, 2);
INSERT INTO "public"."jogador_inventario" VALUES (6352, 146, 601002007, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6354, 146, 904007003, 98, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6371, 148, 100003221, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6372, 148, 200004161, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6373, 148, 300005094, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6374, 148, 702001122, 86400, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6375, 148, 1300009007, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6376, 148, 1300038030, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7058, 16, 1103003010, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6378, 148, 1301117000, 1, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6379, 148, 100003155, 604800, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6380, 148, 100003040, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (6381, 148, 601002012, 2592000, 1);
INSERT INTO "public"."jogador_inventario" VALUES (7059, 16, 1103003016, 1, 3);
INSERT INTO "public"."jogador_inventario" VALUES (6386, 148, 1200079000, 1804021957, 2);

-- ----------------------------
-- Table structure for jogador_invites
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_invites";
CREATE TABLE "public"."jogador_invites" (
  "clan_id" int4 NOT NULL,
  "player_id" int8 NOT NULL,
  "date" int4 NOT NULL,
  "texto" varchar COLLATE "pg_catalog"."default" DEFAULT ''::character varying
)
;

-- ----------------------------
-- Records of jogador_invites
-- ----------------------------
INSERT INTO "public"."jogador_invites" VALUES (7, 53, 20180321, '');

-- ----------------------------
-- Table structure for jogador_mensagem
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_mensagem";
CREATE TABLE "public"."jogador_mensagem" (
  "object" int4 NOT NULL DEFAULT nextval('jogador_mensagem_seq'::regclass),
  "player_id" int8 NOT NULL,
  "owner_id" int8 NOT NULL,
  "recipient_name" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "texto" varchar COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "type" int4 NOT NULL,
  "readed" int4 NOT NULL,
  "expirate" int4 NOT NULL,
  "dias" int4 NOT NULL,
  "response" int4 NOT NULL DEFAULT 0,
  "receive" int4 NOT NULL DEFAULT 0,
  "owner_name" varchar COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "special" bool DEFAULT false
)
;

-- ----------------------------
-- Records of jogador_mensagem
-- ----------------------------
INSERT INTO "public"."jogador_mensagem" VALUES (2, 2, 2, 'UZUMERDA', '', 5, 0, 180221, 7, 1, 0, 'PISTOLA', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (4, 2, 2, 'UZUMERDA', '', 4, 1, 180301, 15, 0, 8, 'PISTOLEIROPAPACO', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (6, 2, 0, 'GM', 'Voce recebeu uma arma por 30 dias em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 1, 180301, 15, 0, 10, 'PISTOLEIROPAPACO', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (7, 2, 0, 'GM', 'Voce recebeu uma arma por 30 dias em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 1, 180301, 15, 0, 10, 'PISTOLEIROPAPACO', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (9, 2, 0, 'GM', 'Voce recebeu uma arma por 2592000 dias em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 1, 180301, 15, 0, 10, 'PISTOLEIROPAPACO', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (12, 2, 0, 'GM', 'Voce recebeu uma arma PERMANENTE em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 1, 180303, 15, 0, 10, 'PISTOLEIROPAPACO', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (14, 2, 0, 'GM', 'Voce recebeu uma arma por 30 dias em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 1, 180303, 15, 0, 10, 'PISTOLEIROPAPACO', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (16, 2, 0, 'GM', 'Voce recebeu uma arma por 90 dias em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 1, 180303, 15, 0, 10, 'PISTOLEIROPAPACO', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (17, 2, 0, 'GM', 'Voce recebeu uma arma por 90 dias em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 1, 180303, 15, 0, 10, 'PISTOLEIROPAPACO', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (19, 2, 2, 'UZUMERDA', '', 4, 1, 180312, 15, 0, 7, 'PISTOLEIROPAPACO', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (21, 2, 2, 'UZUMERDA', '', 4, 1, 180312, 15, 0, 5, 'PISTOLA', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (24, 5, 3, 'ASDA', 'aasd', 1, 1, 180312, 15, 0, 0, 'KEVINHO', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (26, 5, 3, 'ASDA', 'sda', 1, 1, 180312, 15, 0, 0, 'KEVINHO', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (32, 5, 3, 'PISTOLA', 'ssa', 0, 1, 180313, 15, 0, 10, 'KEVINHO', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (38, 5, 3, 'PointBosta', 'eaeeeeeeeee', 1, 1, 180319, 15, 0, 10, 'PISTOLA', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (44, 5, 3, 'PointBosta', '', 4, 1, 180319, 15, 0, 6, 'KEVINHO', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (54, 6, 3, 'PISTOLA', 'vai no lobby 2 do discord', 0, 1, 180319, 15, 0, 10, 'Uzumendiz', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (55, 7, 3, 'PISTOLA', 'eae viado', 0, 0, 180324, 7, 0, 10, 'tomate', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (56, 3, 7, 'tomate', 'eae', 0, 0, 180324, 7, 0, 10, 'PISTOLA', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (57, 7, 3, 'PISTOLA', 'kaksaas', 0, 0, 180324, 7, 0, 10, 'tomate', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (58, 7, 3, 'PISTOLA', 'tenta isso

/sy help1', 0, 0, 180324, 7, 0, 10, 'tomate', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (59, 6, 3, 'PointBosta', '', 4, 1, 180401, 15, 0, 5, 'PISTOLA', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (60, 3, 4, 'Guerra', '', 5, 0, 180324, 7, 1, 0, 'tomate', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (61, 7, 4, 'Guerra', '', 4, 0, 180324, 7, 0, 3, 'PISTOLA', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (62, 7, 4, 'Guerra', '', 4, 0, 180324, 7, 0, 5, 'PISTOLA', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (63, 3, 4, 'Guerra', '', 4, 0, 180324, 7, 0, 1, 'PISTOLA', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (64, 7, 4, 'Guerra', '', 4, 1, 180402, 15, 0, 5, 'Damon', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (94, 8, 7, 'TroiaGamez', '', 4, 1, 180403, 15, 0, 3, 'Irineu', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (66, 8, 6, 'TroiaGamez', '', 5, 0, 180325, 7, 1, 0, 'Damon', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (68, 3, 6, 'TroiaGamez', '', 4, 0, 180325, 7, 0, 3, 'Ursinha', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (67, 3, 6, 'TroiaGamez', '', 4, 0, 180325, 7, 0, 3, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (83, 3, 9, 'MasterCheff', '', 4, 0, 180326, 7, 0, 3, 'AmandaTOP2', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (69, 8, 7, 'TroiaGamezOficia', '', 5, 0, 180325, 7, 1, 0, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (166, 8, 7, 'TroiaGamez', '', 4, 1, 180404, 15, 0, 3, 'rXJatooxy', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (164, 44, 7, 'TroiaGamez', '', 5, 0, 180327, 7, 1, 0, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (71, 3, 7, 'TroiaGamezOficial', '', 5, 0, 180325, 7, 1, 0, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (73, 3, 7, 'TroiaGamezOficial', '', 4, 0, 180325, 7, 0, 8, 'Damon', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (74, 8, 7, 'TroiaGamezOficial', '', 4, 0, 180325, 7, 0, 8, 'Ursinha', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (75, 24, 7, 'TroiaGamez', '', 5, 0, 180326, 7, 1, 0, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (77, 3, 7, 'TroiaGamez', '', 4, 0, 180326, 7, 0, 3, 'Keni', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (78, 8, 7, 'TroiaGamez', '', 4, 1, 180403, 15, 0, 5, 'Damon', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (81, 15, 9, 'MasterCheff', '', 5, 1, 180403, 15, 0, 0, 'Damon', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (93, 35, 7, 'TroiaGamez', '', 5, 0, 180326, 7, 1, 0, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (87, 8, 7, 'TroiaGamez', '', 4, 1, 180403, 15, 0, 3, 'XxtestinxX', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (86, 15, 7, 'TroiaGamez', '', 5, 0, 180326, 7, 1, 0, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (89, 8, 7, 'TroiaGamez', '', 4, 1, 180403, 15, 0, 3, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (107, 35, 7, 'TroiaGamez', '', 4, 1, 180403, 15, 0, 8, 'Irineu', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (91, 15, 7, 'TroiaGamez', '', 4, 1, 180403, 15, 0, 6, 'XxtestinxX', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (97, 8, 7, 'TroiaGamez', '', 4, 1, 180403, 15, 0, 3, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (108, 35, 7, 'TroiaGamez', '', 4, 1, 180403, 15, 0, 7, 'Irineu', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (100, 8, 7, 'TroiaGamez', 'teste', 1, 1, 180403, 15, 0, 10, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (102, 24, 7, 'TroiaGamez', 'teste', 1, 1, 180403, 15, 0, 10, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (103, 35, 7, 'TroiaGamez', 'teste', 1, 1, 180403, 15, 0, 10, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (116, 3, 9, 'MasterCheff', '', 4, 0, 180326, 7, 0, 3, 'JphP1gueludo', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (110, 8, 7, 'TroiaGamez', '', 4, 1, 180403, 15, 0, 5, 'Stonex', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (111, 35, 7, 'TroiaGamez', '', 4, 1, 180403, 15, 0, 5, 'Stonex', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (115, 40, 9, 'MasterCheff', '', 5, 0, 180326, 7, 1, 0, 'China', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (117, 3, 9, 'MasterCheff', '', 4, 0, 180326, 7, 0, 3, 'SmoLL', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (112, 25, 9, 'MasterCheff', '', 5, 0, 180326, 7, 1, 0, 'China', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (118, 3, 9, 'MasterCheff', '', 4, 0, 180326, 7, 0, 3, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (119, 3, 9, 'MasterCheff', '', 4, 0, 180326, 7, 0, 3, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (120, 3, 9, 'MasterCheff', '', 4, 0, 180326, 7, 0, 5, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (121, 3, 9, 'MasterCheff', '', 4, 0, 180326, 7, 0, 5, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (130, 3, 9, 'MasterCheff', '', 4, 1, 180403, 15, 0, 3, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (159, 8, 7, 'TroiaGamez', '', 4, 1, 180404, 15, 0, 3, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (160, 35, 7, 'TroiaGamez', '', 4, 1, 180404, 15, 0, 3, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (134, 3, 9, 'MasterCheff', '', 4, 0, 180326, 7, 0, 9, 'China', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (127, 3, 9, 'MasterCheff', '', 4, 0, 180326, 7, 0, 3, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (163, 35, 7, 'TroiaGamez', '', 4, 1, 180404, 15, 0, 9, 'Irineu', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (137, 44, 11, 'Armagedom', '', 4, 0, 180326, 7, 0, 3, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (139, 44, 11, 'Armagedom', '', 4, 0, 180326, 7, 0, 5, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (141, 44, 12, 'ReXpeita', '', 4, 1, 180403, 15, 0, 3, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (143, 44, 12, 'ReXpeita', '', 4, 1, 180403, 15, 0, 5, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (135, 3, 9, 'MasterCheff', '', 4, 0, 180326, 7, 0, 5, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (145, 40, 9, 'MasterCheff', '', 4, 1, 180404, 15, 0, 6, 'JphP1gueludo', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (146, 25, 9, 'MasterCheff', '', 4, 1, 180404, 15, 0, 6, 'SmoLL', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (169, 8, 7, 'TroiaGamez', '', 4, 1, 180404, 15, 0, 5, 'MOD_01', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (205, 3, 24, 'Eros', '', 4, 0, 180328, 7, 0, 3, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (170, 35, 22, 'ArmaGedom', '', 5, 0, 180327, 7, 1, 0, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (207, 90, 24, 'Eros', '', 5, 1, 180405, 15, 0, 0, 'GM_China', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (172, 35, 22, 'ArmaGedom', '', 4, 1, 180404, 15, 0, 8, '000', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (173, 35, 22, 'ArmaGedom', '', 4, 1, 180404, 15, 0, 7, '000', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (177, 35, 22, 'ArmaGedom', '', 4, 1, 180404, 15, 0, 9, '000', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (178, 35, 0, 'GM', 'Voce recebeu uma arma PERMANENTE em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 0, 180328, 7, 0, 10, 'MOD', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (179, 35, 0, 'GM', 'Voce recebeu uma arma PERMANENTE em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 1, 180405, 15, 0, 10, 'MOD', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (180, 35, 0, 'GM', 'Voce recebeu uma arma PERMANENTE em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 1, 180405, 15, 0, 10, 'MOD', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (181, 35, 0, 'GM', 'Voce recebeu uma arma PERMANENTE em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 1, 180405, 15, 0, 10, 'Irineu', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (182, 35, 0, 'GM', 'Voce recebeu uma arma PERMANENTE em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 1, 180405, 15, 0, 10, 'Irineu', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (184, 17, 23, 'Irineu', '', 4, 1, 180405, 15, 0, 1, 'ratocabelucoMT', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (186, 71, 14, 'SuperBomb', '', 5, 0, 180328, 7, 1, 0, 'GM_China', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (187, 3, 14, 'SuperBomb', '', 4, 0, 180328, 7, 0, 3, 'YuriDs', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (210, 8, 7, 'TroiaGamez', '', 4, 1, 180405, 15, 0, 3, 'Horla', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (185, 76, 14, 'SuperBomb', '', 5, 0, 180328, 7, 1, 0, 'GM_China', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (188, 3, 14, 'SuperBomb', '', 4, 0, 180328, 7, 0, 3, 'OrochiMc', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (208, 90, 7, 'TroiaGamez', '', 5, 0, 180328, 7, 1, 0, 'GM_Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (191, 3, 14, 'SuperBomb', '', 4, 0, 180328, 7, 0, 3, 'Youtuber_iWeep', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (192, 71, 14, 'SuperBomb', '', 4, 1, 180405, 15, 0, 6, 'YuriDs', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (193, 76, 14, 'SuperBomb', '', 4, 1, 180405, 15, 0, 6, 'OrochiMc', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (212, 8, 7, 'TroiaGamez', '', 4, 1, 180405, 15, 0, 5, 'GM_Japaah', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (198, 8, 7, 'TroiaGamez', '', 4, 1, 180405, 15, 0, 3, 'GM_China', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (195, 3, 7, 'TroiaGamez', '', 5, 0, 180328, 7, 1, 0, 'GM_Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (200, 8, 7, 'TroiaGamez', '', 4, 1, 180405, 15, 0, 3, 'Youtuber_iWeep', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (196, 48, 7, 'TroiaGamez', '', 5, 0, 180328, 7, 1, 0, 'GM_Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (201, 3, 7, 'TroiaGamez', '', 4, 0, 180328, 7, 0, 8, 'GM_China', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (203, 8, 7, 'TroiaGamez', '', 4, 1, 180405, 15, 0, 5, 'GM_China', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (214, 3, 24, 'Anonymous', '', 4, 1, 180405, 15, 0, 3, 'GM_Japaah', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (213, 44, 24, 'Anonymous', '', 5, 0, 180328, 7, 1, 0, 'GM_China', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (216, 3, 24, 'Anonymous', '', 4, 1, 180405, 15, 0, 5, 'GM_Japaah', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (218, 44, 7, 'TroiaGamez', '', 5, 1, 180405, 15, 0, 0, 'GM_Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (222, 8, 7, 'TroiaGamez', '', 4, 1, 180405, 15, 0, 3, 'GM_China', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (220, 3, 7, 'TroiaGamez', '', 5, 0, 180328, 7, 1, 0, 'GM_Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (223, 90, 7, 'TroiaGamez', '', 4, 0, 180328, 7, 0, 6, 'Horla', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (226, 44, 25, 'ReXpeita', '', 4, 1, 180405, 15, 0, 3, 'Horla', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (225, 90, 25, 'ReXpeita', '', 5, 0, 180328, 7, 1, 0, 'GM_Japaah', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (237, 35, 23, 'Irineu', '', 4, 1, 180405, 15, 0, 5, 'zMaxiMos', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (227, 44, 25, 'ReXpeita', '', 4, 1, 180405, 15, 0, 3, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (231, 92, 25, 'ReXpeita', '', 5, 1, 180405, 15, 0, 0, 'GM_Japaah', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (240, 88, 7, 'TroiaGamez', '', 5, 0, 180328, 7, 1, 0, 'GM_Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (232, 44, 25, 'ReXpeita', '', 4, 1, 180405, 15, 0, 4, 'zProZ', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (230, 88, 25, 'ReXpeita', '', 5, 0, 180328, 7, 1, 0, 'GM_Japaah', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (228, 88, 22, 'ArmaGedom', '', 5, 0, 180328, 7, 1, 0, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (234, 44, 25, 'ReXpeita', '', 4, 1, 180405, 15, 0, 5, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (239, 8, 7, 'TroiaGamez', '', 4, 1, 180405, 15, 0, 3, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (235, 90, 25, 'ReXpeita', '', 4, 1, 180405, 15, 0, 6, 'Horla', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (242, 8, 7, 'TroiaGamez', '', 4, 1, 180405, 15, 0, 3, 'zProZ', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (243, 44, 22, 'ArmaGedom', '', 5, 0, 180328, 7, 1, 0, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (244, 17, 22, 'ArmaGedom', '', 5, 0, 180328, 7, 1, 0, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (249, 8, 7, 'TroiaGamez', '', 4, 1, 180406, 15, 0, 5, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (229, 92, 22, 'ArmaGedom', '', 5, 0, 180328, 7, 1, 0, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (189, 75, 14, 'SuperBomb', '', 5, 0, 180405, 15, 1, 0, 'GM_China', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (251, 75, 26, 'AnonymouS', '', 5, 0, 180329, 7, 1, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (250, 106, 26, 'AnonymouS', '', 5, 0, 180329, 7, 1, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (252, 107, 26, 'AnonymouS', '', 5, 0, 180329, 7, 1, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (256, 110, 26, 'AnonymouS', '', 5, 0, 180329, 7, 1, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (298, 56, 26, 'AnonymouS', '', 4, 1, 180407, 15, 0, 3, 'MatadoraaDeNub', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (260, 109, 22, 'ArmaGedom', '', 5, 0, 180329, 7, 1, 0, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (295, 82, 26, 'AnonymouS', '', 5, 0, 180330, 7, 1, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (262, 107, 22, 'ArmaGedom', '', 5, 0, 180329, 7, 1, 0, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (266, 8, 7, 'TroiaGamez', '', 4, 1, 180407, 15, 0, 5, 'Youtuber_iWeep', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (268, 123, 27, 'BlackDragons', '', 5, 1, 180407, 15, 0, 0, 'Youtuber_iWeep', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (269, 110, 27, 'BlackDragons', '', 5, 1, 180407, 15, 0, 0, 'Youtuber_iWeep', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (299, 56, 26, 'AnonymouS', '', 4, 1, 180407, 15, 0, 3, 'joker', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (267, 96, 27, 'BlackDragons', '', 5, 0, 180330, 7, 1, 0, 'Youtuber_iWeep', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (271, 96, 27, 'BlackDragons', '', 4, 0, 180330, 7, 0, 8, 'fooxMVP', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (270, 48, 27, 'BlackDragons', '', 4, 0, 180330, 7, 0, 3, 'fooxMVP', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (272, 118, 48, 'Youtuber_iWeep', 'SEU PIN COD ESTÁ AQUI:8886897772456528 ATIVA LÁ NO SITE VLLW', 0, 0, 180330, 7, 0, 10, 'Duufy', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (274, 109, 26, 'AnonymouS', '', 5, 1, 180407, 15, 0, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (275, 114, 26, 'AnonymouS', '', 5, 1, 180407, 15, 0, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (276, 137, 26, 'AnonymouS', '', 5, 1, 180407, 15, 0, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (297, 135, 26, 'AnonymouS', '', 5, 0, 180330, 7, 1, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (277, 140, 22, 'ArmaGedom', '', 5, 0, 180330, 7, 1, 0, 'HeroBryne', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (279, 118, 28, 'TesteMatos', '', 5, 0, 180330, 7, 1, 0, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (281, 118, 28, 'TesteMatos', '', 4, 0, 180330, 7, 0, 8, 'Duufy', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (283, 118, 28, 'TesteMatos', 'Não da', 1, 0, 180330, 7, 0, 10, 'Sheik', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (284, 118, 28, 'TesteMatos', '', 4, 1, 180407, 15, 0, 6, 'Duufy', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (301, 56, 26, 'AnonymouS', '', 4, 1, 180407, 15, 0, 3, 'XxTesTinxX', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (285, 143, 26, 'AnonymouS', '', 5, 0, 180330, 7, 1, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (300, 69, 26, 'AnonymouS', '', 5, 0, 180330, 7, 1, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (288, 56, 26, 'AnonymouS', '', 4, 1, 180407, 15, 0, 3, 'CueioTheLasTreva', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (302, 44, 0, 'GM', 'Voce recebeu uma arma PERMANENTE em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 1, 180408, 15, 0, 10, 'paodequeijo', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (289, 31, 22, 'ArmaGedom', '', 4, 1, 180407, 15, 0, 5, 'NetenhoSTT', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (303, 16, 26, 'AnonymouS', '', 5, 1, 180408, 15, 0, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (291, 56, 26, 'AnonymouS', '', 4, 1, 180407, 15, 0, 3, 'NetenhoSTT', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (290, 107, 26, 'AnonymouS', '', 5, 0, 180330, 7, 1, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (304, 158, 26, 'AnonymouS', '', 5, 1, 180408, 15, 0, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (293, 56, 26, 'AnonymouS', '', 4, 1, 180407, 15, 0, 3, 'NicProKiller', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (292, 138, 26, 'AnonymouS', '', 5, 0, 180330, 7, 1, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (294, 118, 26, 'AnonymouS', '', 5, 1, 180407, 15, 0, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (296, 149, 26, 'AnonymouS', '', 5, 1, 180407, 15, 0, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (306, 56, 26, 'AnonymouS', '', 4, 1, 180408, 15, 0, 3, 'yAlone', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (305, 152, 26, 'AnonymouS', '', 5, 0, 180331, 7, 1, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (308, 56, 26, 'AnonymouS', '', 4, 1, 180408, 15, 0, 3, 'Lucemon', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (307, 159, 26, 'AnonymouS', '', 5, 0, 180331, 7, 1, 0, 'Eros', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (309, 35, 0, 'GM', 'Voce recebeu uma arma PERMANENTE em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 1, 180408, 15, 0, 10, 'Irineu', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (310, 35, 0, 'GM', 'Voce recebeu uma arma PERMANENTE em seu inventario.
(Se a arma nao aparecer, diminua o limite do seu inventario e relogue)', 1, 1, 180408, 15, 0, 10, 'Irineu', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (311, 69, 26, 'AnonymouS', '', 4, 1, 180408, 15, 0, 8, 'XxTesTinxX', 'f');
INSERT INTO "public"."jogador_mensagem" VALUES (312, 126, 26, 'AnonymouS', '', 5, 1, 180408, 15, 0, 0, 'Eros', 'f');

-- ----------------------------
-- Table structure for jogador_missoes
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_missoes";
CREATE TABLE "public"."jogador_missoes" (
  "player_id" int8 NOT NULL DEFAULT 0,
  "mission1_1" int4 NOT NULL DEFAULT 0,
  "mission1_2" int4 NOT NULL DEFAULT 0,
  "mission1_3" int4 NOT NULL DEFAULT 0,
  "mission1_4" int4 NOT NULL DEFAULT 0,
  "mission1_5" int4 NOT NULL DEFAULT 0,
  "mission1_6" int4 NOT NULL DEFAULT 0,
  "mission1_7" int4 NOT NULL DEFAULT 0,
  "mission1_8" int4 NOT NULL DEFAULT 0,
  "mission1_9" int4 NOT NULL DEFAULT 0,
  "mission1_10" int4 NOT NULL DEFAULT 0,
  "mission1_11" int4 NOT NULL DEFAULT 0,
  "mission1_12" int4 NOT NULL DEFAULT 0,
  "mission1_13" int4 NOT NULL DEFAULT 0,
  "mission1_14" int4 NOT NULL DEFAULT 0,
  "mission1_15" int4 NOT NULL DEFAULT 0,
  "mission1_16" int4 NOT NULL DEFAULT 0,
  "mission1_17" int4 NOT NULL DEFAULT 0,
  "mission1_18" int4 NOT NULL DEFAULT 0,
  "mission1_19" int4 NOT NULL DEFAULT 0,
  "mission1_20" int4 NOT NULL DEFAULT 0,
  "mission1_21" int4 NOT NULL DEFAULT 0,
  "mission1_22" int4 NOT NULL DEFAULT 0,
  "mission1_23" int4 NOT NULL DEFAULT 0,
  "mission1_24" int4 NOT NULL DEFAULT 0,
  "mission1_25" int4 NOT NULL DEFAULT 0,
  "mission1_26" int4 NOT NULL DEFAULT 0,
  "mission1_27" int4 NOT NULL DEFAULT 0,
  "mission1_28" int4 NOT NULL DEFAULT 0,
  "mission1_29" int4 NOT NULL DEFAULT 0,
  "mission1_30" int4 NOT NULL DEFAULT 0,
  "mission1_31" int4 NOT NULL DEFAULT 0,
  "mission1_32" int4 NOT NULL DEFAULT 0,
  "mission1_33" int4 NOT NULL DEFAULT 0,
  "mission1_34" int4 NOT NULL DEFAULT 0,
  "mission1_35" int4 NOT NULL DEFAULT 0,
  "mission1_36" int4 NOT NULL DEFAULT 0,
  "mission1_37" int4 NOT NULL DEFAULT 0,
  "mission1_38" int4 NOT NULL DEFAULT 0,
  "mission1_39" int4 NOT NULL DEFAULT 0,
  "mission1_40" int4 NOT NULL DEFAULT 0,
  "mission2_1" int4 NOT NULL DEFAULT 0,
  "mission2_2" int4 NOT NULL DEFAULT 0,
  "mission2_3" int4 NOT NULL DEFAULT 0,
  "mission2_4" int4 NOT NULL DEFAULT 0,
  "mission2_5" int4 NOT NULL DEFAULT 0,
  "mission2_6" int4 NOT NULL DEFAULT 0,
  "mission2_7" int4 NOT NULL DEFAULT 0,
  "mission2_8" int4 NOT NULL DEFAULT 0,
  "mission2_9" int4 NOT NULL DEFAULT 0,
  "mission2_10" int4 NOT NULL DEFAULT 0,
  "mission2_11" int4 NOT NULL DEFAULT 0,
  "mission2_12" int4 NOT NULL DEFAULT 0,
  "mission2_13" int4 NOT NULL DEFAULT 0,
  "mission2_14" int4 NOT NULL DEFAULT 0,
  "mission2_15" int4 NOT NULL DEFAULT 0,
  "mission2_16" int4 NOT NULL DEFAULT 0,
  "mission2_17" int4 NOT NULL DEFAULT 0,
  "mission2_18" int4 NOT NULL DEFAULT 0,
  "mission2_19" int4 NOT NULL DEFAULT 0,
  "mission2_20" int4 NOT NULL DEFAULT 0,
  "mission2_21" int4 NOT NULL DEFAULT 0,
  "mission2_22" int4 NOT NULL DEFAULT 0,
  "mission2_23" int4 NOT NULL DEFAULT 0,
  "mission2_24" int4 NOT NULL DEFAULT 0,
  "mission2_25" int4 NOT NULL DEFAULT 0,
  "mission2_26" int4 NOT NULL DEFAULT 0,
  "mission2_27" int4 NOT NULL DEFAULT 0,
  "mission2_28" int4 NOT NULL DEFAULT 0,
  "mission2_29" int4 NOT NULL DEFAULT 0,
  "mission2_30" int4 NOT NULL DEFAULT 0,
  "mission2_31" int4 NOT NULL DEFAULT 0,
  "mission2_32" int4 NOT NULL DEFAULT 0,
  "mission2_33" int4 NOT NULL DEFAULT 0,
  "mission2_34" int4 NOT NULL DEFAULT 0,
  "mission2_35" int4 NOT NULL DEFAULT 0,
  "mission2_36" int4 NOT NULL DEFAULT 0,
  "mission2_37" int4 NOT NULL DEFAULT 0,
  "mission2_38" int4 NOT NULL DEFAULT 0,
  "mission2_39" int4 NOT NULL DEFAULT 0,
  "mission2_40" int4 NOT NULL DEFAULT 0,
  "mission3_1" int4 NOT NULL DEFAULT 0,
  "mission3_2" int4 NOT NULL DEFAULT 0,
  "mission3_3" int4 NOT NULL DEFAULT 0,
  "mission3_4" int4 NOT NULL DEFAULT 0,
  "mission3_5" int4 NOT NULL DEFAULT 0,
  "mission3_6" int4 NOT NULL DEFAULT 0,
  "mission3_7" int4 NOT NULL DEFAULT 0,
  "mission3_8" int4 NOT NULL DEFAULT 0,
  "mission3_9" int4 NOT NULL DEFAULT 0,
  "mission3_10" int4 NOT NULL DEFAULT 0,
  "mission3_11" int4 NOT NULL DEFAULT 0,
  "mission3_12" int4 NOT NULL DEFAULT 0,
  "mission3_13" int4 NOT NULL DEFAULT 0,
  "mission3_14" int4 NOT NULL DEFAULT 0,
  "mission3_15" int4 NOT NULL DEFAULT 0,
  "mission3_16" int4 NOT NULL DEFAULT 0,
  "mission3_17" int4 NOT NULL DEFAULT 0,
  "mission3_18" int4 NOT NULL DEFAULT 0,
  "mission3_19" int4 NOT NULL DEFAULT 0,
  "mission3_20" int4 NOT NULL DEFAULT 0,
  "mission3_21" int4 NOT NULL DEFAULT 0,
  "mission3_22" int4 NOT NULL DEFAULT 0,
  "mission3_23" int4 NOT NULL DEFAULT 0,
  "mission3_24" int4 NOT NULL DEFAULT 0,
  "mission3_25" int4 NOT NULL DEFAULT 0,
  "mission3_26" int4 NOT NULL DEFAULT 0,
  "mission3_27" int4 NOT NULL DEFAULT 0,
  "mission3_28" int4 NOT NULL DEFAULT 0,
  "mission3_29" int4 NOT NULL DEFAULT 0,
  "mission3_30" int4 NOT NULL DEFAULT 0,
  "mission3_31" int4 NOT NULL DEFAULT 0,
  "mission3_32" int4 NOT NULL DEFAULT 0,
  "mission3_33" int4 NOT NULL DEFAULT 0,
  "mission3_34" int4 NOT NULL DEFAULT 0,
  "mission3_35" int4 NOT NULL DEFAULT 0,
  "mission3_36" int4 NOT NULL DEFAULT 0,
  "mission3_37" int4 NOT NULL DEFAULT 0,
  "mission3_38" int4 NOT NULL DEFAULT 0,
  "mission3_39" int4 NOT NULL DEFAULT 0,
  "mission3_40" int4 NOT NULL DEFAULT 0,
  "mission4_1" int4 NOT NULL DEFAULT 0,
  "mission4_2" int4 NOT NULL DEFAULT 0,
  "mission4_3" int4 NOT NULL DEFAULT 0,
  "mission4_4" int4 NOT NULL DEFAULT 0,
  "mission4_5" int4 NOT NULL DEFAULT 0,
  "mission4_6" int4 NOT NULL DEFAULT 0,
  "mission4_7" int4 NOT NULL DEFAULT 0,
  "mission4_8" int4 NOT NULL DEFAULT 0,
  "mission4_9" int4 NOT NULL DEFAULT 0,
  "mission4_10" int4 NOT NULL DEFAULT 0,
  "mission4_11" int4 NOT NULL DEFAULT 0,
  "mission4_12" int4 NOT NULL DEFAULT 0,
  "mission4_13" int4 NOT NULL DEFAULT 0,
  "mission4_14" int4 NOT NULL DEFAULT 0,
  "mission4_15" int4 NOT NULL DEFAULT 0,
  "mission4_16" int4 NOT NULL DEFAULT 0,
  "mission4_17" int4 NOT NULL DEFAULT 0,
  "mission4_18" int4 NOT NULL DEFAULT 0,
  "mission4_19" int4 NOT NULL DEFAULT 0,
  "mission4_20" int4 NOT NULL DEFAULT 0,
  "mission4_21" int4 NOT NULL DEFAULT 0,
  "mission4_22" int4 NOT NULL DEFAULT 0,
  "mission4_23" int4 NOT NULL DEFAULT 0,
  "mission4_24" int4 NOT NULL DEFAULT 0,
  "mission4_25" int4 NOT NULL DEFAULT 0,
  "mission4_26" int4 NOT NULL DEFAULT 0,
  "mission4_27" int4 NOT NULL DEFAULT 0,
  "mission4_28" int4 NOT NULL DEFAULT 0,
  "mission4_29" int4 NOT NULL DEFAULT 0,
  "mission4_30" int4 NOT NULL DEFAULT 0,
  "mission4_31" int4 NOT NULL DEFAULT 0,
  "mission4_32" int4 NOT NULL DEFAULT 0,
  "mission4_33" int4 NOT NULL DEFAULT 0,
  "mission4_34" int4 NOT NULL DEFAULT 0,
  "mission4_35" int4 NOT NULL DEFAULT 0,
  "mission4_36" int4 NOT NULL DEFAULT 0,
  "mission4_37" int4 NOT NULL DEFAULT 0,
  "mission4_38" int4 NOT NULL DEFAULT 0,
  "mission4_39" int4 NOT NULL DEFAULT 0,
  "mission4_40" int4 NOT NULL DEFAULT 0,
  "card1" int4 NOT NULL DEFAULT 0,
  "card2" int4 NOT NULL DEFAULT 0,
  "card3" int4 NOT NULL DEFAULT 0,
  "card4" int4 NOT NULL DEFAULT 0,
  "active" int4 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Records of jogador_missoes
-- ----------------------------
INSERT INTO "public"."jogador_missoes" VALUES (2, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (5, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO "public"."jogador_missoes" VALUES (6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (7, 1, 1, 1, 1, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (8, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (16, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 0, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (3, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 2, 1, 1, 3, 2, 2, 1, 4, 1, 1, 1, 1, 4, 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 5, 0, 2);
INSERT INTO "public"."jogador_missoes" VALUES (23, 1, 1, 1, 1, 2, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (14, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (40, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (24, 1, 1, 1, 1, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (26, 1, 1, 1, 1, 2, 2, 1, 1, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (25, 1, 1, 1, 1, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (34, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 1);
INSERT INTO "public"."jogador_missoes" VALUES (33, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (37, 1, 1, 1, 1, 2, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO "public"."jogador_missoes" VALUES (64, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (31, 3, 2, 1, 12, 3, 2, 4, 4, 5, 1, 5, 2, 1, 1, 1, 7, 3, 11, 2, 1, 2, 10, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 2, 1, 1, 3, 2, 2, 1, 4, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 1, 1, 3, 2, 2, 1, 1, 1, 1, 1, 3, 1, 1, 1, 3, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 4, 6, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (44, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 2, 1, 3, 1, 2, 1, 1, 1, 2, 1, 1, 3, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (48, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 3, 1, 0, 1, 3, 2, 1, 2, 3, 1, 1, 1, 3, 0, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4, 0, 0, 1);
INSERT INTO "public"."jogador_missoes" VALUES (59, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (52, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (35, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (57, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (53, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (69, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 2, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (17, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (76, 1, 1, 1, 1, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (63, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (83, 1, 1, 1, 1, 2, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (75, 1, 1, 1, 1, 2, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (79, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (82, 1, 1, 1, 1, 2, 2, 1, 1, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (84, 1, 1, 1, 1, 2, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (90, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (47, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (88, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 2, 1, 3, 1, 2, 1, 1, 1, 2, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (87, 1, 1, 1, 1, 2, 2, 1, 1, 2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (92, 1, 1, 1, 1, 2, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (98, 1, 1, 1, 1, 2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (106, 1, 1, 1, 1, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (96, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 2, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (107, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 2, 1, 3, 1, 2, 1, 1, 1, 2, 1, 1, 3, 1, 1, 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (111, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (114, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (118, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (109, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 2, 1, 3, 1, 2, 1, 1, 1, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (126, 1, 1, 1, 1, 2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (123, 1, 1, 1, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (119, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 0, 2, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (122, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (121, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (130, 1, 1, 1, 1, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (56, 1, 1, 1, 1, 3, 2, 1, 1, 3, 2, 2, 1, 4, 1, 1, 1, 1, 4, 1, 1, 2, 4, 1, 1, 1, 0, 1, 4, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 1, 0, 2, 0, 1, 1, 3, 2, 2, 1, 1, 0, 0, 0, 3, 1, 1, 0, 3, 1, 0, 1, 2, 0, 2, 1, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 7, 0, 0, 1);
INSERT INTO "public"."jogador_missoes" VALUES (136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (110, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 2, 1, 3, 1, 2, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 9, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (135, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (140, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (137, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (138, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (143, 1, 1, 1, 1, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (144, 1, 1, 1, 1, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (146, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (153, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (148, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (149, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 3, 2, 2, 1, 4, 0, 0, 1, 1, 4, 1, 1, 2, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 1);
INSERT INTO "public"."jogador_missoes" VALUES (13, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (152, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (158, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_missoes" VALUES (159, 1, 1, 1, 1, 2, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for jogador_mouse
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_mouse";
CREATE TABLE "public"."jogador_mouse" (
  "player_id" int8 NOT NULL,
  "v_1" int4 DEFAULT 0,
  "v_2" int4 DEFAULT 0,
  "v_3" int4 DEFAULT 0,
  "v_4" int4 DEFAULT 0,
  "v_5" int4 DEFAULT 0,
  "v_6" int4 DEFAULT 0,
  "v_7" int4 DEFAULT 0,
  "v_8" int4 DEFAULT 0,
  "v_9" int4 DEFAULT 1,
  "v_10" int4 DEFAULT 1,
  "v_11" int4 DEFAULT 0,
  "v_12" int4 DEFAULT 0,
  "v_13" int4 DEFAULT 0,
  "v_14" int4 DEFAULT 0,
  "v_15" int4 DEFAULT 0,
  "v_16" int4 DEFAULT 0,
  "v_17" int4 DEFAULT 0,
  "v_18" int4 DEFAULT 0,
  "v_19" int4 DEFAULT 0,
  "v_20" int4 DEFAULT 1,
  "v_21" int4 DEFAULT 1,
  "v_22" int4 DEFAULT 0,
  "v_23" int4 DEFAULT 0,
  "v_24" int4 DEFAULT 0,
  "v_25" int4 DEFAULT 0,
  "v_26" int4 DEFAULT 0,
  "v_27" int4 DEFAULT 0,
  "v_28" int4 DEFAULT 0,
  "v_29" int4 DEFAULT 0,
  "v_30" int4 DEFAULT 0,
  "v_31" int4 DEFAULT 0,
  "v_32" int4 DEFAULT 0,
  "v_33" int4 DEFAULT 0,
  "v_34" int4 DEFAULT 0,
  "v_35" int4 DEFAULT 0,
  "v_36" int4 DEFAULT 0,
  "v_37" int4 DEFAULT 0,
  "v_38" int4 DEFAULT 0,
  "v_39" int4 DEFAULT 0,
  "v_40" int4 DEFAULT 0,
  "v_41" int4 DEFAULT 0,
  "v_42" int4 DEFAULT 0,
  "v_43" int4 DEFAULT 0
)
;

-- ----------------------------
-- Records of jogador_mouse
-- ----------------------------
INSERT INTO "public"."jogador_mouse" VALUES (2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (3, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (4, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (5, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (6, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (7, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (8, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (13, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (16, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (17, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (14, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (23, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (24, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (26, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (27, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (25, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (28, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (31, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (33, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (34, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (35, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (37, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (40, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (42, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (44, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (45, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (39, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (48, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (49, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (55, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (59, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (56, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (64, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (69, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (53, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (73, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (9, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (52, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (57, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (15, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (76, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (71, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (78, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (79, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (75, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (82, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (83, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (84, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (63, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (87, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (90, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (88, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (92, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (47, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (96, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (98, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (99, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (106, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (104, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (107, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (110, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (109, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (111, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (46, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (113, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (114, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (115, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (118, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (119, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (120, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (121, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (122, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (116, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (123, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (128, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (129, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (126, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (130, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (136, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (137, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (135, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (140, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (138, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (165, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (142, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (143, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (146, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (148, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (144, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (149, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (153, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (152, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (155, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (157, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (158, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_mouse" VALUES (159, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for jogador_teclado
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_teclado";
CREATE TABLE "public"."jogador_teclado" (
  "player_id" int8 NOT NULL,
  "k_esquerda" int4 DEFAULT 10,
  "k_direita" int4 DEFAULT 13,
  "k_frente" int4 DEFAULT 32,
  "k_atras" int4 DEFAULT 28,
  "k_pular" int4 DEFAULT 44,
  "k_andar" int4 DEFAULT 40,
  "k_agachar" int4 DEFAULT 38,
  "k_o_atr" int4 DEFAULT 15,
  "k_atirar" int4 DEFAULT 1,
  "k_scope" int4 DEFAULT 2,
  "k_recarregar" int4 DEFAULT 27,
  "k_trc_arm" int4 DEFAULT 29,
  "k_arm_qq" int4 DEFAULT 26,
  "k_arm_ant" int4 DEFAULT 16,
  "k_arm_pos" int4 DEFAULT 32,
  "k_jog_arm" int4 DEFAULT 16,
  "k_placar" int4 DEFAULT 55,
  "k_mapa" int4 DEFAULT 22,
  "k_mapa_pos" int4 DEFAULT 92,
  "k_mapa_ant" int4 DEFAULT 91,
  "k_chat" int4 DEFAULT 37,
  "k_chat_g" int4 DEFAULT 64,
  "k_chat_t" int4 DEFAULT 65,
  "k_chat_hz" int4 DEFAULT 21,
  "k_chat_v" int4 DEFAULT 31,
  "k_chat_c" int4 DEFAULT 66,
  "k_rad_t" int4 DEFAULT 35,
  "k_rad_p" int4 DEFAULT 33,
  "k_rad_i" int4 DEFAULT 12,
  "k_bomb_d" int4 DEFAULT 14,
  "k_sen_pos" int4 DEFAULT 49,
  "k_sen_ant" int4 DEFAULT 50,
  "k_print" int4 DEFAULT 70,
  "k_mira_x" int4 DEFAULT 11,
  "k_gravar" int4 DEFAULT 58,
  "k_valor1" int4 DEFAULT 57,
  "k_valor2" int4 DEFAULT 248,
  "k_valor3" int4 DEFAULT 16,
  "k_valor4" int4 DEFAULT 0,
  "k_macro_e" int4 DEFAULT 69,
  "armas1" int4 DEFAULT 1,
  "armas2" int4 DEFAULT 2,
  "armas3" int4 DEFAULT 3,
  "armas4" int4 DEFAULT 4,
  "armas5" int4 DEFAULT 5,
  "armas6" int4 DEFAULT 6,
  "macro1" varchar COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "macro2" varchar COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "macro3" varchar COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "macro4" varchar COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "macro5" varchar COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "k_max_value" int8 DEFAULT '4294967295'::bigint,
  "k_valor5" int4 DEFAULT 232
)
;

-- ----------------------------
-- Records of jogador_teclado
-- ----------------------------
INSERT INTO "public"."jogador_teclado" VALUES (2, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (3, 10, 13, 32, 28, 44, 40, 57, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (4, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (5, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (6, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (7, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (27, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (8, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (14, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (33, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (13, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (23, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (25, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (16, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (24, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (17, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (45, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (26, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (28, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (34, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (35, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (31, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (42, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (40, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (37, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (39, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (48, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (49, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (55, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (59, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (9, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 42, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (44, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, 'ts3.troiagamez.tk:9988', 'RC:13669999', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (56, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (64, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (69, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (15, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (53, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (87, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (52, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (79, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (57, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (73, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (99, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (76, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (75, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (71, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (90, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (78, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (82, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (83, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (47, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (88, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (84, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (63, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (98, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (92, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (96, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (104, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (107, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (106, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (110, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (109, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (111, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (46, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (113, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (128, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (114, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (137, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (115, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (118, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (129, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (119, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (120, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (121, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (122, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (144, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (126, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (135, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (116, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (130, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (123, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (146, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (140, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (136, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (142, 10, 13, 32, 28, 44, 38, 40, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, -1, 66, 35, 33, 12, 14, 49, 50, 70, 31, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (138, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (152, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (148, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (143, 10, 13, 32, 28, 44, 38, 40, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, -1, 66, 35, 33, 12, 14, 49, 50, 70, 31, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (153, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (149, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (155, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (158, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (157, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 232);
INSERT INTO "public"."jogador_teclado" VALUES (159, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);
INSERT INTO "public"."jogador_teclado" VALUES (161, 10, 13, 32, 28, 44, 40, 38, 15, 1, 2, 27, 29, 26, 16, 32, 16, 55, 22, 92, 91, 37, 64, 65, 21, 31, 66, 35, 33, 12, 14, 49, 50, 70, 11, 58, 57, 248, 16, 0, 69, 1, 2, 3, 4, 5, 6, '', '', '', '', '', 4294967295, 0);

-- ----------------------------
-- Table structure for jogador_titulos
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_titulos";
CREATE TABLE "public"."jogador_titulos" (
  "player_id" int8 NOT NULL,
  "slot" int4 NOT NULL,
  "equip1" int4 NOT NULL,
  "equip2" int4 NOT NULL,
  "equip3" int4 NOT NULL,
  "title1" int4 NOT NULL,
  "title2" int4 NOT NULL,
  "title3" int4 NOT NULL,
  "title4" int4 NOT NULL,
  "title5" int4 NOT NULL,
  "title6" int4 NOT NULL,
  "title7" int4 NOT NULL,
  "title8" int4 NOT NULL,
  "title9" int4 NOT NULL,
  "title10" int4 NOT NULL,
  "title11" int4 NOT NULL,
  "title12" int4 NOT NULL,
  "title13" int4 NOT NULL,
  "title14" int4 NOT NULL,
  "title15" int4 NOT NULL,
  "title16" int4 NOT NULL,
  "title17" int4 NOT NULL,
  "title18" int4 NOT NULL,
  "title19" int4 NOT NULL,
  "title20" int4 NOT NULL,
  "title21" int4 NOT NULL,
  "title22" int4 NOT NULL,
  "title23" int4 NOT NULL,
  "title24" int4 NOT NULL,
  "title25" int4 NOT NULL,
  "title26" int4 NOT NULL,
  "title27" int4 NOT NULL,
  "title28" int4 NOT NULL,
  "title29" int4 NOT NULL,
  "title30" int4 NOT NULL,
  "title31" int4 NOT NULL,
  "title32" int4 NOT NULL,
  "title33" int4 NOT NULL,
  "title34" int4 NOT NULL,
  "title35" int4 NOT NULL,
  "title36" int4 NOT NULL,
  "title37" int4 NOT NULL,
  "title38" int4 NOT NULL,
  "title39" int4 NOT NULL,
  "title40" int4 NOT NULL,
  "title41" int4 NOT NULL,
  "title42" int4 NOT NULL,
  "title43" int4 NOT NULL,
  "title44" int4 NOT NULL
)
;

-- ----------------------------
-- Records of jogador_titulos
-- ----------------------------
INSERT INTO "public"."jogador_titulos" VALUES (2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (5, 2, 0, 27, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (6, 2, 4, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (7, 3, 4, 12, 18, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO "public"."jogador_titulos" VALUES (3, 3, 4, 13, 18, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO "public"."jogador_titulos" VALUES (13, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (23, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (24, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (26, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (27, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (16, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (40, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (33, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (14, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (34, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (45, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (37, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (42, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (8, 3, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO "public"."jogador_titulos" VALUES (39, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (55, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (44, 3, 13, 43, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO "public"."jogador_titulos" VALUES (59, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (64, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (15, 1, 4, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (17, 3, 13, 4, 18, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO "public"."jogador_titulos" VALUES (31, 2, 4, 8, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (9, 3, 4, 19, 35, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO "public"."jogador_titulos" VALUES (48, 3, 4, 13, 19, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO "public"."jogador_titulos" VALUES (56, 2, 4, 6, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (25, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (84, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (98, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (99, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (35, 3, 13, 38, 14, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO "public"."jogador_titulos" VALUES (53, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (52, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (57, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (73, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (76, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (71, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (78, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (79, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (75, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (83, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (63, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (87, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (90, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (82, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (92, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (47, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (109, 1, 3, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (111, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (96, 1, 3, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (88, 1, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (46, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (106, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (104, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (115, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (113, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (114, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (118, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (107, 1, 2, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (110, 1, 2, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (69, 1, 3, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (120, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (121, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (161, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (165, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (122, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (123, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (116, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (128, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (129, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (126, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (136, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (137, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (135, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (140, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (130, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (138, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (142, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (146, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (148, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (155, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (157, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (143, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (144, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (149, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (158, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (159, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (119, 1, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO "public"."jogador_titulos" VALUES (153, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for jogador_vip
-- ----------------------------
DROP TABLE IF EXISTS "public"."jogador_vip";
CREATE TABLE "public"."jogador_vip" (
  "player_id" int8 NOT NULL,
  "pc_cafe" int4 NOT NULL,
  "expirate" int4 NOT NULL
)
;

-- ----------------------------
-- Records of jogador_vip
-- ----------------------------
INSERT INTO "public"."jogador_vip" VALUES (2, 2, 0);
INSERT INTO "public"."jogador_vip" VALUES (4, 2, 0);
INSERT INTO "public"."jogador_vip" VALUES (5, 2, 0);
INSERT INTO "public"."jogador_vip" VALUES (6, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (7, 2, 0);
INSERT INTO "public"."jogador_vip" VALUES (8, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (15, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (17, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (14, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (23, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (24, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (26, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (27, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (25, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (28, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (33, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (34, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (37, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (31, 1, 1803261953);
INSERT INTO "public"."jogador_vip" VALUES (9, 2, 1804181958);
INSERT INTO "public"."jogador_vip" VALUES (40, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (42, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (45, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (39, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (49, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (55, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (59, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (56, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (64, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (35, 2, 2012132341);
INSERT INTO "public"."jogador_vip" VALUES (3, 2, 1804192342);
INSERT INTO "public"."jogador_vip" VALUES (69, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (48, 1, 1804200028);
INSERT INTO "public"."jogador_vip" VALUES (53, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (52, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (57, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (73, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (76, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (71, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (78, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (79, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (75, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (82, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (83, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (84, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (63, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (87, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (44, 2, 2012142034);
INSERT INTO "public"."jogador_vip" VALUES (90, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (88, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (92, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (47, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (96, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (98, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (99, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (13, 2, 2012151236);
INSERT INTO "public"."jogador_vip" VALUES (106, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (104, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (107, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (110, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (109, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (111, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (46, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (113, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (114, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (115, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (118, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (119, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (120, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (121, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (122, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (123, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (116, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (128, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (129, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (126, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (130, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (136, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (137, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (135, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (140, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (138, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (142, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (143, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (146, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (148, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (144, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (149, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (153, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (152, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (155, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (16, 2, 2012170006);
INSERT INTO "public"."jogador_vip" VALUES (157, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (158, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (159, 0, 0);
INSERT INTO "public"."jogador_vip" VALUES (161, 0, 0);

-- ----------------------------
-- Table structure for loja
-- ----------------------------
DROP TABLE IF EXISTS "public"."loja";
CREATE TABLE "public"."loja" (
  "id" int4 NOT NULL DEFAULT nextval('loja_seq'::regclass),
  "item_id" int4 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" DEFAULT ''::character varying,
  "gold" int4 NOT NULL,
  "cash" int4 NOT NULL,
  "count" int4 NOT NULL,
  "tag" varchar(32) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "type" int4 NOT NULL DEFAULT 0
)
;

-- ----------------------------
-- Records of loja
-- ----------------------------
INSERT INTO "public"."loja" VALUES (4, 100003017, 'AK-47 Silver 1D', 0, 350, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (5, 100003017, 'AK-47 Silver 7D', 0, 1050, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (6, 100003017, 'AK-47 Silver 30D', 0, 3500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (7, 100003019, 'SG-550 Silver 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (8, 100003019, 'SG-550 Silver 7D', 0, 900, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (9, 100003019, 'SG-550 Silver 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (19, 200004021, 'K-1 Silver 1D', 0, 100, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (20, 200004021, 'K-1 Silver 7D', 0, 300, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (21, 200004021, 'K-1 Silver 30D', 0, 1000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (25, 300005004, 'SSG-69 Camoflage 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (26, 300005004, 'SSG-69 Camoflage 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (27, 300005004, 'SSG-69 Camoflage 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (28, 300005009, 'PSG-1 Silver  1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (29, 300005009, 'PSG-1 Silver  7D', 0, 900, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (30, 300005009, 'PSG-1 Silver  30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (37, 300005008, 'SSG-69 Silver 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (38, 300005008, 'SSG-69 Silver 7D', 0, 600, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (39, 300005008, 'SSG-69 Silver 30D', 0, 2000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (40, 1001002004, 'Keen Eyes 100U', 20000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (41, 400006008, '870MCS Silver 1D', 0, 150, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (42, 400006008, '870MCS Silver 7D', 0, 450, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (43, 400006008, '870MCS Silver 30D', 0, 1500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (47, 100003038, 'G36C Ext. D 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (48, 100003038, 'G36C Ext. D 7D', 0, 900, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (49, 100003038, 'G36C Ext. D 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (50, 100003040, 'AUG A3 D 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (51, 100003040, 'AUG A3 D 7D', 0, 900, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (52, 100003040, 'AUG A3 D 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (53, 100003039, 'AK SOPMOD D 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (54, 100003039, 'AK SOPMOD D 7D', 0, 1200, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (55, 100003039, 'AK SOPMOD D 30D', 0, 4000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (56, 200004024, 'MP5K Gold D. 1D', 0, 150, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (57, 200004024, 'MP5K Gold D. 7D', 0, 450, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (58, 200004024, 'MP5K Gold D. 30D', 0, 1500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (59, 200004025, 'Spectre W. D. 1D', 0, 200, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (60, 200004025, 'Spectre W. D. 7D', 0, 600, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (61, 200004025, 'Spectre W. D. 30D', 0, 2000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (62, 200004029, 'P90 Ext. D 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (63, 200004029, 'P90 Ext. D 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (64, 200004029, 'P90 Ext. D 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (65, 300005014, 'Dragunov Gold D. 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (66, 300005014, 'Dragunov Gold D. 7D', 0, 900, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (67, 300005014, 'Dragunov Gold D. 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (71, 300005017, 'L115A1 D. 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (72, 300005017, 'L115A1 D. 7D', 0, 1200, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (73, 300005017, 'L115A1 D. 30D', 0, 4000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (74, 400006011, '870MCS W. D 1D', 0, 200, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (75, 400006011, '870MCS W. D 7D', 0, 600, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (76, 400006011, '870MCS W. D 30D', 0, 2000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (77, 400006012, 'SPAS-15 D 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (78, 400006012, 'SPAS-15 D 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (79, 400006012, 'SPAS-15 D 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (83, 601014005, 'Dual Handgun D. 1D', 0, 150, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (84, 601014005, 'Dual Handgun D. 7D', 0, 450, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (85, 601014005, 'Dual Handgun D. 30D', 0, 1500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (86, 601014006, 'Dual Desert Eagle D 1D', 0, 200, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (87, 601014006, 'Dual Desert Eagle D 7D', 0, 600, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (88, 601014006, 'Dual Desert Eagle D 30D', 0, 2000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (89, 601002012, 'C. Phyton D. 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (90, 601002012, 'C. Phyton D. 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (91, 601002012, 'C. Phyton D. 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (92, 702015002, 'Dual Knife D. 1D', 0, 100, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (93, 702015002, 'Dual Knife D. 7D', 0, 300, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (94, 702015002, 'Dual Knife D. 30D', 0, 1000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (95, 702001011, 'Amok Kukri D. 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (96, 702001011, 'Amok Kukri D. 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (97, 702001011, 'Amok Kukri D. 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (98, 803007006, 'C-5 D. 1D', 0, 100, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (99, 803007006, 'C-5 D. 7D', 0, 300, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (100, 803007006, 'C-5 D. 30D', 0, 1000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (101, 904007007, 'WP Smoke D. 1D', 0, 100, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (102, 904007007, 'WP Smoke D. 7D', 0, 300, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (103, 904007007, 'WP Smoke D. 30D', 0, 1000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (107, 200004039, 'Kriss S.V Black 1D', 0, 350, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (108, 200004039, 'Kriss S.V Black 7D', 0, 1050, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (109, 200004039, 'Kriss S.V Black 30D', 0, 3500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (113, 300005011, 'Dragunov CS. 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (114, 300005011, 'Dragunov CS. 7D', 0, 900, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (115, 300005011, 'Dragunov CS. 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (116, 1102003002, 'Capacete Comum 1D', 0, 150, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (117, 1102003002, 'Capacete Comum 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (118, 1102003002, 'Capacete Comum 30D', 0, 2000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (119, 1104003003, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Camuflagem Tigre Russo 1D', 0, 200, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (120, 1104003003, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Camuflagem Tigre Russo 7D', 0, 850, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (121, 1104003003, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Camuflagem Tigre Russo 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (122, 1104003004, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Camuflagem Naval 1D', 0, 200, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (123, 1104003004, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Camuflagem Naval 7D', 0, 850, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (124, 1104003004, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Camuflagem Naval 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (128, 1300002001, 'Exp 30% 1D', 0, 300, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (129, 1300002007, 'Exp 30% 7D', 0, 1500, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (130, 1300002030, 'Exp 30% 30D', 0, 4500, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (131, 1300004001, 'Gold 30% 1D', 0, 300, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (132, 1300004007, 'Gold 30% 7D', 0, 1500, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (133, 1300004030, 'Gold 30% 30D', 0, 4500, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (134, 1300007001, '30% ReduÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o de respawn 1D', 0, 200, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (135, 1300007007, '30% ReduÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o de respawn 7D', 0, 850, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (136, 1300007030, '30% ReduÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o de respawn 30D', 0, 3000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (137, 1300008001, 'BÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â´nus 40% muniÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o 1D', 0, 200, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (138, 1300008007, 'BÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â´nus 40% muniÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o 7D', 0, 850, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (139, 1300008030, 'BÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â´nus 40% muniÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o 30D', 0, 3000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (140, 1301049000, 'Resetar Kill/Death 1U', 0, 3000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (141, 1301048000, 'Resetar Win/Losers 1U', 0, 3000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (142, 1301047000, 'AlteraÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o de Nick 1U', 0, 5000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (143, 1104003006, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara de Fogo 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (144, 1104003006, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara de Fogo 7D', 0, 1000, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (145, 1104003006, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara de Fogo 30D', 0, 3500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (146, 1104003008, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Hockey 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (147, 1104003008, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Hockey 7D', 0, 1000, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (148, 1104003008, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Hockey 30D', 0, 3500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (152, 1104003009, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara No Alvo 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (153, 1104003009, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara No Alvo 7D', 0, 1000, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (154, 1104003009, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara No Alvo 30D', 0, 3500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (155, 1104003007, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Duas Cores 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (156, 1104003007, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Duas Cores 7D', 0, 1000, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (157, 1104003007, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Duas Cores 30D', 0, 3500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (158, 1001001011, 'Reinforced D-Fox 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (159, 1001001011, 'Reinforced D-Fox 7D', 0, 1600, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (160, 1001001011, 'Reinforced D-Fox 30D', 0, 6000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (161, 1001002012, 'Reinforced Leopard 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (162, 1001002012, 'Reinforced Leopard 7D', 0, 1600, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (163, 1001002012, 'Reinforced Leopard 30D', 0, 6000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (164, 1102003007, 'Capacete AvanÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ado Plus 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (165, 1102003007, 'Capacete AvanÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ado Plus 7D', 0, 1500, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (166, 1102003007, 'Capacete AvanÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ado Plus 30D', 0, 4500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (167, 1102003006, 'Capacete Rastreador 1D', 0, 200, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (168, 1102003006, 'Capacete Rastreador 7D', 0, 850, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (169, 1102003006, 'Capacete Rastreador 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (170, 1301056000, 'Resetar Pontos Clan 1U', 0, 5000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (171, 1301053000, 'Resetar Clan Win/Losers 1U', 0, 5000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (172, 1301052000, 'Alterar Emblema do ClÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£ 1U', 0, 3000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (173, 1300032001, 'MuniÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o Hollow Point 1D', 0, 250, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (174, 1300032007, 'MuniÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o Hollow Point 7D', 0, 1000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (175, 1300032030, 'MuniÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o Hollow Point 30D', 0, 3600, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (176, 1300031001, 'Bala de Ferro 1D', 0, 250, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (177, 1300031007, 'Bala de Ferro 7D', 0, 1000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (178, 1300031030, 'Bala de Ferro 30D', 0, 3600, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (179, 1300030001, 'Colete ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â  prova de balas (5%) 1D', 0, 300, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (180, 1300030007, 'Colete ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â  prova de balas (5%) 7D', 0, 1200, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (181, 1300030030, 'Colete ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â  prova de balas (5%) 30D', 0, 4000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (182, 1301055000, 'Aumento de membros ClÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£', 0, 3000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (183, 1300035001, 'Explosivo Extra 1D', 0, 250, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (184, 1300035007, 'Explosivo Extra 7D', 0, 1200, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (185, 1300035030, 'Explosivo Extra 30D', 0, 4000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (186, 1300064001, '50% ReduÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o de respawn 1D', 0, 250, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (187, 1300064007, '50% ReduÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o de respawn 7D', 0, 1000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (188, 1300064030, '50% ReduÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o de respawn 30D', 0, 3500, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (189, 1300040001, 'Life extra 5% 1D', 0, 250, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (190, 1300040007, 'Life extra 5% 7D', 0, 770, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (191, 1300040030, 'Life extra 5% 30D', 0, 2700, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (192, 702001014, 'Machete de Combate 1D', 0, 200, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (193, 702001014, 'Machete de Combate 7D', 0, 600, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (194, 702001014, 'Machete de Combate 30D', 0, 2000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (195, 1300036001, 'MuniÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o Hollow Point Fortificada 1D', 0, 270, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (196, 1300036007, 'MuniÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o Hollow Point Fortificada 7D', 0, 1300, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (197, 1300036030, 'MuniÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o Hollow Point Fortificada 30D', 0, 4000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (198, 1300017001, 'Receber Drop 1D', 0, 350, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (199, 1300017007, 'Receber Drop 7D', 0, 1500, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (200, 1300017030, 'Receber Drop 30D', 0, 4800, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (201, 1001002014, 'Reinforced Hide 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (202, 1001002014, 'Reinforced Hide 7D', 0, 2000, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (203, 1001002014, 'Reinforced Hide 30D', 0, 7000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (204, 1001001013, 'Reinforced Viper Red 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (205, 1001001013, 'Reinforced Viper Red 7D', 0, 2000, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (206, 1001001013, 'Reinforced Viper Red 30D', 0, 7000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (207, 400006004, '870MCS W. 100U', 7500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (209, 100003015, 'AK SOPMOD 100U', 22500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (211, 100003002, 'AK-47 Ext. 100U', 15000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (213, 702001004, 'Amok Kukri 100U', 9000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (215, 100003036, 'AUG A3 100U', 17250, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (217, 803007004, 'C-5 100U', 4500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (219, 601002007, 'C. Phyton 100U', 10500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (221, 601002001, 'Desert Eagle 100U', 4500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (223, 300005001, 'Dragunov 100U', 11250, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (225, 300005006, 'Dragunov Gold 100U', 13500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (227, 601014002, 'Dual Desert Eagle 100U', 7500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (229, 601014001, 'Dual Handgun 100U', 6000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (231, 803007008, 'K-413 100U', 3750, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (233, 702015001, 'Dual Knife 100U', 4500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (235, 100003005, 'F2000 Ext. 100U', 11250, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (237, 904007003, 'FlashBang 100U', 2250, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (239, 100003013, 'G36C Ext. 100U', 16500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (241, 300005005, 'L115A1 100U', 22500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (243, 500010001, 'MK 46 Ext. 100U', 11250, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (245, 601002002, 'MK.23 Ext 100U', 2250, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (247, 200004001, 'MP5K Ext. 100U', 4500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (249, 200004007, 'MP5K Gold. 100U', 6000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (251, 200004004, 'MP7 Ext. 100U', 7500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (253, 200004011, 'P90 Ext. 100U', 9000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (255, 601013001, 'P99 & HAK 100U', 6000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (257, 300005002, 'PSG-1 100U', 15000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (259, 200004043, 'SS1-R5 Carabine 100U', 9900, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (263, 100003014, 'SG-550 Camoflage 100U', 18750, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (265, 400006003, 'SPAS-15 100U', 13500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (269, 200004009, 'Spectre W. 100U', 7500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (271, 100003001, 'SG-550 Ext. 100U', 12750, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (273, 1001001003, 'Tarantula 100U', 20000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (274, 200004008, 'UMP45 Ext. 100U', 4500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (276, 904007005, 'WP Smoke 100U', 4500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (281, 100003023, 'M4A1 Gold. 1D', 0, 270, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (282, 100003023, 'M4A1 Gold. 7D', 0, 810, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (283, 100003023, 'M4A1 Gold. 30D', 0, 2700, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (287, 300005015, 'L115A1 Gold. 1D', 0, 460, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (288, 300005015, 'L115A1 Gold. 7D', 0, 1380, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (289, 300005015, 'L115A1 Gold. 30D', 0, 4600, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (290, 601014004, 'Dual Desert Eagle G. 1D', 0, 230, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (291, 601014004, 'Dual Desert Eagle G. 7D', 0, 690, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (292, 601014004, 'Dual Desert Eagle G. 30D', 0, 2300, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (293, 1105003004, 'Cowboy Hat 100U', 16000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (296, 1300003001, 'Exp 50% 1D', 0, 400, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (297, 1300003007, 'Exp 50% 7D', 0, 1700, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (298, 1300003030, 'Exp 50% 30D', 0, 5000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (299, 200004013, 'Kriss S.V 100U', 9000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (301, 100003048, 'AUG A3 Black 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (302, 100003048, 'AUG A3 Black 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (303, 100003048, 'AUG A3 Black 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (304, 702015003, 'Faca de Osso 1D', 0, 130, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (305, 702015003, 'Faca de Osso 7D', 0, 390, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (306, 702015003, 'Faca de Osso 30D', 0, 1300, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (307, 400006006, 'SPAS-15 Silver 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (308, 400006006, 'SPAS-15 Silver 7D', 0, 900, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (309, 400006006, 'SPAS-15 Silver 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (313, 702001017, 'Fang Blade 1D', 0, 280, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (314, 702001017, 'Fang Blade 7D', 0, 840, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (315, 702001017, 'Fang Blade 30D', 0, 2800, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (316, 100003041, 'AK SOPMOD CG 1D', 0, 450, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (317, 100003041, 'AK SOPMOD CG 7D', 0, 1350, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (318, 100003041, 'AK SOPMOD CG 30D', 0, 4000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (319, 300005031, 'Winchester M70 1D', 0, 350, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (320, 300005031, 'Winchester M70 7D', 0, 1050, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (321, 300005031, 'Winchester M70 30D', 0, 3500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (322, 100003045, 'M4 SR-16 F.C 1D', 0, 420, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (323, 100003045, 'M4 SR-16 F.C 7D', 0, 1260, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (324, 100003045, 'M4 SR-16 F.C 30D', 0, 4200, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (325, 300005020, 'M4 SPR Lvl-3 1D', 0, 380, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (326, 300005020, 'M4 SPR Lvl-3 7D', 0, 1140, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (327, 300005020, 'M4 SPR Lvl-3 30D', 0, 3800, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (328, 1104003015, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara AlienÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â­gina Azul 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (329, 1104003015, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara AlienÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â­gina Azul 7D', 0, 1500, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (330, 1104003015, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara AlienÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â­gina Azul 30D', 0, 4500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (331, 1104003016, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara AlienÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â­gina Vermelho 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (332, 1104003016, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara AlienÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â­gina Vermelho 7D', 0, 1500, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (333, 1104003016, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara AlienÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â­gina Vermelho 30D', 0, 4500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (337, 1104003014, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara PalhaÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§o Assassino 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (338, 1104003014, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara PalhaÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§o Assassino 7D', 0, 1700, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (339, 1104003014, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara PalhaÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§o Assassino 30D', 0, 5000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (340, 400006017, 'M1887 D 1D', 0, 350, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (341, 400006017, 'M1887 D 7D', 0, 1100, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (342, 400006017, 'M1887 D 30D', 0, 3500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (343, 400006005, 'M1887 100U', 15000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (345, 904007010, 'Smoke Plus 1D', 0, 120, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (346, 904007010, 'Smoke Plus 7D', 0, 360, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (347, 904007010, 'Smoke Plus 30D', 0, 1200, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (348, 1300119001, 'Gold 50% 1D', 0, 400, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (349, 1300119007, 'Gold 50% 7D', 0, 1700, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (350, 1300119030, 'Gold 50% 30D', 0, 5000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (351, 1104003019, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara de Panda 1D', 0, 280, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (352, 1104003019, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara de Panda 7D', 0, 1100, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (353, 1104003019, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara de Panda 30D', 0, 3800, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (354, 300005024, 'PSG-1 Gold 100U', 19500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (357, 500010002, 'MK 46 Silver 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (358, 500010002, 'MK 46 Silver 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (359, 500010002, 'MK 46 Silver 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (363, 1001002018, 'Reinforced Combo Hide (+30% Point) 1D', 0, 420, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (364, 1001002018, 'Reinforced Combo Hide (+30% Point) 7D', 0, 2500, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (365, 1001002018, 'Reinforced Combo Hide (+30% Point) 30D', 0, 9000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (366, 1001002016, 'Reinforced Combo Leopard (+20% EXP) 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (367, 1001002016, 'Reinforced Combo Leopard (+20% EXP) 7D', 0, 2250, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (368, 1001002016, 'Reinforced Combo Leopard (+20% EXP) 30D', 0, 8500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (369, 1001001015, 'Reinforced Combo D-Fox (+20% EXP) 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (370, 1001001015, 'Reinforced Combo D-Fox (+20% EXP) 7D', 0, 2250, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (371, 1001001015, 'Reinforced Combo D-Fox (+20% EXP) 30D', 0, 8500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (372, 1001001017, 'Reinforced Combo Viper Red (+30% Point) 1D', 0, 420, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (373, 1001001017, 'Reinforced Combo Viper Red (+30% Point) 7D', 0, 2500, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (374, 1001001017, 'Reinforced Combo Viper Red (+30% Point) 30D', 0, 9000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (375, 601002018, 'C. Python G. D 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (376, 601002018, 'C. Python G. D 7D', 0, 900, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (377, 601002018, 'C. Python G. D 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (378, 601002017, 'C. Python G 100U', 12000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (380, 300005021, 'Rangemaster .338 1D', 0, 420, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (381, 300005021, 'Rangemaster .338 7D', 0, 1260, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (382, 300005021, 'Rangemaster .338 30D', 0, 4000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (383, 300005022, 'Rangemaster 7.62 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (384, 300005022, 'Rangemaster 7.62 7D', 0, 900, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (385, 300005022, 'Rangemaster 7.62 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (386, 300005023, 'Rangemaster 7.62 STBY 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (387, 300005023, 'Rangemaster 7.62 STBY 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (388, 300005023, 'Rangemaster 7.62 STBY 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (389, 400006020, 'Keltec KSG-15 1D', 0, 450, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (390, 400006020, 'Keltec KSG-15 7D', 0, 1400, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (391, 400006020, 'Keltec KSG-15 30D', 0, 4500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (392, 1102003003, 'Capacete AvanÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ado 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (393, 1102003003, 'Capacete AvanÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ado 7D', 0, 1000, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (394, 1102003003, 'Capacete AvanÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ado 30D', 0, 3500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (395, 1300044001, 'Colete ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â  prova de balas (10%) 1D', 0, 400, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (396, 1300044007, 'Colete ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â  prova de balas (10%) 7D', 0, 1600, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (397, 1300044030, 'Colete ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â  prova de balas (10%) 30D', 0, 5000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (398, 200004022, 'MP7 Silver 1D', 0, 200, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (399, 200004022, 'MP7 Silver 7D', 0, 600, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (400, 200004022, 'MP7 Silver 30D', 0, 2000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (404, 601002022, 'Colt 45 1D', 0, 180, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (405, 601002022, 'Colt 45 7D', 0, 590, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (406, 601002022, 'Colt 45 30D', 0, 1900, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (407, 100003037, 'AUG A3 Gold 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (408, 100003037, 'AUG A3 Gold 7D', 0, 1200, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (409, 100003037, 'AUG A3 Gold 30D', 0, 4000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (410, 200004026, 'Kriss S.V Gold 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (411, 200004026, 'Kriss S.V Gold 7D', 0, 1200, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (412, 200004026, 'Kriss S.V Gold 30D', 0, 4000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (413, 100003053, 'SS2-V4 Para Sniper 100U', 9900, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (415, 200018004, 'Dual Uzi 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (416, 200018004, 'Dual Uzi 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (417, 200018004, 'Dual Uzi 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (418, 200018006, 'Dual Micro Uzi 1D', 0, 200, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (419, 200018006, 'Dual Micro Uzi 7D', 0, 600, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (420, 200018006, 'Dual Micro Uzi 30D', 0, 2000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (427, 200018007, 'Dual Uzi Silencer 1D', 0, 275, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (428, 200018007, 'Dual Uzi Silencer 7D', 0, 825, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (429, 200018007, 'Dual Uzi Silencer 30D', 0, 2750, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (430, 601002011, 'Glock 18 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (431, 601002011, 'Glock 18 7D', 0, 1000, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (432, 601002011, 'Glock 18 30D', 0, 3500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (439, 400006018, 'SPAS-15 MSC 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (440, 400006018, 'SPAS-15 MSC 7D', 0, 1200, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (441, 400006018, 'SPAS-15 MSC 30D', 0, 4000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (442, 1104003013, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara de CrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢nio 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (443, 1104003013, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara de CrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢nio 7D', 0, 1700, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (444, 1104003013, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara de CrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢nio 30D', 0, 5000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (445, 1001001034, 'Rica 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (446, 1001001034, 'Rica 7D', 0, 1600, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (447, 1001001034, 'Rica 30D', 0, 6000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (448, 1001002033, 'Chou 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (449, 1001002033, 'Chou 7D', 0, 1600, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (450, 1001002033, 'Chou 30D', 0, 6000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (451, 601002005, 'Desert Eagle Silver 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (452, 601002005, 'Desert Eagle Silver 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (453, 601002005, 'Desert Eagle Silver 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (454, 1104003012, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Golden Face 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (455, 1104003012, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Golden Face 7D', 0, 1700, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (456, 1104003012, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara Golden Face 30D', 0, 5000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (457, 1006003045, 'Mars Dino (Reinforced Sting) 1D', 0, 350, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (458, 1006003045, 'Mars Dino (Reinforced Sting) 7D', 0, 1400, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (459, 1006003045, 'Mars Dino (Reinforced Sting) 30D', 0, 4800, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (463, 1006003046, 'Vulcan Dino (Reinforced Acid) 1D', 0, 350, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (464, 1006003046, 'Vulcan Dino (Reinforced Acid) 7D', 0, 1400, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (465, 1006003046, 'Vulcan Dino (Reinforced Acid) 30D', 0, 4800, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (466, 200004034, 'M4 CQB-R lvl-1 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (467, 200004034, 'M4 CQB-R lvl-1 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (468, 200004034, 'M4 CQB-R lvl-1 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (472, 300005018, 'M4 SPR Lvl-1 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (473, 300005018, 'M4 SPR Lvl-1 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (474, 300005018, 'M4 SPR Lvl-1 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (478, 100003042, 'M4 SR-16 lvl-1 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (479, 100003042, 'M4 SR-16 lvl-1 7D', 0, 720, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (480, 100003042, 'M4 SR-16 lvl-1 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (484, 200018011, 'Dual Micro Uzi Silencer Silver 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (485, 200018011, 'Dual Micro Uzi Silencer Silver 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (486, 200018011, 'Dual Micro Uzi Silencer Silver 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (487, 200018005, 'Dual Mini Uzi 1D', 0, 225, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (488, 200018005, 'Dual Mini Uzi 7D', 0, 675, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (489, 200018005, 'Dual Mini Uzi 30D', 0, 2250, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (490, 200018013, 'Dual Mini Uzi G. 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (491, 200018013, 'Dual Mini Uzi G. 7D', 0, 900, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (492, 200018013, 'Dual Mini Uzi G. 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (493, 1301051000, 'Alterar nome do ClÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£ 1U', 0, 6000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (494, 1300027001, 'Recarregamento rÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡pido 1D', 0, 300, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (495, 1300027007, 'Recarregamento rÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡pido 7D', 0, 1000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (496, 1300027030, 'Recarregamento rÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡pido 30D', 0, 3600, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (497, 1300026001, 'Troca rÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡pida de arma 1D', 0, 300, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (498, 1300026007, 'Troca rÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡pida de arma 7D', 0, 1000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (499, 1300026030, 'Troca rÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡pida de arma 30D', 0, 3600, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (500, 1300037001, 'Exp 100% 1D', 0, 450, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (501, 1300037007, 'Exp 100% 7D', 0, 2500, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (502, 1300037030, 'Exp 100% 30D', 0, 8500, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (503, 1300038001, 'Gold 100% 1D', 0, 450, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (504, 1300038007, 'Gold 100% 7D', 0, 2500, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (505, 1300038030, 'Gold 100% 30D', 0, 8500, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (506, 1300080001, '100% ReduÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o de respawn 1D', 0, 300, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (507, 1300080007, '100% ReduÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o de respawn 7D', 0, 1100, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (508, 1300080030, '100% ReduÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â§ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â£o de respawn 30D', 0, 3800, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (512, 1300011001, 'O bom perdedor 1D', 0, 500, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (513, 1300011007, 'O bom perdedor 7D', 0, 3000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (514, 1300011030, 'O bom perdedor 30D', 0, 9000, 1, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (518, 100003003, 'M4A1 Ext. 100U', 9750, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (520, 200004033, 'AKS47U Ext. 100U', 8000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (522, 904007013, 'FlashBang Plus 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (523, 904007013, 'FlashBang Plus 7D', 0, 360, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (524, 904007013, 'FlashBang Plus 30D', 0, 1200, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (525, 300005036, 'L115A1 SE 1D', 0, 460, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (526, 300005036, 'L115A1 SE 7D', 0, 1380, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (527, 300005036, 'L115A1 SE 30D', 0, 4600, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (528, 100003102, 'HK-417 100U', 14300, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (531, 300005035, 'SVU 100U', 19000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (533, 702001009, 'M-7 Gold 1D', 0, 150, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (534, 702001009, 'M-7 Gold 7D', 0, 450, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (535, 702001009, 'M-7 Gold 30D', 0, 1500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (536, 200004010, 'P90 M.C 100U', 9500, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (538, 300005030, 'Cheytac M200 100U', 30000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (541, 100003117, 'SG-550 Reload 100U', 18000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (543, 200004219, 'P90 M.C Gold 1D', 0, 320, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (544, 200004219, 'P90 M.C Gold 7D', 0, 960, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (545, 200004219, 'P90 M.C Gold 30D', 0, 3200, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (549, 702001041, 'Arabian Sword 1D', 0, 280, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (550, 702001041, 'Arabian Sword 7D', 0, 840, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (551, 702001041, 'Arabian Sword 30D', 0, 2800, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (552, 803007018, 'K-413 G 1D', 0, 100, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (553, 803007018, 'K-413 G 7D', 0, 300, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (554, 803007018, 'K-413 G 30D', 0, 1000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (558, 100003116, 'F2000 Reload 100U', 18000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (566, 200004075, 'P90 Ext. Gold 1D', 0, 350, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (567, 200004075, 'P90 Ext. Gold 7D', 0, 1050, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (568, 200004075, 'P90 Ext. Gold 30D', 0, 3500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (574, 200004100, 'MP5K Reload 100U', 8550, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (578, 100003049, 'FAMAS G2 1D', 0, 380, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (579, 100003049, 'FAMAS G2 7D', 0, 1140, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (580, 100003049, 'FAMAS G2 30D', 0, 3800, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (581, 100003050, 'FAMAS G2 Commando 1D', 0, 390, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (582, 100003050, 'FAMAS G2 Commando 7D', 0, 1170, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (583, 100003050, 'FAMAS G2 Commando 30D', 0, 3900, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (584, 100003051, 'FAMAS G2 M203 1D', 0, 390, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (585, 100003051, 'FAMAS G2 M203 7D', 0, 1170, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (586, 100003051, 'FAMAS G2 M203 30D', 0, 3900, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (587, 100003052, 'FAMAS G2 Sniper 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (588, 100003052, 'FAMAS G2 Sniper 7D', 0, 1200, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (589, 100003052, 'FAMAS G2 Sniper 30D', 0, 4000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (590, 100003064, 'FAMAS G2 Commando Gold 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (591, 100003064, 'FAMAS G2 Commando Gold 7D', 0, 1200, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (592, 100003064, 'FAMAS G2 Commando Gold 30D', 0, 4000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (593, 200004107, 'MP9 Ext 100U', 8250, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (598, 601002035, 'MK.23 Reload 100U', 4800, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (600, 601013004, 'P99 & HAK Sl. D 100U', 6400, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (608, 100003094, 'SCAR-L Carbine 1D', 0, 280, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (609, 100003094, 'SCAR-L Carbine 7D', 0, 840, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (610, 100003094, 'SCAR-L Carbine 30D', 0, 2800, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (611, 100003096, 'SCAR-L FC 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (612, 100003096, 'SCAR-L FC 7D', 0, 1200, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (613, 100003096, 'SCAR-L FC 30D', 0, 4000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (614, 100003095, 'SCAR-L Recon 1D', 0, 290, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (615, 100003095, 'SCAR-L Recon 7D', 0, 870, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (616, 100003095, 'SCAR-L Recon 30D', 0, 2900, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (618, 200004106, 'PP-19 Bizon 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (619, 200004106, 'PP-19 Bizon 7D', 0, 900, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (620, 200004106, 'PP-19 Bizon 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (621, 601002036, 'Desert Eagle Reload 100U', 5400, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (623, 100003123, 'TAR-21 1D', 0, 280, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (624, 100003123, 'TAR-21 7D', 0, 840, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (625, 100003123, 'TAR-21 30D', 0, 2800, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (626, 300005059, 'PSG-1 Reload 100U', 18750, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (630, 300005072, 'Walther WA2000 100U', 21600, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (632, 100003143, 'FG-42 100U', 11780, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (635, 100003153, 'SC-2010 100U', 20000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (637, 1104003021, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara da Morte 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (638, 1104003021, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara da Morte 7D', 0, 1200, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (639, 1104003021, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara da Morte 30D', 0, 3800, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (640, 300005034, 'DSR-1 100U', 24000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (643, 601002015, 'RB 454 SS8M 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (644, 601002015, 'RB 454 SS8M 7D', 0, 900, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (645, 601002015, 'RB 454 SS8M 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (646, 601002013, 'RB 454 SS2M 1D', 0, 220, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (647, 601002013, 'RB 454 SS2M 7D', 0, 660, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (648, 601002013, 'RB 454 SS2M 30D', 0, 2200, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (649, 601002014, 'RB 454 SS5M 1D', 0, 250, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (650, 601002014, 'RB 454 SS5M 7D', 0, 750, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (651, 601002014, 'RB 454 SS5M 30D', 0, 2500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (652, 702023002, 'Black Knuckles 1D', 0, 120, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (653, 702023002, 'Black Knuckles 7D', 0, 360, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (654, 702023002, 'Black Knuckles 30D', 0, 1200, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (655, 702023004, 'Silver Knuckles 1D', 0, 130, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (656, 702023004, 'Silver Knuckles 7D', 0, 390, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (657, 702023004, 'Silver Knuckles 30D', 0, 1300, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (658, 200004134, 'OA-93 100U', 23000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (661, 1001002053, 'World Hide 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (662, 1001002053, 'World Hide 7D', 0, 2000, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (663, 1001002053, 'World Hide 30D', 0, 7000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (664, 1001001054, 'World Tarantula 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (665, 1001001054, 'World Tarantula 7D', 0, 2000, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (666, 1001001054, 'World Tarantula 30D', 0, 7000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (676, 702001007, 'Mini Axe 100U', 6000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (678, 702001018, 'Ballistic Knife 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (679, 702001018, 'Ballistic Knife 7D', 0, 1080, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (680, 702001018, 'Ballistic Knife 30D', 0, 3600, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (681, 200004036, 'M4 CQB-R lvl-3 1D', 0, 350, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (682, 200004036, 'M4 CQB-R lvl-3 7D', 0, 1050, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (683, 200004036, 'M4 CQB-R lvl-3 30D', 0, 3500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (684, 702001012, 'Mini Axe D. 1D', 0, 150, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (685, 702001012, 'Mini Axe D. 7D', 0, 450, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (686, 702001012, 'Mini Axe D. 30D', 0, 1500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (696, 200004136, 'OA-93 Gold 1D', 0, 400, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (697, 200004136, 'OA-93 Gold 7D', 0, 1200, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (698, 200004136, 'OA-93 Gold 30D', 0, 4000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (705, 702001023, 'Keris S. 1D', 0, 230, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (706, 702001023, 'Keris S. 7D', 0, 690, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (707, 702001023, 'Keris S. 30D', 0, 2300, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (708, 100003174, 'XM8 1D', 0, 280, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (709, 100003174, 'XM8 7D', 0, 840, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (710, 100003174, 'XM8 30D', 0, 2800, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (717, 1001002051, 'Hide Kopassus 1D', 0, 420, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (718, 1001002051, 'Hide Kopassus 7D', 0, 2500, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (719, 1001002051, 'Hide Kopassus 30D', 0, 9000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (720, 1001002067, 'Hide Strike 1D', 0, 420, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (721, 1001002067, 'Hide Strike 7D', 0, 2500, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (722, 1001002067, 'Hide Strike 30D', 0, 9000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (723, 1001001068, 'Viper Kopassus 1D', 0, 420, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (724, 1001001068, 'Viper Kopassus 7D', 0, 2500, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (725, 1001001068, 'Viper Kopassus 30D', 0, 9000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (729, 100003169, 'TAR-21 Gold 1D', 0, 330, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (730, 100003169, 'TAR-21 Gold 7D', 0, 990, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (731, 100003169, 'TAR-21 Gold 30D', 0, 3300, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (732, 300005068, 'XM2010 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (733, 300005068, 'XM2010 7D', 0, 900, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (734, 300005068, 'XM2010 30D', 0, 3000, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (747, 1104003032, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara de Tigre 1D', 0, 300, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (748, 1104003032, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara de Tigre 7D', 0, 1200, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (749, 1104003032, 'MÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡scara de Tigre 30D', 0, 2800, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (758, 300005121, 'Cheytac M200 Gold 1D', 0, 530, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (759, 300005121, 'Cheytac M200 Gold 7D', 0, 1590, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (760, 300005121, 'Cheytac M200 Gold 30D', 0, 5300, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (761, 400006059, 'M1887 Gold 1D', 0, 450, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (762, 400006059, 'M1887 Gold 7D', 0, 1350, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (763, 400006059, 'M1887 Gold 30D', 0, 4500, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (764, 601002071, 'Glock 18 Gold 1D', 0, 320, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (765, 601002071, 'Glock 18 Gold 7D', 0, 1050, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (766, 601002071, 'Glock 18 Gold 30D', 0, 3700, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (770, 702015008, 'Kunai 1D', 0, 280, 86400, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (771, 702015008, 'Kunai 7D', 0, 840, 604800, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (772, 702015008, 'Kunai 30D', 0, 2800, 2592000, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (797, 1301085000, 'Inspecionar UsuÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¡rio 100U', 13000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (802, 100003284, 'Groza 100U', 20000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (804, 904007051, 'Medical Kit PBNC2015 10D', 0, 1700, 864000, 'NEW', 1);
INSERT INTO "public"."loja" VALUES (808, 1301335000, 'Caixa Supreme 3U', 0, 2900, 3, 'HOT', 1);
INSERT INTO "public"."loja" VALUES (810, 400006053, 'M1887 PBNC2015 10D', 0, 1500, 864000, 'NEW', 1);
INSERT INTO "public"."loja" VALUES (811, 300005114, 'Cheytac M200 PBNC2015 10D', 0, 1700, 864000, 'NEW', 1);
INSERT INTO "public"."loja" VALUES (814, 300005032, 'Barrett M82A1 100U', 50000, 0, 100, 'NOT', 1);
INSERT INTO "public"."loja" VALUES (817, 601002067, 'C. Phyton PBNC2015 10D', 0, 1100, 864000, 'NEW', 1);
INSERT INTO "public"."loja" VALUES (818, 702001101, 'Fang Blade PBNC2015 10D', 0, 1100, 864000, 'NEW', 1);
INSERT INTO "public"."loja" VALUES (819, 1301299000, 'Caixa Blue Diamond 3U', 0, 3000, 3, 'HOT', 1);
INSERT INTO "public"."loja" VALUES (820, 1300079010, 'Colete a prova de balas (20%) 10D', 0, 2250, 1, 'HOT', 1);
INSERT INTO "public"."loja" VALUES (821, 1300242010, 'Especial Extra 10D', 0, 1600, 1, 'HOT', 1);
INSERT INTO "public"."loja" VALUES (822, 1301203000, 'Caixa E-Sport2 3U', 0, 3100, 3, 'HOT', 1);
INSERT INTO "public"."loja" VALUES (809, 100003150, 'TAR-21 Midnight 10D ', 0, 1400, 864000, 'NEW', 1);
INSERT INTO "public"."loja" VALUES (812, 200004132, 'Kriss S.V. Midnight 10D', 0, 1350, 864000, 'NEW', 1);
INSERT INTO "public"."loja" VALUES (813, 702001082, 'Arbian Sword Midnight 10D', 0, 1550, 864000, 'NEW', 1);
INSERT INTO "public"."loja" VALUES (815, 1104003177, 'Mark Mid-night 10D', 0, 900, 864000, 'NEW', 1);

-- ----------------------------
-- Table structure for loja_gifts
-- ----------------------------
DROP TABLE IF EXISTS "public"."loja_gifts";
CREATE TABLE "public"."loja_gifts" (
  "id" int4 NOT NULL,
  "item_id" int4 NOT NULL,
  "name" varchar COLLATE "pg_catalog"."default",
  "enable" bool NOT NULL
)
;

-- ----------------------------
-- Records of loja_gifts
-- ----------------------------
INSERT INTO "public"."loja_gifts" VALUES (103063, 100003063, 'AUG A3 E-Sports', 't');
INSERT INTO "public"."loja_gifts" VALUES (103111, 100003111, 'AUG A3 BR Camo', 't');
INSERT INTO "public"."loja_gifts" VALUES (103147, 100003147, 'AUG A3 Inferno', 't');
INSERT INTO "public"."loja_gifts" VALUES (103155, 100003155, 'AUG A3 Brazuca', 't');
INSERT INTO "public"."loja_gifts" VALUES (103159, 100003159, 'AUG A3 PBIC2014', 't');
INSERT INTO "public"."loja_gifts" VALUES (103170, 100003170, 'SCAR-L Carbine G.', 't');
INSERT INTO "public"."loja_gifts" VALUES (103183, 100003183, 'AUG A3 GRS2', 't');
INSERT INTO "public"."loja_gifts" VALUES (103184, 100003184, 'AUG A3 Newborn 2015', 't');
INSERT INTO "public"."loja_gifts" VALUES (131407, 1300014007, 'Alterar Cor da Mira 7D', 't');
INSERT INTO "public"."loja_gifts" VALUES (132901, 1300029003, 'Invunerabilidade', 't');
INSERT INTO "public"."loja_gifts" VALUES (133401, 1300034003, 'C4 Speed', 't');

-- ----------------------------
-- Table structure for noticias
-- ----------------------------
DROP TABLE IF EXISTS "public"."noticias";
CREATE TABLE "public"."noticias" (
  "id" int4 NOT NULL DEFAULT nextval('noticias_id_seq'::regclass),
  "titulo" varchar COLLATE "pg_catalog"."default",
  "tipo" varchar(250) COLLATE "pg_catalog"."default",
  "autor" varchar(100) COLLATE "pg_catalog"."default",
  "data" date,
  "postagem" varchar(10000) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of noticias
-- ----------------------------
INSERT INTO "public"."noticias" VALUES (3, 'Get Cash', 'Atualizacao', 'Sheik', '2018-03-20', '<p><span style="color: #ff0000;"><strong>Ol&aacute; Atiradores.<br /><br /></strong></span><strong>Get Cash &eacute; uma nova maneira de ganhar cash di&aacute;rio, n&atilde;o esta <span style="color: #008000;">100%</span> pois queremos colocar uma forma de ser cash aleat&oacute;rio. mais voc&ecirc; pode estar entrando na aba "<span style="color: #ff0000;">Cash Gratis</span>" e adquirindo&nbsp; seus 100 de cash.<br /></strong><br /><strong>Como assim aleat&oacute;rio:</strong><br /><strong><span style="color: #0000ff;">essa vers&atilde;o da apenas 100 de cash, no aleat&oacute;rio ser&aacute; cada dia uma quantidade de cash</span>.<br /></strong><br /><strong>Exemplo:</strong><br /><span style="color: #99cc00;"><strong>hoje foi 90 de cash, Amanha 200 de cash assim aleat&oacute;riamente.<br /></strong></span><span style="color: #ff0000;"><strong><br />Bom Jogo &aacute; todos e um forte abra&ccedil;o</strong></span></p>');
INSERT INTO "public"."noticias" VALUES (4, 'Evento UP - PlayTime', 'Eventos', 'China', '2018-03-20', '<p>Ol&aacute;, Atiradores!<br /><br />Hoje estaremos com o <span style="color: #ff0000;">EVENT UP,</span> todos os servidores estar&atilde;o com 300% de EXP para voc&ecirc; upar avontade.<br /><br />Lembrando que estamos com o <span style="color: #ff0000;">PlayTime</span>, onde voc&ecirc; joga 30 minutos dentro do Game e ganha uma linda arma por 7 dias, aproveite.<br /><br />Inica: <strong><span style="color: #ff0000;">20/03/2018 - 00:00 AM</span></strong></p>
<p>Encerra: <strong><span style="color: #ff0000;">22/03/2018 - 00:00 AM</span></strong></p>');
INSERT INTO "public"."noticias" VALUES (6, 'Headshot do GM - 20/03', 'Noticias', 'Irineu', '2018-03-20', '<p>Hoje venho mostrar como ser&aacute; postado a lista de player que foram punidos por desrespeitarem as regras do jogos.<br />Ex;<br /><br /><strong>NICK - PATENTE - PER&Iacute;ODO</strong><strong><br /></strong>Irineu - Soldado - 120 Dias<br />Irin&eacute;ia - Cabo - Eterno<br />CavaloDeTroia - Capit&atilde;o 5 - 15 Dias<br /><br /></p>
<p>Our blades are sharp.<br />MOD_01</p>');
INSERT INTO "public"."noticias" VALUES (2, 'Config - Obrigatório', 'Atualizacao', 'Sheik', '2018-03-19', '<p><strong>Ol&aacute; Atiradores.</strong><br /><br /><span style="color: #ff0000;"><strong>Aviso: Baixe Nossa config para logar no game.</strong></span></p>');
INSERT INTO "public"."noticias" VALUES (1, '01 - Obrigatório', 'Atualizacao', 'Sheik', '2018-03-18', '<p><strong>Ol&aacute; Atiradores.</strong><br /><br /><span style="color: #ff0000;"><strong>Pedimos que baixem a atualiza&ccedil;&atilde;o 01&nbsp;</strong></span></p>');
INSERT INTO "public"."noticias" VALUES (5, 'Explicação - Headshot do GM', 'Noticias', 'Irineu', '2018-03-20', '<p>O que &eacute; o Headshot do GM?<br />R: &eacute; onde postamos a lista de jogadores punidos dentro do jogo.<br />O Headshot do GM ser&aacute; postado todos os dias depois das 20:00 horas (Hor&aacute;rio de Bras&iacute;lia).</p>
<p>&nbsp;</p>
<p>Our blades are sharp.<br />MOD_01</p>
<pre id="tw-target-text" class="tw-data-text tw-ta tw-text-medium" dir="ltr" data-placeholder="Tradu&ccedil;&atilde;o" data-fulltext=""><span lang="en">&nbsp;</span></pre>');
INSERT INTO "public"."noticias" VALUES (7, 'Get Cash 1.0', 'Atualizacao', 'GM_Sheik', '2018-03-21', '<p><span style="color: #ff0000;"><strong>Ol&aacute; Atiradores.</strong></span><br /><br /><strong>Nosso Sistema de Cash Gratis agora esta <span style="color: #008000;">100%</span> , Voc&ecirc; pode ganhar de 10 a 500 de cash.</strong><br /><br /><span style="color: #ff0000;"><strong>Boa Sorte.</strong></span><br /><br /></p>');

-- ----------------------------
-- Table structure for storage
-- ----------------------------
DROP TABLE IF EXISTS "public"."storage";
CREATE TABLE "public"."storage" (
  "id" int4 NOT NULL DEFAULT nextval('storage_seq'::regclass),
  "item_id" int4 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "titulo" int4 NOT NULL
)
;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO "public"."storage" VALUES (2, 100003214, 'AUG A3 PBNC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (2, 1200065000, 'Colete 90%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (3, 100003216, 'AUG A3 Mech', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (3, 200004205, 'Kriss S.V PBNC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (4, 100003243, 'AUG A3 Monkey', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (4, 300005114, 'Cheytac M200 PBNC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (5, 100003241, 'AUG A3 XMAS2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (5, 400006053, 'M1887 PBNC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (6, 100003142, 'AUG A3 1st Anniversary', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (6, 400006054, 'SPAS-15 PBNC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (7, 100003228, 'AUG A3 Camo Soldier', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (7, 601002067, 'C. Phyton PBNC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (8, 702001101, 'Fang Blade PBNC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (8, 1301854000, 'Caixa Camo Soldier', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (9, 601002074, 'Kriss Vector SDP Camo Soldier', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (9, 702015009, 'Faca de Osso PBNC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (10, 300005128, 'Rangemaster .338 Camo Soldier', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (10, 904007051, 'Medical Kit PBNC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (11, 1105003013, 'ChapÃƒÆ’Ã‚Â©u Camo Soldier', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (11, 1300079030, 'Colete 20% 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (12, 200004234, 'P90 M.C Camo Soldier', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (12, 1300079010, 'Colete 20% 10D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (13, 702015010, 'Faca de Osso Camo Soldier', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (14, 100003229, 'G36C Camo Soldier', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (15, 1301306000, 'Caixa Newborn 2016', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (16, 300005164, 'AS 50 D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (17, 702001098, 'Hair Dryer', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (18, 100003063, 'AUG A3 E-Sports', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (19, 1301299000, 'Caixa Blue Diamond', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (20, 1301336000, 'Caixa Especial PBIC', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (21, 1301895000, 'Caixa Monkey', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (22, 300005140, 'Cheytac M200 Monkey', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (23, 200004253, 'Kriss S.V Monkey', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (24, 100003194, 'AUG A3 IndependÃƒÆ’Ã‚Âªncia', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (25, 1300044030, 'Colete 10% 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (26, 1300078030, 'Hollow Point Plus 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (27, 1300026030, 'Troca RÃƒÆ’Ã‚Â¡pida 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (28, 300005082, 'Barret M82A1 P.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (29, 1300017003, 'Receber Drop 3D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (30, 100003049, 'Famas G2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (31, 200004136, 'OA-93 Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (32, 1300036007, 'MuniÃƒÆ’Ã‚Â§ÃƒÆ’Ã‚Â£o Hollow Point Fortificada 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (33, 1300036030, 'MuniÃƒÆ’Ã‚Â§ÃƒÆ’Ã‚Â£o Hollow Point Fortificada 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (34, 1105003016, 'Mascara Monkey', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (35, 1300017030, 'Receber Drop 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (36, 1300031007, 'Bala de Ferro 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (37, 1300031030, 'Bala de Ferro 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (38, 1301335000, 'Caixa Supreme', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (39, 1300017007, 'Receber Drop 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (40, 100003013, 'G36C Ext.', 'UNIDADES', 10);
INSERT INTO "public"."storage" VALUES (41, 100003014, 'SG-550 Camoflage', 'UNIDADES', 8);
INSERT INTO "public"."storage" VALUES (42, 100003131, 'AUG A3 LATIN3', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (43, 100003155, 'AUG A3 Brazuca', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (44, 200004026, 'Kriss S.V Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (45, 200004126, 'Kriss S.V Inferno', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (46, 200018006, 'Dual Micro Uzi', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (47, 300005032, 'Barrett M82A1 Qty', 'UNIDADES', 19);
INSERT INTO "public"."storage" VALUES (48, 1302014000, 'Caixa Woody A', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (49, 100003280, 'AUG A3 Woody', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (50, 100003281, 'XM8 Woody', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (51, 400006075, 'M1887 Woody', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (52, 100003209, 'Vz.52 BlackPearl', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (53, 100003043, 'M4 SR-16 Lv2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (54, 200004024, 'MP5K G D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (55, 1302016000, 'Caixa Woody B', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (56, 200004300, 'OA-93 Woody', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (57, 300005175, 'Cheytac M200 Woody', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (58, 601014020, 'Scorpion Vz.61 Woody', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (59, 100003226, 'SC-2010 Medical', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (60, 702001161, 'Fang Blade Supreme', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (61, 1301901000, 'Caixa Horror', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (62, 100003232, 'AUG A3 Horror', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (63, 1104003214, 'Mascara Horror', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (64, 300005131, 'Cheytac M200 Horror', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (65, 200004239, 'P90 Ext Horror', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (66, 200004237, 'Kriss S.V Horror', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (67, 1301298000, 'Caixa Alien', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (68, 300005006, 'Dragunov G.', 'UNIDADES', 14);
INSERT INTO "public"."storage" VALUES (69, 300005024, 'PSG1 G.', 'UNIDADES', 16);
INSERT INTO "public"."storage" VALUES (70, 300005064, 'L115A1 LATIN3', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (71, 702001004, 'Amok Kukri', 'UNIDADES', 28);
INSERT INTO "public"."storage" VALUES (72, 702001043, 'Machete G.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (73, 702001049, 'Espada Arabe E-Sport', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (74, 803007006, 'C-5 D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (75, 803007004, 'C-5', 'UNIDADES', 40);
INSERT INTO "public"."storage" VALUES (76, 803007009, 'Granada de Chocolate', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (77, 803007033, 'Granada de Futebol', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (78, 702001002, 'M-9 100U', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (79, 702001021, 'Keris 1D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (80, 601002021, 'Glock 18 D. 7D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (81, 904007005, 'WP Smoke', 'UNIDADES', 42);
INSERT INTO "public"."storage" VALUES (82, 904007015, 'Kit Medico de Chocolate', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (83, 1301051000, 'Trocar Nome do Cla', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (84, 1301052000, 'Alterar Emblema do Clan', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (85, 601002023, 'IMI Uzi', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (86, 200004106, 'PP-19 Bizon', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (87, 100003048, 'AUG A3 Black', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (88, 100003094, 'SCAR-L Carbine', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (89, 100003115, 'AN-94', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (90, 100003118, 'Pindad Reload', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (91, 100003001, 'SG-550 Ext.', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (92, 100003002, 'AK-47 Ext.', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (93, 100003003, 'M4A1 Ext.', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (94, 100003009, 'F2000 Ext.', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (95, 100003150, 'TAR-21 Midnight', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (96, 100003159, 'AUG A3 PBIC2014', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (97, 200004001, 'MP5 Ext.', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (98, 200004004, 'MP7 Ext.', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (99, 200004008, 'UMP45 Ext.', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (100, 200004009, 'Spectre W.', 'UNIDADES', 20);
INSERT INTO "public"."storage" VALUES (101, 200004013, 'Kriss S.V', 'UNIDADES', 24);
INSERT INTO "public"."storage" VALUES (102, 200004021, 'K-1 Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (103, 200004039, 'Kriss S.V Black', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (104, 200004096, 'AKS74U Reload', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (105, 200004097, 'UMP45 Reload', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (106, 200004098, 'Spectre Reload', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (107, 200004099, 'SS1-R5 Reload', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (108, 200004100, 'MP5K Reload', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (109, 601014004, 'Dual-Eagle G.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (110, 200004134, 'OA-93', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (111, 200018004, 'Dual Uzi', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (112, 200018013, 'Dual Mini Uzi G.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (113, 300005015, 'L115A1 G', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (114, 300005026, 'L115A1 Black', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (115, 300005030, 'Cheytac M200', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (116, 300005034, 'DSR-1', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (117, 300005035, 'SVU', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (118, 300005072, 'Walther WA2000', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (119, 300005098, 'DSR-1 D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (120, 400006016, 'SPAS 15 Sl', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (121, 601002011, 'Glock 18', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (122, 601002035, 'MK.23 Reload', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (123, 601002036, 'Desert Eagle Reload', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (124, 601014002, 'Dual D-Eagle', 'UNIDADES', 32);
INSERT INTO "public"."storage" VALUES (125, 702001017, 'Fang Blade', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (126, 803007027, 'M14 Mine', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (127, 1001002008, 'Leopard', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (128, 1104003018, 'Mascara Jason', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (129, 1104003019, 'Mascara Panda', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (130, 1104003032, 'Mascara Tigre', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (131, 1104003071, 'Mascara Dinossauro', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (132, 100003036, 'AUG A3', 'UNIDADES', 12);
INSERT INTO "public"."storage" VALUES (133, 100003037, 'AUG A3 G', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (134, 1300035001, 'Explosivo Extra 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (135, 1300038001, 'Gold 100% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (136, 1300119001, 'Gold 50% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (137, 1300004001, 'Gold 30% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (138, 1300003001, 'Exp 50% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (139, 1300002001, 'Exp 30% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (140, 1300026001, 'Troca Rapida 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (141, 1300027001, 'Recarregamento rapido 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (142, 300005083, 'Cheytac M200 Brazuca', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (143, 400006037, 'M1887 Brazuca', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (144, 100003050, 'Famas G2 Commando', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (145, 100003096, 'SCAR-L F.C', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (146, 100003111, 'AUG A3 BR Camo', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (147, 100003116, 'F2000 Reload', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (148, 100003117, 'SG550 Reload', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (149, 100003123, 'TAR-21', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (150, 100003015, 'AK SOPMOD', 'UNIDADES', 12);
INSERT INTO "public"."storage" VALUES (151, 100003143, 'FG-42', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (152, 100003153, 'SC-2010', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (153, 200004010, 'P90 M.C', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (154, 200004011, 'P90 Ext.', 'UNIDADES', 22);
INSERT INTO "public"."storage" VALUES (155, 200004107, 'MP9 Ext', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (156, 300005005, 'L115A1', 'UNIDADES', 18);
INSERT INTO "public"."storage" VALUES (157, 200004114, 'P90 Ext. BR Camo', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (158, 300005022, 'Rangemaster 7.62', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (159, 300005081, 'L115A1 GSL2014', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (160, 400006004, '870MCS W.', 'UNIDADES', 35);
INSERT INTO "public"."storage" VALUES (161, 601002007, 'C. Phyton', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (162, 601002016, 'RB 454 SS8M+S', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (163, 601002049, 'C. Phyton Brazuca', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (164, 601014007, 'Dual HK45', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (165, 702001018, 'Ballistic Knife', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (166, 702001024, 'Alcacuz', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (167, 1001002009, 'Hide', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (168, 702015001, 'Dual Knife', 'UNIDADES', 26);
INSERT INTO "public"."storage" VALUES (169, 702015002, 'Dual Knife D.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (170, 702015003, 'Faca de Osso', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (171, 1001001010, 'Viper Red +30P', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (172, 1001001015, 'CB DFox', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (173, 1001001017, 'CB ViperRed', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (174, 1001001034, 'Scarlett', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (175, 1001001054, 'Tarantula 2014', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (176, 1001002016, 'CB Leopard', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (177, 1001002018, 'CB Hide', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (178, 1001002033, 'Chou', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (179, 1001002035, 'Reinforced Chou', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (180, 1001002053, 'Hide 2014', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (181, 1006003032, 'Dino Elite', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (182, 1006003044, 'Reinforced Raptor', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (183, 1006003045, 'Reinforced Sting', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (184, 1006003046, 'Reinforced Acid', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (185, 1104003097, 'Mascara Determinado', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (186, 1104003101, 'Mascara Cranio G', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (187, 1104003178, 'Mascara Brazuca', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (188, 1301047000, 'Trocar Nick', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (189, 1300014001, 'Cor nova da mira 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (190, 904007007, 'WP Smoke D.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (191, 702023002, 'Soco Ingles Preto', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (192, 702023003, 'Soco Ingles Brass', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (193, 702023004, 'Soco Ingles Prata', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (194, 702023005, 'Soco Ingles Halloween', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (195, 702023006, 'Soco Ingles Espinhos', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (196, 100003147, 'AUG A3 Inferno', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (197, 702023007, 'Soco Ingles Ballock', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (198, 702001066, 'Foice da Morte', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (199, 200004075, 'P90 Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (200, 200004165, 'OA-93 Xmas', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (201, 200004167, 'PP-19 Xmas', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (202, 200004168, 'Kriss Xmas', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (203, 200018005, 'Dual Mini-Uzi', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (204, 200018007, 'Dual Uzi Silenciada', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (205, 200018009, 'Dual Micro-Uzi Silenciada', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (206, 200018011, 'Dual Mini Uzi Silenciada Sl.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (207, 300005001, 'Dragunov', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (208, 400006018, 'SPAS-15 MSC', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (209, 601002017, 'C. Phyton G', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (210, 601002018, 'C. Phyton G.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (211, 702001007, 'Mini Axe', 'UNIDADES', 29);
INSERT INTO "public"."storage" VALUES (212, 1301053000, 'Reiniciar Clan Win/Losers', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (213, 702001014, 'Machete C.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (214, 803007020, 'Granada de acucar', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (215, 904007003, 'Flash', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (216, 904007010, 'Smoke Plus', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (217, 904007013, 'Flash Plus', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (218, 904007014, 'Kit Medico Hallonween', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (219, 904007021, 'Kit Medico Lotus', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (220, 1001001003, 'Tarantula', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (221, 1001001007, 'D-Fox +20XP', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (222, 1001001036, 'Reinforced Rica', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (223, 1301085000, 'PB Inspector', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (224, 1102003003, 'Capa. avan.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (225, 1102003006, 'Capa. rastre.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (226, 1102003007, 'Capa. avan. P', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (227, 1102003008, 'Capa. Super', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (228, 1104003006, 'MÃƒÆ’Ã‚Â¡scara de Fogo', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (229, 1104003010, 'Mascara Abobora', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (230, 1104003016, 'M. Alien Red', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (231, 1104003015, 'M. Alien Blue', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (232, 1104003039, 'Mascara Demonio', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (233, 1301048000, 'Resetar Win/Losers', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (234, 1301049000, 'Resetar Kill/Death', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (235, 1301050000, 'Resetar Desistencias', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (236, 400006020, 'Kel-Tec KSG-15', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (237, 1200080000, '100% XP', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (238, 1200038000, 'Gold 100%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (239, 1200035000, 'Explosivo Extra', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (240, 1200031000, 'Bala de Ferro', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (241, 1200027000, 'Recarregamento rapido', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (242, 1200026000, 'Troca Rapida', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (243, 1200014000, 'Cor nova da mira', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (244, 1200004000, 'Gold 30%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (245, 1200003000, 'Exp 50%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (246, 1200002000, 'Exp 30%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (247, 1300028001, 'Mega HP 10% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (248, 1200028000, 'Mega HP', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (249, 1300040001, 'Mega HP 5% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (250, 1200040000, 'Mega HP 5%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (251, 1300006001, 'Apelido Colorido', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (252, 1200006000, 'Apelido Colorido', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (253, 1300030001, 'Colete 5% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (254, 1200030000, 'Colete 5%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (255, 1300044001, 'Colete 10% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (256, 1200044000, 'Colete 10%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (257, 1300032001, 'Hollow Point 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (258, 1200032000, 'Hollow Point', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (259, 1300080001, 'Respawn 100% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (260, 1300064001, 'Respawn 50% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (261, 1200064000, 'Respawn 50%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (262, 1200007000, 'Respawn 30%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (263, 1300011001, 'O Bom Perdedor 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (264, 1200011000, 'O Bom Perdedor', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (265, 1300008001, '40% de Municao 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (266, 1200008000, '40% de Municao', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (267, 100003051, 'Famas G2 Sniper', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (268, 100003052, 'Famas G2 M203', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (269, 100003068, 'AK-47 F.C Red', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (270, 100003064, 'Famas G2 Commando G.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (271, 100003087, 'Famas G2 Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (272, 200004007, 'MP5K G.', 'UNIDADES', 20);
INSERT INTO "public"."storage" VALUES (273, 200004022, 'MP7 Sl', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (274, 200004027, 'P90 M.C.S', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (275, 200004050, 'Kriss S.V E-Sport', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (276, 200004113, 'P90 M.C Latin3', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (277, 200004132, 'Kriss S.V Midnight', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (278, 200004130, 'Kriss S.V GSL2014', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (279, 200004139, 'Kriss S.V Brazuca', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (280, 200004146, 'P90 Ext. PBIC2014', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (281, 300005033, 'L115A1 E-Sport', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (282, 300005065, 'L115A1 BR Camo', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (283, 300005079, 'Cheytac M200 Inferno', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (284, 300005087, 'Cheytac M200 PBIC2014', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (285, 400006003, 'SPAS-15', 'UNIDADES', 37);
INSERT INTO "public"."storage" VALUES (286, 400006010, 'M1887 W.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (287, 400006036, 'Kelten GSL2014', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (288, 400006038, 'M1887 PBIC2014', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (289, 601002002, 'MK.23 Ext', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (290, 601013001, 'P99&HAK', 'UNIDADES', 30);
INSERT INTO "public"."storage" VALUES (291, 601014001, 'Dual Handgun', 'UNIDADES', 32);
INSERT INTO "public"."storage" VALUES (292, 702001012, 'Mini Axe D.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (293, 702001051, 'Fang GSL2014', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (294, 702001057, 'Fang Inferno', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (295, 1104003012, 'Golden Mask', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (296, 1104003096, 'Mascara Troll', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (297, 1104003098, 'Mascara Fuu', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (298, 1104003120, 'Mascara da Morte', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (299, 1200119000, 'Gold 50%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (300, 1300079001, 'Colete 20% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (301, 1200079000, 'Colete 20%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (302, 1300037001, 'Exp 100% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (303, 1200037000, 'Exp 100%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (304, 1300034001, 'C4 Speed 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (305, 1200034000, 'C4 Speed', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (306, 1200036000, 'Hollow Point Fortificada 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (307, 1300009001, 'Patente Falsa 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (308, 1200009000, 'Patente Falsa', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (309, 1301203000, 'Caixa E-Sports 2', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (310, 100003263, 'AUG A3 E-Sports 2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (311, 300005161, 'Tactilite T2 E-Sports 2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (312, 200004270, 'Kriss S.V E-Sports 2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (313, 100003264, 'Famas G2 M203 E-Sports 2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (314, 702015012, 'Kunai Serpent', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (315, 100003248, 'AUG A3 VeraCruz 2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (316, 300005143, 'Cheytac M200 VeraCruz 2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (317, 601002081, 'RB 454 SS8M+S VeraCruz 2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (318, 100003114, 'M4A1 Elite', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (319, 100003045, 'M4 SR-16 F.C', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (320, 100003127, 'M4A1 S.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (321, 100003023, 'M4A1 G.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (322, 100003021, 'M4A1 Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (323, 100003022, 'M4A1 White', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (324, 1103003007, 'Boina Che-Vermelha', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (325, 1301525000, 'Caixa M4A1 Elite', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (326, 400006006, 'SPAS-15 Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (327, 500010002, 'MK46 Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (328, 100003034, 'G36C Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (329, 601013002, 'P99&HAK Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (330, 300005009, 'PSG-1 Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (331, 1301059000, 'Caixa de Armas', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (332, 1001002004, 'Keen Eyes', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (333, 1301202000, 'Caixa Silence', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (334, 100003249, 'AUG A3 Silence', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (335, 300005144, 'Cheytac M200 Silence', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (336, 200004108, 'Kriss S.V Silence', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (337, 702015011, 'Dual Knife Vera Cruz 2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (338, 1301240000, 'Caixa Cupido', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (339, 100003250, 'AUG A3 Cupido', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (340, 300005147, 'Cheytac M200 Cupido', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (341, 200004017, 'P90 Ext Cupido', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (342, 400006065, 'M1887 Cupido', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (343, 200004005, 'Kriss S.V Cupido', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (344, 1001002067, 'Hide Strike', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (345, 1001001068, 'Viper Kopassus', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (346, 100003193, 'AUG A3 LionFlame', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (347, 300005108, 'Cheytac M200 LionFlame', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (348, 1200005000, 'Clan Color', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (349, 702001122, 'Butterfly Knife', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (350, 300005145, 'PGM Hecate2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (351, 300005123, 'Tactilite T2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (352, 100003184, 'AUG A3 Newborn2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (353, 1300242001, 'Especial Extra 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (354, 1200242000, 'Especial Extra', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (355, 1300078001, 'Hollow Point Plus 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (356, 1200078000, 'Hollow Point Plus', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (357, 601002070, 'R.B 454 PBIC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (358, 702001104, 'Keris PBIC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (359, 1104003209, 'Mascara Premium PBIC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (360, 1104003210, 'Mascara PBIC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (361, 1201091000, 'Ketupat', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (362, 1300029030, 'Invunerabilidade 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (363, 1200029000, 'Invunerabilidade', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (364, 1300033030, 'Anti-Flash 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (365, 1200033000, 'Anti-Flash', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (366, 1300065001, 'Colete 90% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (367, 100003256, 'AUG A3 Beast', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (368, 300005151, 'Cheytac M200 Beast', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (369, 200004258, 'Kriss S.V Beast', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (370, 400006067, 'M1887 Beast', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (371, 100003195, 'AUG A3 Brasil', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (372, 300005110, 'Cheytac M200 Brasil', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (373, 601002060, 'C. Phyton Brazil', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (374, 702001093, 'Machete de Combate Brasil', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (375, 200004200, 'P90 M.C Brasil', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (376, 1103003017, 'Boina Brasil', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (377, 702015008, 'Kunai', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (378, 200004251, 'OA-93 XMAS2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (379, 100003183, 'AUG A3 GRS2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (380, 300005097, 'Cheytac M200 Cangaceiro', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (381, 702001009, 'M7 Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (382, 1301091005, 'Ketupat', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (383, 100003266, 'AUG A3 PBWC2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (384, 200004273, 'OA-93 PBWC2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (385, 200004275, 'Kriss S.V PBWC2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (386, 200004277, 'P90 Ext PBWC2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (387, 300005163, 'Tactilite T2 PBWC2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (388, 601002087, 'C. Phyton PBWC2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (389, 702001137, 'Amok Kukri PBWC2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (390, 702001138, 'Machete de Combate PBWC2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (391, 803007056, 'C-5 PBWC2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (392, 100003275, 'AUG A3 Dolphin', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (393, 100003190, 'AUG A3 Summer', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (394, 100003178, 'AUG A3 Couple Breaker', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (395, 100003180, 'AUG A3 ANC 2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (396, 100003181, 'AUG A3 Sheep', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (397, 100003154, 'SC-2010 Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (398, 100003169, 'Tar-21 Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (399, 200004161, 'MP9 Ext Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (400, 200004162, 'PP-19 Bizon Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (401, 200004219, 'P90 M.C Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (402, 601002071, 'Glock 18 Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (403, 400006059, 'M1887 Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (404, 100003095, 'SCAR-L Recon', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (405, 1104003196, 'Mascara LionFlame', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (406, 400006005, 'M1887', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (407, 300005125, 'L115A1 Basketball', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (408, 200004170, 'Kriss S.V Couple Breaker', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (409, 200004174, 'P90 M.C Sheep', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (410, 100003277, 'AUG A3 Blue Diamond', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (411, 200004292, 'OA-93 Blue Diamond', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (412, 300005170, 'Cheytac M200 Blue Diamond', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (413, 300005171, 'Tactilite T2 Blue Diamond', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (414, 400006073, 'SPAS-15 Blue Diamond', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (415, 601002089, 'MK.23 Blue Diamond', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (416, 1104003237, 'Mascara Blue Diamond', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (417, 1301619000, 'Mix PBIC', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (418, 300005090, 'Cheytac M200 Tiger', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (419, 601013008, 'C. Phython Cutlass', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (420, 400006061, 'M1887 Medical', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (421, 300005076, 'Dragunov Elite', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (422, 100003165, 'AUG A3 Toy', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (423, 100003223, 'M14-EBR', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (424, 300005104, 'Cheytac M200 Ongame', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (425, 200004227, 'P90 Ext Basketball', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (426, 1300035003, 'Explosivo Extra 3D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (427, 904007011, 'Medical Kit', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (428, 1301561000, 'Pacote de Armas CM', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (429, 1104003182, 'Mascara PBIC2014', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (430, 100003120, 'AUG A3 PBIC2013', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (431, 100003071, 'AUG A3 IC', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (432, 200004103, 'Kriss S.V PBIC2013', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (433, 200004060, 'Kriss S.V IC', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (434, 100003121, 'M4A1 PBIC2013', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (435, 100003122, 'AK-47 PBIC2013', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (436, 601014005, 'Dual Handgun D.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (437, 601002024, 'Kriss S.V Vector SDP', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (438, 702001011, 'Amok Kukri D.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (439, 702001058, 'Chinese Cleaver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (440, 100003149, 'AUG A3 GSL2014', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (441, 702001147, 'Karambit', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (442, 1301153000, 'Caixa Sakura', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (443, 100003251, 'AUG A3 Sakura', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (444, 300005148, 'Cheytac M200 Sakura', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (445, 100003252, 'AK SOPMOD Sakura', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (446, 200004115, 'Kriss S.V Sakura', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (447, 601002082, 'C. Phyton Sakura', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (448, 200004220, 'P90 M.C VeraCruz', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (449, 300005055, 'Cheytac M200 GSL', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (450, 1301121000, 'Gold Bomb Premium', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (451, 1301117000, '10K de Gold', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (452, 1301300000, 'Caixa Dolphin', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (453, 1301326000, 'Caixa DarkSteel', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (454, 100003295, 'AUG A3 DarkSteel', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (455, 200004318, 'Kriss S.V DarkSteel', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (456, 200004320, 'P90 Ext DarkSteel', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (457, 300005185, 'Cheytac M200 DarkSteel', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (458, 200004216, 'Kriss S.V PBIC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (459, 300005120, 'Cheytac M200 PBIC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (460, 400006058, 'M1887 PBIC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (461, 200004218, 'P90 Ext PBIC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (462, 400006080, 'M1887 DarkSteel', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (463, 601002098, 'C. Phyton DarkSteel', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (464, 702001159, 'Fang Blade DarkSteel', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (465, 100003301, 'AK-12 Georgeous', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (466, 100003302, 'AUG A3 Georgeous', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (467, 200004330, 'Kriss S.V Georgeous', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (468, 200004332, 'OA-93 Georgeous', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (469, 601014021, 'Scorpion Vz.61 Georgeous', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (470, 400006083, 'M1887 Georgeous', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (471, 400006084, 'Cerberus Georgeous', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (472, 601002094, 'U22 Neos', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (473, 300005068, 'XM2010', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (474, 1200010000, 'Apelido Temporario', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (475, 904007059, 'Smoke Azul', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (476, 1301212000, 'Caixa Dragon', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (477, 100003265, 'AUG A3 Dragon', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (478, 300005162, 'Tactilite T2 Dragon', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (479, 200004272, 'P90 Ext Dragon', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (480, 400006070, 'M1887 Dragon', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (481, 702001127, 'Fang Blade Sakura', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (482, 1300242005, 'Especial Extra 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (483, 1300119005, 'Gold 50% 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (484, 702015015, 'Dual Sword', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (485, 300005146, 'PGM Hecate2 G', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (486, 300005132, 'Tactilite T2 G', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (487, 1300079005, 'Colete 20% 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (488, 1300078005, 'Hollow Point Plus 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (489, 1300065005, 'Colete 90% 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (490, 1300064005, 'Respawn 50% 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (491, 1300044005, 'Colete 10% 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (492, 1300040005, 'Mega HP 5% 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (493, 1300038005, 'Gold 100% 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (494, 1300037005, 'Exp 100% 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (495, 1300036005, 'Hollow Point Fortificada 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (496, 1300035005, 'Explosivo Extra 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (497, 1300034005, 'C4 Speed 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (498, 1300032005, 'Hollow Point 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (499, 1300031005, 'Bala de Ferro 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (500, 1300030005, 'Colete 5% 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (501, 1300028005, 'Mega HP 10% 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (502, 300005014, 'Dragunov Gold D.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (503, 1300027005, 'Recarregamento rapido 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (504, 1300026005, 'Troca Rapida 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (505, 1300017005, 'Pegar arma do oponente 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (506, 1300014005, 'Cor nova da mira 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (507, 1300011005, 'O Bom Perdedor 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (508, 1300010001, 'Apelido Temporario', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (509, 1300009005, 'Patente Falsa 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (510, 1300007001, 'Respawn 30% 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (511, 1300005001, 'Clan Color', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (512, 300005168, 'Cheytac M200 Dolphin', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (513, 1301211000, 'Caixa Mummy', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (514, 100003267, 'AUG A3 Mummy', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (515, 702001139, 'Amok Kukri Mummy', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (516, 200004278, 'Kriss S.V Mummy', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (517, 803007057, 'Granada Mummy', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (518, 1104003234, 'Mask Mummy', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (519, 500010014, 'Ultimax 100 Mummy', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (520, 200004291, 'P90 Ext Dolphin', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (521, 200004289, 'Kriss S.V Dolphin', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (522, 100003276, 'SC-2010 Dolphin', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (523, 300005169, 'L115A1 Dolphin', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (524, 400006072, 'M1887 Dolphin', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (525, 702001140, 'Mini Axe Poison', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (526, 1300006005, 'Apelido Colorido 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (527, 1300005005, 'Nome do Clan Colorido 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (528, 1300004005, 'Gold 30% 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (529, 1300003005, 'Exp 50% 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (530, 1300002005, 'Exp 30% 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (531, 1200185000, '10% de municao', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (532, 100003284, 'Groza', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (533, 100003236, 'K2C', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (534, 100003177, 'XM8 Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (535, 1103003011, 'PB Black Beret', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (536, 110010030, 'TESTE SET2', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (537, 100003217, 'AUG A3 DarkDays', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (538, 200004212, 'Kriss S.V DarkDays', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (539, 300005118, 'Cheytac M200 DarkDays', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (540, 601002069, 'Kriss Vector SDP DarkDays', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (541, 904007061, 'Smoke Amarela', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (542, 1200077000, 'Respawn 20%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (543, 1300077005, 'Respawn 20% 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (544, 100003271, 'AUG A3 ID 1stAnni', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (545, 200004280, 'Kriss S.V ID 1stAnni', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (546, 300005165, 'Cheytac M200 ID 1stAnni', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (547, 400006071, 'M1887 ID 1stAnni', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (548, 200004282, 'P90 Ext 1stAnni', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (549, 904007022, 'WP Smoke P.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (550, 100003246, 'AK 12', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (551, 100003119, 'AK 47 Elite', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (552, 300005096, 'Cheytac M200 LATIN4', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (553, 400006043, 'Remington ETA', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (554, 702001069, 'Ice Fork', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (555, 1104003248, 'Mascara Clown BR', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (556, 1104003250, 'Mascara Chain', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (557, 1104003235, 'ID 1stAnni Mask', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (558, 100003174, 'XM8', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (559, 1300007005, 'Respawn 30%', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (560, 100003285, 'Groza G.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (561, 1300010005, 'Apelido Temporario', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (562, 1104003009, 'MÃƒÆ’Ã‚Â¡scara No Alvo', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (563, 1301152000, 'Caixa Beast', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (564, 300005121, 'Cheytac M200 Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (565, 1103003016, 'Boina de General', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (566, 601002012, 'C. Phyton D.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (567, 300005176, 'Tactilite T2 Newborn 2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (568, 702001150, 'Machete de Combate Newborn 2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (569, 1300080005, '100% XP 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (570, 1300029005, 'Invunerabilidade', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (571, 601002088, 'Glock 18 Mummy', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (572, 1300185005, '10% de municao 5D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (573, 702001144, 'Keris ID 1stAnni', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (574, 1001002062, 'Acid Pol Infectado', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (575, 1001002064, 'Hide Infectada', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (576, 1001002065, 'Leopard Infectado', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (577, 100003268, 'Pindad SS2 V5', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (578, 300005177, 'Tactilite T2 Puzzle', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (579, 300005157, 'AS-50', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (580, 100003259, 'AUG-A3 Tiger-Normal', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (581, 300005155, 'Cheytac M200 Tiger-Normal', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (582, 702001132, 'Fang Blade Tiger-Normal', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (583, 803007054, 'K-413 Tiger-Normal', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (584, 100003260, 'AUG-A3 Tiger-Deluxe', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (585, 300005156, 'Cheytac M200 Tiger-Deluxe', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (586, 1300029001, 'Invunerabilidade', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (587, 1300031001, 'Bala de Ferro 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (588, 1104003014, 'Mascara Palhaco', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (589, 1300008005, '40% de Municao', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (590, 1200017000, 'Pegar arma do oponente', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (591, 1300036001, 'Hollow Point Fortificada 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (592, 200004020, 'Spectre Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (593, 1103003018, 'Boina Vera Cruz 2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (594, 100003219, 'AUG A3 PBIC2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (595, 100003287, 'SC-2010 Dracula', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (596, 100003279, 'AUG A3 Alien', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (597, 1301210000, 'Caixa PBWC2016', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (598, 200004043, 'SS1-R5 Carabine', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (599, 200004164, 'MP9 Xmas', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (600, 400006042, 'Zombie Slayer', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (601, 1105003004, 'Chapeu de Cowboy', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (602, 803007008, 'K-413', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (603, 803007018, 'K-413 G', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (604, 1301097000, '???', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (605, 1001002063, 'Keen Eyes Infectada', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (606, 200004288, 'P90 Ext Demonic', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (607, 300005167, 'Cheytac M200 Demonic', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (608, 702001133, 'Fang Blade Tiger-Deluxe', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (609, 803007055, 'K-413 Tiger-Deluxe', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (610, 1104003230, 'Mascara Tiger-Deluxe', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (611, 300005184, 'AS 50 PBTC2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (612, 300005183, 'Cheytac M200 PBTC2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (613, 1301241000, 'Caixa Demonic', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (614, 1300017001, 'Pegar arma do oponente 1D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (615, 904007058, 'Smoke Rosa', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (616, 300005091, 'Cheytac M200 G E-Sport', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (617, 100003274, 'AUG A3 Demonic', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (618, 200004286, 'Kriss S.V Demonic', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (619, 702001129, 'Keris Beast', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (620, 100003099, 'AK SOPMOD GRS', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (621, 300005012, 'Dragunov CG.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (622, 601014011, 'Dual D-Eagle GRS', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (623, 1301055000, '+50 Membros no clan', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (624, 100003054, 'AK-47 G.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (625, 300005159, 'AS-50 G', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (626, 400006015, '870MSC D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (627, 702001025, 'Field Shovel', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (628, 601002013, 'R.B 454 SS2M', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (629, 601002014, 'R.B 454 SS5M', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (630, 601002015, 'R.B 454 SS8M', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (631, 1104003007, 'MÃƒÆ’Ã‚Â¡scara Duas Cores', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (632, 1300027003, 'Recarregamento Rapido 3D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (633, 1300031003, 'Bala de Ferro 3D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (634, 1300026003, 'Troca Rapida 3D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (635, 1300044003, 'Colete 10% 3D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (636, 1300034003, 'C4 Speed 3D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (637, 1300011003, 'O Bom Perdedor 3D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (638, 1300064003, 'Respawn 50% 3D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (639, 100003040, 'AUG A3 D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (640, 1300035030, 'Explosivo Extra 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (641, 300005099, 'Cheytac M200 Couple Breaker', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (642, 100003300, 'AUG A3 Halloween 2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (643, 702001162, 'Halloween Hammer', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (644, 200004328, 'OA-93 Halloween 2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (645, 300005189, 'Cheytac M200 Halloween 2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (646, 1302017000, 'Caixa Halloween 2016', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (647, 1001002052, 'Leopard Skull', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (648, 1001002012, 'Reinforced Leopard', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (649, 1001001011, 'Reinforced D-Fox', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (650, 100003093, 'AUG A3 Blaze', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (651, 1300027030, 'Recarregamento Rapido 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (652, 1103003006, 'Boina Negra', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (653, 1103003014, 'Boina Skull', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (654, 1301852000, 'Caixa de Personagens A', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (655, 1301794000, 'Caixa PBIC2015', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (656, 1301120000, 'Gold Bomb Basic', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (657, 1301154000, 'Caixa Serpent', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (658, 100003253, 'AUG A3 Serpent', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (659, 300005149, 'Cheytac M200 Serpent', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (660, 200004118, 'P90 Ext Serpent', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (661, 200004116, 'Kriss S.V Serpent', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (662, 1301853000, 'Caixa de Personagens B', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (663, 1001002014, 'Reinforced Hide', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (664, 1001001013, 'Reinforced Viper Red', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (665, 1102003002, 'Capacete Comum', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (666, 100003029, 'G36C Ext Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (667, 300005010, 'Dragunov Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (668, 100003011, 'K-201', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (669, 300005008, 'SSG 69 Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (670, 100003019, 'SG-550 Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (671, 200004014, 'MP5K Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (672, 200018008, 'Mini Uzi Dupla Silenciada', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (673, 100003258, 'AUG A3 GSL2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (674, 601002084, 'C. Phyton GSL2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (675, 200004263, 'Kriss S.V GSL2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (676, 300005153, 'Cheytac M200 GSL2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (677, 300005154, 'Tactilite T2 GSL2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (678, 702001149, 'Fang Blade Alien', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (679, 702001143, 'Amok Kukri Poison', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (680, 300005173, 'Cheytac M200 Alien', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (681, 200004297, 'P90 Ext Alien', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (682, 300005174, 'L115A1 Alien', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (683, 200004298, 'Kriss S.V Alien', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (684, 100003282, 'Famas G2 Newborn2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (685, 601002092, 'C. Python Newborn2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (686, 200004302, 'OA-93 Newborn2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (687, 400006076, 'M1887 Newborn2016', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (688, 100003299, 'AUG A3 Supreme', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (689, 601002100, 'C. Python Supreme', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (690, 200004325, 'Kriss S.V Supreme', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (691, 300005188, 'Cheytac M200 Supreme', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (692, 200004327, 'P90 Ext Supreme', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (693, 400006082, 'M1887 Supreme', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (694, 601002091, 'MK.23 Alien', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (695, 1104003129, 'Mascara PBIC 2013', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (696, 1104003107, 'Mascara PBIC 2012', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (697, 1300036003, 'Hollow Point Fortificada 3D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (698, 1300032003, 'Hollow Point 3D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (699, 200004076, 'AKS74U', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (700, 200004138, 'P90 Ext Brazuca', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (701, 300005021, 'Rangemaster .338', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (702, 300005023, 'Rangemaster 7.62 STBY', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (703, 1104003013, 'Mascara de CrÃƒÆ’Ã‚Â¢nio', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (704, 1105003001, 'Gorro Noel', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (705, 1105003009, 'BonÃƒÆ’Ã‚Â© Pirocoptero', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (706, 1301666000, 'Token Dourado', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (707, 1104003034, 'Rorschach Mask', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (708, 1104003078, 'MÃƒÆ’Ã‚Â¡scara Chinesa Vermelha', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (709, 1104003079, 'Red Eyes Mask', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (710, 1301305000, 'Caixa GSL2016', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (711, 300005139, 'Tactilite T2 XMAS2015', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (712, 100003157, 'AUG A3 Champion', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (713, 100003148, 'AUG A3 PBNC5', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (714, 100003128, 'AUG A3 Azerbaijan', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (715, 100003158, 'AUG A3 W.O.E', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (716, 100003171, 'AUG A3 Latin4', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (717, 100003164, 'AUG A3 G E-Sport', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (718, 100003188, 'AUG A3 Ongame', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (719, 100003192, 'AUG A3 Rose', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (720, 702001052, 'Fang Blade Brazuca', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (721, 702001041, 'Arabian Sword', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (722, 1001002051, 'Hide Kopassus', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (723, 904007012, 'WP Smoke Plus', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (724, 1001002019, 'Reinforced Acil Pol', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (725, 601002029, 'GL-06', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (726, 500010011, 'Ultimax-100', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (727, 400006039, 'UTS-15', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (728, 200004159, 'OA-93 D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (729, 702001064, 'Badminton Racket', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (730, 400006017, 'M1887 D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (731, 601002005, 'D-Eagle Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (732, 601014006, 'Dual D-Eagle D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (733, 1103003001, 'Boina de Assalto', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (734, 1103003003, 'Boina de Snipers', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (735, 1103003002, 'Boina de SMG', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (736, 1103003004, 'Boina de Shotgun', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (737, 1103003005, 'Boina de Pistoleiro', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (738, 400006041, 'M1887 Lion-Heart', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (739, 100003086, 'AK-47 Goddess', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (740, 803007035, 'M-14 Mine D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (741, 1104003008, 'Hockey Mask', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (742, 1300185007, '10% de MuniÃƒÆ’Ã‚Â§ÃƒÆ’Ã‚Â£o 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (743, 200004144, 'Kriss S.V W.O.E', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (744, 300005085, 'Cheytac M200 W.O.E', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (745, 300005086, 'Dragunov W.O.E', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (746, 1104003023, 'MÃƒÆ’Ã‚Â¡scara Brasil', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (747, 702015014, 'Faca de Osso E-Sports2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (748, 1301663000, 'Caixa Everyday Login Box', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (749, 1104003233, 'Mascara E-Sports2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (750, 500010013, 'Ultimax 100 Madness', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (751, 601014018, 'Scorpion Vz.61 G.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (752, 803007040, 'M18A1 Claymore', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (753, 1300040030, 'Mega HP 5% 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (754, 100003058, 'AK-47 F.C', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (755, 1103003009, 'Boina Che Guevara', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (756, 1300028030, 'Mega HP 10% 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (757, 100016001, 'RPG', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (758, 100003191, 'SC-2010 Rose', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (759, 200004195, 'P90 M.C Rose', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (760, 300005107, 'Dragunov Rose', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (761, 601002059, 'C. Phyton Rose', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (762, 702001084, 'Machete de Combate Rose', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (763, 1102003009, 'Aureola de Anjo', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (764, 1105003012, 'ChapÃƒÆ’Ã‚Â©u da IndependÃƒÆ’Ã‚Âªncia', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (765, 100003057, 'Vz.52', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (766, 601002022, 'Colt 45', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (767, 300005031, 'Winchester M70', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (768, 1103003008, 'Boina Che Guevara Yellow', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (769, 110010130, 'Boina Che Guevara Red', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (770, 100003062, 'FAMAS G2 E-Sports', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (771, 400006047, 'Cerberus', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (772, 702001109, 'Ballistic Knife Obisidian', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (773, 1301664000, 'Everyday Login Box Plus', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (774, 1300064030, 'Respawn 50% 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (775, 100003257, 'AUG A3 PBGC', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (776, 200004260, 'Kriss S.V PBGC', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (777, 200004262, 'P90 Ext PBGC', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (778, 300005152, 'Cheytac M200 PBGC', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (779, 400006068, 'M1887 PBGC', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (780, 702001130, 'Fang Blade PBGC', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (781, 1104003228, 'MÃƒÆ’Ã‚Â¡scara PBGC', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (782, 100003004, 'K-2', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (783, 200004006, 'K-1', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (784, 300005003, 'SSG69', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (785, 400006001, '870MCS', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (786, 601002003, 'K-5', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (787, 702001001, 'M7', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (788, 702023001, 'Barefirst', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (789, 803007001, 'K-400', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (790, 904007002, 'Smoke', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (791, 1001001005, 'Red Bulls', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (792, 1001002006, 'Acid Pol', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (793, 1102003001, 'Capacete BÃƒÆ’Ã‚Â¡sico', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (794, 1006003041, 'Raptor', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (795, 1006003042, 'Sting', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (796, 1006003043, 'Acid', 'PERMANENTE', 0);
INSERT INTO "public"."storage" VALUES (797, 100003303, 'AUG A3 Mistic', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (798, 702001120, 'Monkey Hammer', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (799, 100003010, 'M4A1 Camoflage with Silencer', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (800, 100003017, 'AK-47 Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (801, 100003032, 'F2000 Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (802, 200004023, 'UMP45 Sl.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (803, 300005004, 'SSG-69 Camoflage', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (804, 400006008, '870MCS SL ', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (805, 100003035, 'SG-550 S D.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (806, 100003038, 'G36C Ext. D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (807, 100003039, 'AK SOPMOD D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (808, 200004025, 'Spectre W D.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (809, 200004029, 'P90 Ext D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (810, 300005016, 'PSG1 S. D ', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (811, 300005017, 'L115A1 D.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (812, 400006011, '870MCS W. D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (813, 400006012, 'SPAS-15 D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (814, 601013003, 'P99 & HAK D. ', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (815, 200004032, 'P90 M.C D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (816, 300005011, 'Dragunov CS. ', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (817, 1104003003, 'Camuflagem Tigre Russo', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (818, 1104003004, 'Camuflagem Naval', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (819, 1104003005, 'Camuflagem Francesa', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (820, 1300002007, 'Exp 30% 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (821, 1300002030, 'Exp 30% 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (822, 1300004007, 'Gold 30% 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (823, 1300004030, 'Gold 30% 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (824, 1300007007, 'Respawn 30% 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (825, 1300007030, 'Respawn 30% 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (826, 1300008007, '40% de MuniÃƒÆ’Ã‚Â§ÃƒÆ’Ã‚Â£o 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (827, 1300008030, '40% de MuniÃƒÆ’Ã‚Â§ÃƒÆ’Ã‚Â£o 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (828, 1104003011, 'Pink Death Mask', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (829, 1301056000, 'Reiniciar Pontos Clan', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (830, 1300032007, 'MuniÃƒÆ’Ã‚Â§ÃƒÆ’Ã‚Â£o Hollow Point 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (831, 1300032030, 'MuniÃƒÆ’Ã‚Â§ÃƒÆ’Ã‚Â£o Hollow Point 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (832, 1300030007, 'Colete 5% 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (833, 1300030030, 'Colete 5% 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (834, 1300035007, 'Explosivo Extra 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (835, 1300064007, 'Respawn 50% 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (836, 1300040007, 'Mega HP 5% 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (837, 601002001, 'Desert Eagle', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (838, 100003005, 'NÃƒÆ’Ã†â€™O SEI', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (839, 500010001, 'MK46 Ext. ', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (840, 300005002, 'PSG-1', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (841, 300005007, 'PSG-1 Silver', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (842, 200004002, 'Spectre Ext.', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (843, 1300003007, 'Exp 50% 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (844, 1300003030, 'Exp 50% 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (845, 300005029, 'VSK94', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (846, 100003041, 'AK SOPMOD CG', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (847, 300005020, 'M4 SRP Lvl-3', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (848, 1104003017, 'MÃƒÆ’Ã‚Â¡scara TemplÃƒÆ’Ã‚Â¡ria', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (849, 1300119007, 'Gold 50% 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (850, 1300119030, 'Gold 50% 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (851, 1300044007, 'Colete 10% 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (852, 200004038, 'MP7 Camoflage', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (853, 100003053, 'SS2-V4 Para Sniper', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (854, 500010003, 'RPD', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (855, 200004034, 'M4 CQB-R lvl-1', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (856, 200004035, 'M4 CQB-R lvl-2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (857, 300005018, 'M4 SPR Lvl-1', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (858, 300005019, 'M4 SRP Lvl-2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (859, 100003042, 'M4 SR-16 lvl-1', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (860, 1300027007, 'Recarregamento RÃƒÆ’Ã‚Â¡pido 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (861, 1300026007, 'Troca RÃƒÆ’Ã‚Â¡pida 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (862, 1300037007, 'Exp 100% 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (863, 1300037030, 'Exp 100% 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (864, 1300038007, 'Gold 100% 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (865, 1300038030, 'Gold 100% 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (866, 1300080007, 'Respawn 100% 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (867, 1300080030, 'Respawn 100% 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (868, 500010004, 'L86 LSW ', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (869, 1300011007, 'O Bom perdedor 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (870, 1300011030, 'O Bom perdedor 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (871, 1301115000, '1000 pontos', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (872, 200004033, 'AKS47U Ext.', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (873, 300005036, 'L115A1 SE', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (874, 100003102, 'HK-417', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (875, 500010007, 'RPD Silver', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (876, 601002028, 'M79', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (877, 601013007, 'P99 & HAK Reload', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (878, 1300014007, 'Cor nova da mira 7d', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (879, 1300014030, 'Cor nova da mira 30D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (880, 100003069, 'SCAR-H CQC', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (881, 601002027, 'MK.23 Silver', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (882, 300005059, 'PSG-1 Reload', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (883, 300005060, 'Rangemaster .338 Reload', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (884, 1104003021, 'MÃƒÆ’Ã‚Â¡scara da Morte', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (885, 100003170, 'SCAR-L Carbine Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (886, 300005094, 'SVU Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (887, 200004036, 'M4 CQB-R lvl-3', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (888, 300005095, 'DSR-1 Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (889, 100003168, 'HK-417 Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (890, 702001059, 'Machete White', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (891, 400006048, 'UTS-15 G.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (892, 1104003192, 'MÃƒÆ’Ã‚Â¡scara Ongame Premium', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (893, 1104003187, 'MÃƒÆ’Ã‚Â¡scara Latin4', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (894, 1104003136, 'Unicorn Mask', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (895, 100003221, 'AK SOPMOD Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (896, 1300028007, 'Mega HP 10% 7D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (897, 601014017, 'Scorpion Vz.61', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (898, 702001023, 'Keris S.', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (899, 300005191, 'Cheytac M200 Mistic', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (900, 601002010, 'Colt Python Gold+', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (901, 1300079007, 'Colete 20% 7D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (902, 1001002027, 'Hide', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (903, 1001001028, 'Viper Red', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (904, 100003104, 'AUG A3 GSL', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (905, 300005092, 'L115A1 Toy', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (906, 100003334, 'AUG A3 Salvation', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (907, 200004377, 'Kriss S.V Salvation', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (908, 200004379, 'OA-93 Salvation', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (909, 300005208, 'Tactilite T2 Salvation', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (910, 100003344, 'AUG A3 Naga', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (911, 200004393, 'Kriss S.V Naga', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (912, 200004395, 'P90 Ext Naga', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (913, 300005214, 'Cheytac M200 Naga', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (914, 400006100, 'M1887 Naga', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (915, 601002116, 'C. Python Naga', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (916, 601013004, 'P99 & HAK Sl. D ', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (917, 100003338, 'MSBS', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (918, 100003340, 'MSBS Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (919, 601002114, 'TEC-9 Gold', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (920, 300005232, 'Barrett M82A1 Premium', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (921, 702001184, 'Karambit CNPB T5', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (922, 1001001286, 'Viper Capitain', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (923, 702001188, 'Karambit Infinitum', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (924, 300005202, 'Tactilite T2 Fire', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (925, 300005229, 'Cheytac M200 Brazuca2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (926, 100003362, 'AUG A3 Brazuca2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (927, 601002121, 'P08 Luger Bracuza2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (928, 100003352, 'AUG A3 CNPB T5', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (929, 300005220, 'Cheytac M200 CNPB T5', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (930, 200004412, 'P90 Ext. CNPB T5', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (931, 1104003287, 'MÃƒÆ’Ã‚Â¡scara CNPB T5', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (932, 100003345, 'AUG A3 Comic', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (933, 100003346, 'AK-47 Comid', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (934, 200004396, 'Kriss S.V ComicD', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (935, 300005215, 'Cheytac M200 Comic', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (936, 400006101, 'M1887 Comic', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (937, 601002117, 'Desert Eagle Comic', 'DIA', 0);
INSERT INTO "public"."storage" VALUES (938, 702001181, 'Amok Kukri Comic', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (939, 1001002175, 'Undercover Hide', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (940, 1001001087, 'Gengster Viper Red', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (941, 100003325, 'AUG A3 Mech Hero', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (942, 200004362, 'OA-93 Mech Hero', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (943, 300005201, 'Tactilite T2 Mech Hero', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (944, 400006091, 'Remington ETA Mech Hero', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (945, 601002110, 'Kriss Vector SDP Mech Hero', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (946, 1104003274, 'MÃƒÆ’Ã‚Â¡scara Mech Hero', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (947, 1300006010, 'Apelido Colorido 10D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (948, 1105003005, 'Bandana 100U', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (949, 100003261, 'AUG A3 Midnight2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (950, 300005158, 'Cheytac M200 Midnight2', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (951, 1300009007, 'Patente Falsa 7D', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (952, 100003262, 'AUG A3 Skelleton', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (953, 200004267, 'Kriss S.V Skelleton', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (954, 200004269, 'P90 Ext. Skelleton', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (955, 300005160, 'Cheytac M200 Skelleton', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (956, 702015013, 'Faca de Osso Skelleton', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (957, 300005052, 'Cheytac M200 GRS', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (958, 100003097, 'AUG A3 GRS', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (959, 100003098, 'M4A1 GRS', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (960, 100003100, 'Famas GRS', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (961, 200004081, 'MP7 GRS', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (962, 200004082, 'P90 M.C GRS', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (963, 200004083, 'Kriss S.V GRS', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (964, 400006026, 'M1887 W GRS', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (965, 702001037, 'Ballistic Knife GRS', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (966, 702015005, 'Faca de Osso GRS', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (1058, 200004163, 'P90 Ext. LATIN4', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (1059, 702001067, 'Fang Blade LATIN4', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (1060, 200004228, 'OA-93 Medical', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (1061, 100003197, 'AUG A3 4Game', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (1062, 100003225, 'AK-47 SOPMOD Medical', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (1063, 300005126, 'Cheytac M200 Medical', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (1064, 200004230, 'P90 Ext. Medical', 'DIAS', 0);
INSERT INTO "public"."storage" VALUES (1065, 1300034010, 'C4 Speed 10D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (1066, 1300242010, 'Especial Extra 10D', 'UNIDADES', 0);
INSERT INTO "public"."storage" VALUES (1067, 1300029003, 'Invunerabilidade 3D', 'UNIDADES', 0);

-- ----------------------------
-- Table structure for suporte
-- ----------------------------
DROP TABLE IF EXISTS "public"."suporte";
CREATE TABLE "public"."suporte" (
  "id_suporte" int4 NOT NULL DEFAULT nextval('suporte_id_suporte_seq'::regclass),
  "titulo" varchar COLLATE "pg_catalog"."default",
  "nickname" varchar COLLATE "pg_catalog"."default",
  "status" varchar COLLATE "pg_catalog"."default",
  "mensagem" varchar(250) COLLATE "pg_catalog"."default",
  "resposta" varchar(250) COLLATE "pg_catalog"."default",
  "gm" varchar(100) COLLATE "pg_catalog"."default",
  "resp_date" varchar(250) COLLATE "pg_catalog"."default",
  "date_create" date
)
;

-- ----------------------------
-- Records of suporte
-- ----------------------------
INSERT INTO "public"."suporte" VALUES (1, 'Banimento', 'Randall', '1', 'Eai Matheus porque me baniu safado?<div><br></div>', '<p>Seu problema j&aacute; foi resolvido. Desculpe o transtorno</p>', 'Sheik', '2018-03-19', '2018-03-19');
INSERT INTO "public"."suporte" VALUES (4, 'Teste', 'xFuuuuuury', '1', 'ajuda', '<p>Teste</p>', 'GM_Sheik', '2018-03-22', '2018-03-22');
INSERT INTO "public"."suporte" VALUES (3, 'vamo ver se é vdd', 'SM0LK1NG', '1', '<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">krai é vdd mesmo&nbsp;</font></font>', '<p>Claro u&eacute;</p>', 'GM_Sheik', '2018-03-22', '2018-03-22');

-- ----------------------------
-- Table structure for system_blocked
-- ----------------------------
DROP TABLE IF EXISTS "public"."system_blocked";
CREATE TABLE "public"."system_blocked" (
  "ip" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "mac" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::character varying,
  "coment" varchar(255) COLLATE "pg_catalog"."default" DEFAULT ''::character varying
)
;

-- ----------------------------
-- Table structure for system_network
-- ----------------------------
DROP TABLE IF EXISTS "public"."system_network";
CREATE TABLE "public"."system_network" (
  "id" int8 NOT NULL DEFAULT nextval('ipsystem_seq'::regclass),
  "type" varchar(5) COLLATE "pg_catalog"."default" NOT NULL,
  "startpoint" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "endpoint" varchar(15) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."clans_id_seq"', 29, true);
SELECT setval('"public"."contas_seq"', 165, true);
SELECT setval('"public"."ipsystem_seq"', 3, false);
SELECT setval('"public"."jogador_amigo_seq"', 3, true);
SELECT setval('"public"."jogador_inventario_seq"', 7075, true);
SELECT setval('"public"."jogador_mensagem_seq"', 313, true);
SELECT setval('"public"."loja_seq"', 4, true);
ALTER SEQUENCE "public"."noticias_id_seq"
OWNED BY "public"."noticias"."id";
SELECT setval('"public"."noticias_id_seq"', 3, false);
SELECT setval('"public"."storage_seq"', 14, true);
ALTER SEQUENCE "public"."suporte_id_suporte_seq"
OWNED BY "public"."suporte"."id_suporte";
SELECT setval('"public"."suporte_id_suporte_seq"', 5, true);

-- ----------------------------
-- Primary Key structure for table jogador
-- ----------------------------
ALTER TABLE "public"."jogador" ADD CONSTRAINT "jogador_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jogador_clan
-- ----------------------------
ALTER TABLE "public"."jogador_clan" ADD CONSTRAINT "jogador_clan_pkey" PRIMARY KEY ("id", "owner");

-- ----------------------------
-- Primary Key structure for table jogador_config
-- ----------------------------
ALTER TABLE "public"."jogador_config" ADD CONSTRAINT "jogador_config_pkey" PRIMARY KEY ("player_id");

-- ----------------------------
-- Primary Key structure for table jogador_coupon
-- ----------------------------
ALTER TABLE "public"."jogador_coupon" ADD CONSTRAINT "jogador_coupon_pkey" PRIMARY KEY ("player_id");

-- ----------------------------
-- Primary Key structure for table jogador_equipamento
-- ----------------------------
ALTER TABLE "public"."jogador_equipamento" ADD CONSTRAINT "jogador_equipamento_pkey" PRIMARY KEY ("player_id");

-- ----------------------------
-- Primary Key structure for table jogador_estatisticas
-- ----------------------------
ALTER TABLE "public"."jogador_estatisticas" ADD CONSTRAINT "jogador_estatisticas_pkey" PRIMARY KEY ("player_id");

-- ----------------------------
-- Primary Key structure for table jogador_evento
-- ----------------------------
ALTER TABLE "public"."jogador_evento" ADD CONSTRAINT "jogador_evento_pkey" PRIMARY KEY ("player_id");

-- ----------------------------
-- Primary Key structure for table jogador_inventario
-- ----------------------------
ALTER TABLE "public"."jogador_inventario" ADD CONSTRAINT "jogador_inventario_pkey" PRIMARY KEY ("object", "player_id");

-- ----------------------------
-- Primary Key structure for table jogador_mensagem
-- ----------------------------
ALTER TABLE "public"."jogador_mensagem" ADD CONSTRAINT "jogador_mensagem_pkey" PRIMARY KEY ("object");

-- ----------------------------
-- Primary Key structure for table jogador_missoes
-- ----------------------------
ALTER TABLE "public"."jogador_missoes" ADD CONSTRAINT "jogador_missoes_pkey" PRIMARY KEY ("player_id");

-- ----------------------------
-- Primary Key structure for table jogador_mouse
-- ----------------------------
ALTER TABLE "public"."jogador_mouse" ADD CONSTRAINT "jogador_mouse_pkey" PRIMARY KEY ("player_id");

-- ----------------------------
-- Primary Key structure for table jogador_teclado
-- ----------------------------
ALTER TABLE "public"."jogador_teclado" ADD CONSTRAINT "jogador_teclado_pkey" PRIMARY KEY ("player_id");

-- ----------------------------
-- Primary Key structure for table jogador_titulos
-- ----------------------------
ALTER TABLE "public"."jogador_titulos" ADD CONSTRAINT "jogador_titulos_pkey" PRIMARY KEY ("player_id");

-- ----------------------------
-- Primary Key structure for table jogador_vip
-- ----------------------------
ALTER TABLE "public"."jogador_vip" ADD CONSTRAINT "jogador_vip_pkey" PRIMARY KEY ("player_id");

-- ----------------------------
-- Primary Key structure for table loja
-- ----------------------------
ALTER TABLE "public"."loja" ADD CONSTRAINT "loja_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table loja_gifts
-- ----------------------------
ALTER TABLE "public"."loja_gifts" ADD CONSTRAINT "loja_gifts_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table noticias
-- ----------------------------
ALTER TABLE "public"."noticias" ADD CONSTRAINT "noticias_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table storage
-- ----------------------------
ALTER TABLE "public"."storage" ADD CONSTRAINT "storage_pkey" PRIMARY KEY ("id", "item_id");

-- ----------------------------
-- Primary Key structure for table suporte
-- ----------------------------
ALTER TABLE "public"."suporte" ADD CONSTRAINT "suporte_pkey" PRIMARY KEY ("id_suporte");

-- ----------------------------
-- Primary Key structure for table system_network
-- ----------------------------
ALTER TABLE "public"."system_network" ADD CONSTRAINT "system_network_pkey" PRIMARY KEY ("id");
