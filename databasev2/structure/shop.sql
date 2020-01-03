-- Adminer 4.7.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE DATABASE `shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shop`;

DROP TABLE IF EXISTS `kategoria`;
CREATE TABLE `kategoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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


DROP TABLE IF EXISTS `stan_zamowienia`;
CREATE TABLE `stan_zamowienia` (
  `id` int(11) NOT NULL,
  `nazwa` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stan_zamowienia_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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


-- 2020-01-03 19:17:47
