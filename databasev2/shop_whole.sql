-- Adminer 4.7.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `shop`;
CREATE DATABASE `shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shop`;

DROP TABLE IF EXISTS `kategoria`;
CREATE TABLE `kategoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `kategoria` (`id`, `nazwa`) VALUES
(1,	'warzywa'),
(2,	'mięso'),
(3,	'produkty mleczarskie');

DROP TABLE IF EXISTS `produkty`;
CREATE TABLE `produkty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` text NOT NULL,
  `opis` text NOT NULL,
  `cena_jednostkowa` float NOT NULL,
  `waga_jednostkowa` float NOT NULL,
  `kategoria_towaru` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `produkty_kategoria_id_fk` (`kategoria_towaru`),
  CONSTRAINT `produkty_kategoria_id_fk` FOREIGN KEY (`kategoria_towaru`) REFERENCES `kategoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `produkty` (`id`, `nazwa`, `opis`, `cena_jednostkowa`, `waga_jednostkowa`, `kategoria_towaru`) VALUES
(1,	'Miechunka peruwiańska',	'excepteur ut id voluptate adipisicing',	8.6231,	9.8973,	1),
(2,	'Kapusta warzywna brukselska',	'occaecat occaecat aliquip aute deserunt',	5.5451,	5.0751,	1),
(3,	'Kapusta warzywna głowiasta',	'qui do nostrud ad consequat',	5.4893,	4.0561,	1),
(4,	'Piżmian jadalny',	'esse aliquip ut sit nulla',	7.4287,	2.437,	1),
(5,	'Roszpunka warzywna',	'sunt duis nisi esse nisi',	6.0735,	2.3437,	1),
(6,	'Patison',	'sint anim anim amet reprehenderit',	9.5999,	1.0814,	1),
(7,	'Miechunka pomidorowa',	'amet et commodo dolore exercitation',	4.3648,	6.9446,	1),
(8,	'Sałata siewna',	'adipisicing qui aliqua Lorem ea',	4.0418,	8.3128,	1),
(9,	'Papryka chili',	'mollit ut velit mollit enim',	4.6366,	4.9269,	1),
(10,	'Ogórek melon',	'minim aliquip non cupidatat dolor',	3.7539,	3.8043,	1),
(11,	'Soja warzywna',	'labore do cillum ut consequat',	3.1809,	6.6925,	1),
(12,	'Pochrzyn skrzydlaty',	'culpa sunt in consequat sint',	7.3726,	1.3788,	1),
(13,	'Groch zwyczajny',	'eu aliqua nulla minim ex',	9.8127,	7.4022,	1),
(14,	'Kapusta warzywna włoska',	'culpa velit dolore incididunt aliquip',	8.1923,	5.1954,	1),
(15,	'Soja transgeniczna',	'quis non ut amet id',	9.1673,	9.0055,	1),
(16,	'Cebula zwyczajna',	'qui aliqua eiusmod velit mollit',	0.3036,	4.7342,	1),
(17,	'Brokuł',	'enim nisi voluptate tempor excepteur',	8.3116,	3.1071,	1),
(18,	'Pietruszka zwyczajna',	'adipisicing exercitation occaecat mollit in',	9.6118,	5.6773,	1),
(19,	'Rabarbar kędzierzawy',	'eu laborum Lorem sunt sit',	5.3926,	2.7662,	1),
(20,	'Kabaczek',	'ipsum culpa fugiat laborum quis',	2.0966,	6.3488,	1),
(21,	'Piękny Jaś z Doliny Dunajca',	'aute dolor ex ex occaecat',	4.4618,	4.8907,	1),
(22,	'Dynia zwyczajna',	'Lorem anim pariatur aliquip tempor',	2.6346,	3.2888,	1),
(23,	'Dynia figolistna',	'excepteur aliquip sunt officia velit',	1.4203,	6.8478,	1),
(24,	'Czyściec bulwiasty',	'in minim adipisicing ipsum aute',	5.9563,	5.1318,	1),
(25,	'Trichosanthes cucumeroides',	'est elit pariatur fugiat sint',	6.8594,	5.6137,	1),
(26,	'Arbuz zwyczajny',	'sit laborum sit anim fugiat',	5.4642,	3.8707,	1),
(27,	'Kalarepa',	'non duis reprehenderit aliqua dolore',	2.9464,	7.7883,	1),
(28,	'Kapusta właściwa pekińska',	'aliquip magna aliqua nisi esse',	9.0876,	7.0776,	1),
(29,	'Bakłażan',	'do occaecat enim deserunt labore',	1.4659,	9.8405,	1),
(30,	'Kolokazja jadalna',	'irure voluptate non tempor et',	8.1081,	7.6577,	1),
(31,	'Trichosanthes cucumeroides',	'minim fugiat ad Lorem mollit',	4.236,	1.0998,	1),
(32,	'Pietruszka zwyczajna',	'fugiat amet ipsum elit eiusmod',	0.0115,	7.697,	1),
(33,	'Jarmuż',	'sint mollit nisi excepteur commodo',	1.6929,	5.1573,	1),
(34,	'Kapusta warzywna włoska',	'occaecat aute cupidatat consectetur pariatur',	2.8764,	6.1709,	1),
(35,	'Modrak morski',	'exercitation laborum nisi cupidatat ad',	9.525,	5.4856,	1),
(36,	'Dynia figolistna',	'esse non nisi sunt eiusmod',	0.038,	4.5567,	1),
(37,	'Gorczycznik wiosenny',	'consectetur Lorem enim nostrud occaecat',	7.5871,	7.6878,	1),
(38,	'Karczoch hiszpański',	'aute qui veniam cupidatat excepteur',	7.8991,	6.6191,	1),
(39,	'Rabarbar kędzierzawy',	'occaecat do veniam laborum voluptate',	4.2301,	1.6134,	1),
(40,	'Brokuły z Torbole',	'aute eu eu anim Lorem',	3.9999,	9.8201,	1),
(41,	'Arbuz zwyczajny',	'elit ad incididunt laboris velit',	5.3601,	6.1372,	1),
(42,	'Gurdlina ogórkowata',	'in magna cillum cillum dolore',	4.8912,	4.9758,	1),
(43,	'Kalarepa',	'excepteur ipsum mollit ex ea',	1.2318,	2.3878,	1),
(44,	'Kozibród porolistny',	'Lorem nostrud excepteur consequat fugiat',	0.9296,	6.271,	1),
(45,	'Żółtosocza strzałkowata',	'quis incididunt nostrud sint amet',	9.0187,	5.4127,	1),
(46,	'Cebula cukrowa',	'est Lorem do dolor Lorem',	3.7936,	2.5089,	1),
(47,	'Cykoria endywia',	'sint do dolore cillum cillum',	0.542,	7.441,	1),
(48,	'Ogórek melon',	'officia voluptate fugiat laboris ad',	8.2158,	2.0211,	1),
(49,	'Cukinia',	'proident veniam laboris dolor elit',	9.688,	5.2942,	1),
(50,	'Trichosanthes cucumeroides',	'duis aliquip eu qui veniam',	4.4413,	4.8067,	1),
(51,	'Miechunka peruwiańska',	'veniam ullamco pariatur commodo tempor',	3.7832,	3.0234,	1),
(52,	'Cukinia',	'duis reprehenderit aliquip velit id',	8.6838,	4.5895,	1),
(53,	'Kukurydza zwyczajna',	'fugiat nisi nisi anim culpa',	8.3231,	2.5352,	1),
(54,	'Sałata rzymska',	'magna eu eiusmod reprehenderit qui',	7.559,	9.9789,	1),
(55,	'Roszpunka warzywna',	'sit id adipisicing eu ut',	6.4149,	7.4812,	1),
(56,	'Sałata dębolistna',	'labore mollit proident pariatur duis',	0.0505,	7.3471,	1),
(57,	'Pietruszka zwyczajna',	'commodo culpa aute culpa nulla',	7.2205,	7.584,	1),
(58,	'Marchew czarna',	'eiusmod nulla cillum proident ea',	2.7655,	8.6023,	1),
(59,	'Kolczoch jadalny',	'officia id id pariatur elit',	8.4388,	6.3453,	1),
(60,	'Burak zwyczajny',	'commodo et ipsum quis eiusmod',	1.5498,	8.3624,	1),
(61,	'Kapusta warzywna głowiasta',	'excepteur dolore qui sint laborum',	8.87,	2.434,	1),
(62,	'Selery zwyczajne',	'Lorem irure dolor sit pariatur',	8.0372,	8.4255,	1),
(63,	'Fasola ostrolistna',	'pariatur fugiat irure non ipsum',	7.1363,	2.3529,	1),
(64,	'Gorczycznik wiosenny',	'ullamco veniam consequat elit eu',	5.2245,	4.5036,	1),
(65,	'Kalarepa',	'et exercitation amet cupidatat id',	9.735,	1.7332,	1),
(66,	'Szczypiorek',	'pariatur commodo irure ipsum eiusmod',	4.8408,	2.4149,	1),
(67,	'Cebula cukrowa',	'excepteur in minim exercitation proident',	0.1455,	7.5975,	1),
(68,	'Kapusta warzywna głowiasta',	'excepteur veniam sunt ipsum culpa',	0.1719,	6.087,	1),
(69,	'Szpinak warzywny',	'ea ex adipisicing veniam consequat',	4.2098,	8.1078,	1),
(70,	'Dynia makaronowa',	'esse nisi non ipsum exercitation',	6.2505,	3.9813,	1),
(71,	'Marek kucmerka',	'aliqua cupidatat duis anim proident',	2.8771,	1.1263,	1),
(72,	'Fasola zwykła',	'aute voluptate eu ut nisi',	8.67,	9.7644,	1),
(73,	'Pomidor zwyczajny',	'consequat cupidatat aute ex veniam',	9.2793,	2.0031,	1),
(74,	'Rabarbar ogrodowy',	'laboris ex ea in eu',	8.3584,	2.7249,	1),
(75,	'Czosnek niedźwiedzi',	'voluptate enim sint officia eu',	9.5838,	5.7851,	1),
(76,	'Pochrzyn skrzydlaty',	'et tempor proident Lorem sunt',	9.768,	4.204,	1),
(77,	'Papryka (kuchnia)',	'incididunt aliquip exercitation irure esse',	2.639,	3.0106,	1),
(78,	'Patison',	'labore commodo in sunt proident',	2.4172,	4.435,	1),
(79,	'Sałata siewna',	'mollit sint reprehenderit qui reprehenderit',	4.5164,	9.759,	1),
(80,	'Rabarbar ogrodowy',	'amet ad dolor id ea',	9.0144,	2.2375,	1),
(81,	'Jarmuż',	'minim et sit consectetur amet',	2.3705,	3.0722,	1),
(82,	'Coccinia grandis',	'sit est enim minim incididunt',	6.2941,	6.0182,	1),
(83,	'Czyściec bulwiasty',	'qui in quis cillum culpa',	3.3496,	3.5462,	1),
(84,	'Endywia kędzierzawa',	'dolor nisi laboris amet consequat',	3.8828,	7.121,	1),
(85,	'Piżmian jadalny',	'enim Lorem anim commodo incididunt',	8.9513,	1.9716,	1),
(86,	'Sałata rzymska',	'Lorem ex eiusmod nisi dolore',	3.1076,	1.466,	1),
(87,	'Fasola mungo',	'incididunt cupidatat veniam esse occaecat',	4.0295,	5.804,	1),
(88,	'Kozibród porolistny',	'eiusmod est sit commodo quis',	5.1406,	3.8569,	1),
(89,	'Papryka peperoni',	'reprehenderit nisi sunt do fugiat',	9.2967,	9.2837,	1),
(90,	'Cebula cukrowa',	'tempor commodo elit qui in',	9.73,	6.7993,	1),
(91,	'Ogórek siewny',	'Lorem consequat labore commodo anim',	0.0017,	5.7077,	1),
(92,	'Sałata rzymska',	'eu commodo incididunt ad reprehenderit',	7.4807,	9.9272,	1),
(93,	'Trętwian czterorożny',	'do magna est exercitation ex',	9.7642,	2.6605,	1),
(94,	'Kapusta warzywna brukselska',	'et voluptate veniam ea consequat',	3.3507,	9.3303,	1),
(95,	'Czyściec bulwiasty',	'consequat consequat veniam sint ut',	7.7319,	8.2935,	1),
(96,	'Kukurydza cukrowa',	'esse cupidatat ut aute laboris',	4.2545,	8.3765,	1),
(97,	'Rukiew wodna',	'excepteur ad proident ad velit',	8.3451,	6.1998,	1),
(98,	'Marek kucmerka',	'aute labore nulla occaecat laborum',	2.7891,	6.308,	1),
(99,	'Burak ćwikłowy',	'nostrud irure in sunt qui',	4.1759,	3.4406,	1),
(100,	'Dynia piżmowa',	'in dolor tempor quis ad',	9.5776,	6.3586,	1),
(185,	'Wagyū',	'cupidatat irure consectetur sunt irure',	5.5082,	6.7541,	2),
(186,	'Noga wieprzowa',	'qui fugiat tempor officia aliquip',	6.1898,	4.983,	2),
(187,	'Świeże mięso',	'irure incididunt officia nisi irure',	3.2195,	7.5239,	2),
(188,	'Filet (mięso)',	'exercitation et adipisicing ipsum do',	0.6123,	7.0143,	2),
(189,	'Polędwica',	'ad elit sit labore aliquip',	4.465,	1.5297,	2),
(190,	'Żabie udka',	'do laborum aute ad ut',	9.2584,	6.9032,	2),
(191,	'Głowizna',	'voluptate ipsum incididunt labore incididunt',	0.6227,	9.1844,	2),
(192,	'Boczek',	'in non cupidatat reprehenderit nostrud',	1.0086,	3.6504,	2),
(193,	'Golonka',	'et veniam irure commodo ex',	0.5506,	6.0182,	2),
(194,	'Mięso oddzielane mechanicznie',	'veniam fugiat adipisicing velit et',	1.8661,	3.7674,	2),
(195,	'Polędwiczka',	'in commodo duis non minim',	4.8002,	2.2238,	2),
(196,	'Podgardle (mięso)',	'irure quis esse commodo laboris',	5.7712,	2.649,	2),
(197,	'Mięso mielone',	'dolore nisi duis in culpa',	4.4464,	4.656,	2),
(198,	'Dziczyzna',	'culpa fugiat laborum cillum sunt',	3.8795,	2.7708,	2),
(199,	'Bushmeat',	'enim deserunt est anim ad',	6.1179,	4.0951,	2),
(200,	'Wieprzowina',	'non eu dolor et veniam',	5.8684,	9.4181,	2),
(201,	'Wieprzowina',	'duis ullamco incididunt ut laboris',	1.5689,	3.874,	2),
(202,	'Tusza',	'in duis irure exercitation officia',	4.1297,	5.2401,	2),
(203,	'Baranina',	'dolor amet commodo mollit minim',	3.1835,	2.1194,	2),
(204,	'Wyroby mięsne',	'qui veniam sunt consequat non',	5.552,	4.6496,	2),
(205,	'Kumys',	'nostrud mollit et pariatur labore',	8.5735,	1.5949,	3),
(206,	'Mleko acidofilne',	'minim sunt incididunt id esse',	6.3871,	5.2866,	3),
(207,	'Wyroby seropodobne',	'ea pariatur commodo excepteur cupidatat',	0.5346,	2.8293,	3),
(208,	'Ajran',	'dolor quis cupidatat commodo minim',	9.8637,	3.1697,	3),
(209,	'Serwatka',	'occaecat nisi esse culpa proident',	4.1815,	4.1194,	3),
(210,	'Śmietana',	'elit amet proident id duis',	9.0617,	1.0601,	3),
(211,	'Clotted cream',	'sit consectetur esse non aliquip',	6.9452,	3.3344,	3),
(212,	'Ajran',	'aliquip esse consectetur adipisicing consequat',	6.1585,	1.5536,	3),
(213,	'Śmietana',	'ex voluptate occaecat ullamco dolore',	3.759,	1.4697,	3),
(214,	'Wyroby seropodobne',	'adipisicing Lorem eu aute aute',	8.2504,	1.1136,	3),
(215,	'Śmietana',	'nisi Lorem eu officia minim',	1.6014,	2.8661,	3),
(216,	'Zaktualizowany Nowy Produkt',	'Nowy Produkt',	6,	2,	1);

DROP TABLE IF EXISTS `stan_zamowienia`;
CREATE TABLE `stan_zamowienia` (
  `id` int(11) NOT NULL,
  `nazwa` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stan_zamowienia_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `stan_zamowienia` (`id`, `nazwa`) VALUES
(1,	'NIEZATWIERDZONE'),
(2,	'ZATWIERDZONE'),
(3,	'ANULOWANE'),
(4,	'ZREALIZOWANE');

DROP TABLE IF EXISTS `zamowienie`;
CREATE TABLE `zamowienie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_zatwierdzenia` date DEFAULT NULL,
  `stan_zamowienia` int(11) NOT NULL,
  `nazwa_uzytkownika` text NOT NULL,
  `email` text NOT NULL,
  `numer_telefonu` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `zamowienie_stan_zamowienia_id_fk` (`stan_zamowienia`),
  CONSTRAINT `zamowienie_stan_zamowienia_id_fk` FOREIGN KEY (`stan_zamowienia`) REFERENCES `stan_zamowienia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `zamowienie` (`id`, `data_zatwierdzenia`, `stan_zamowienia`, `nazwa_uzytkownika`, `email`, `numer_telefonu`) VALUES
(1,	'2019-12-01',	3,	'Jan Kowalski',	'kowal@wp.pl',	'123456789'),
(2,	'2019-12-02',	1,	'test',	'test@wp.pl',	'987654321'),
(3,	'2019-12-03',	1,	'Janek Kowalski',	'kowal@wp.pl',	'kowal@wp.pl'),
(4,	'2019-12-04',	1,	'Jan Kowalski',	'kowal@wp.pl',	'kowal@wp.pl'),
(8,	'2019-12-03',	1,	'Jan Kowalski',	'kowal@wp.pl',	'kowal@wp.pl'),
(9,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'kowal@wp.pl'),
(10,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'kowal@wp.pl'),
(11,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'kowal@wp.pl'),
(12,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'kowal@wp.pl'),
(13,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'kowal@wp.pl'),
(14,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'kowal@wp.pl'),
(15,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'kowal@wp.pl'),
(16,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'kowal@wp.pl'),
(17,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'kowal@wp.pl'),
(18,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'kowal@wp.pl'),
(19,	'2019-12-03',	1,	'Jan',	'123456789',	'123456789'),
(20,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'kowal@wp.pl'),
(21,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123456789'),
(22,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(23,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(24,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1000,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1001,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1002,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1003,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1004,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1005,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1006,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1007,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1008,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1009,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1010,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1011,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1012,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1013,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1014,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1015,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1016,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1017,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1018,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1019,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1020,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1021,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1022,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1023,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324'),
(1024,	'2019-12-03',	1,	'Jan',	'kowal@wp.pl',	'123324');

DROP TABLE IF EXISTS `zamowienie_produkty`;
CREATE TABLE `zamowienie_produkty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_zamowienia` int(11) NOT NULL,
  `id_produktu` int(11) NOT NULL,
  `ilosc` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zamowienie_produkty_id_uindex` (`id`),
  KEY `zamowienie_produkty_produkty_id_fk` (`id_produktu`),
  KEY `zamowienie_produkty_zamowienie_id_fk` (`id_zamowienia`),
  CONSTRAINT `zamowienie_produkty_produkty_id_fk` FOREIGN KEY (`id_produktu`) REFERENCES `produkty` (`id`),
  CONSTRAINT `zamowienie_produkty_zamowienie_id_fk` FOREIGN KEY (`id_zamowienia`) REFERENCES `zamowienie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `zamowienie_produkty` (`id`, `id_zamowienia`, `id_produktu`, `ilosc`) VALUES
(1,	1024,	1,	1),
(2,	1024,	4,	5),
(3,	1024,	7,	10);

-- 2020-01-03 19:20:55
