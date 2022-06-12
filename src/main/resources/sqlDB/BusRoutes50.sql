-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BusRouter
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BusRouter
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BusRouter` DEFAULT CHARACTER SET utf8 ;
USE `BusRouter` ;

-- -----------------------------------------------------
-- Table `BusRouter`.`Cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BusRouter`.`Cities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BusRouter`.`Buses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BusRouter`.`Buses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BusRouter`.`Stations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BusRouter`.`Stations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `laitude` DOUBLE NOT NULL,
  `longitude` DOUBLE NOT NULL,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`id`, `name`),
  INDEX `city_id_idx` (`city_id` ASC) VISIBLE,
  CONSTRAINT `city_id`
    FOREIGN KEY (`city_id`)
    REFERENCES `BusRouter`.`Cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BusRouter`.`Routes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BusRouter`.`Routes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `distance` VARCHAR(45) NOT NULL,
  `station_id1` INT NOT NULL,
  `station_id2` INT NOT NULL,
  `bus_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `station_id1_idx` (`station_id1` ASC) VISIBLE,
  INDEX `station_id2_idx` (`station_id2` ASC) VISIBLE,
  INDEX `bus_id_idx` (`bus_id` ASC) VISIBLE,
  CONSTRAINT `station_id1`
    FOREIGN KEY (`station_id1`)
    REFERENCES `BusRouter`.`Stations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `station_id2`
    FOREIGN KEY (`station_id2`)
    REFERENCES `BusRouter`.`Stations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `bus_id`
    FOREIGN KEY (`bus_id`)
    REFERENCES `BusRouter`.`Buses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `BusRouter`.`Cities`
-- -----------------------------------------------------
START TRANSACTION;
USE `BusRouter`;
INSERT INTO `BusRouter`.`Cities` (`id`, `name`) VALUES (1, 'Minsk');
INSERT INTO `BusRouter`.`Cities` (`id`, `name`) VALUES (2, 'Zaslavl');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BusRouter`.`Buses`
-- -----------------------------------------------------
START TRANSACTION;
USE `BusRouter`;
INSERT INTO `BusRouter`.`Buses` (`id`, `number`) VALUES (1, 1);
INSERT INTO `BusRouter`.`Buses` (`id`, `number`) VALUES (2, 3);
INSERT INTO `BusRouter`.`Buses` (`id`, `number`) VALUES (3, 119);
INSERT INTO `BusRouter`.`Buses` (`id`, `number`) VALUES (4, 223);
INSERT INTO `BusRouter`.`Buses` (`id`, `number`) VALUES (5, 225);
INSERT INTO `BusRouter`.`Buses` (`id`, `number`) VALUES (6, 319);
INSERT INTO `BusRouter`.`Buses` (`id`, `number`) VALUES (7, 479);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BusRouter`.`Stations`
-- -----------------------------------------------------
START TRANSACTION;
USE `BusRouter`;
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (1, 'Railway_station', 53.8919235774, 27.5495325449, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (2, 'Kirova', 53.8932602686, 27.5519371772, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (3, 'Lenina', 53.900253855, 27.5579054699, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (4, 'Zamchishche', 53.9078528845, 27.550607687, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (5, 'Gvardeyskaya', 53.9160771448, 27.5351859915, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (6, 'Centra_tennisa', 53.9241763319, 27.523818628, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (7, 'Kruptsy', 53.9335172819, 27.5029495819, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (8, 'Minsk Arena', 53.9372778601, 27.4824905873, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (9, 'DS_Vesnyanka', 53.9320779442, 27.4798434988, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (10, 'Vesninka', 53.941095331, 27.4688615202, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (11, 'Aquapark', 53.9496143375, 27.4497281796, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (12, 'Center_Leader', 53.9513016294, 27.4391311989, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (13, 'Station_Zhdanovichi', 53.9481541877, 27.4265266316, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (14, 'Station_Minske_More', 53.9487066947, 27.3759619643, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (15, 'Ratomka', 53.9467653395, 27.3479458331, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (16, 'Robinson_Club', 53.9521176409, 27.3299226694, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (18, 'Yuny_Comunar', 53.9521176409, 27.3299226694, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (19, 'Zelenoe', 53.9689255986, 27.315594081, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (20, 'Velikoye', 53.9803314896, 27.3090273033, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (21, 'Hospital', 53.9944012498, 27.2995024993, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (22, 'Shkola_№1', 53.9992681554, 27.2952186431, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (23, 'Dehnovka', 54.0047726054, 27.2925819453, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (24, 'ST_Ptitsevod', 54.0064949512, 27.3022580074, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (17, 'Robinson_Club', 53.9521176409, 27.3299226694, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (25, 'Vokzalnaya', 54.0070335245, 27.2827117577, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (26, 'Supermarket', 54.0111324745, 27.2693444715, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (27, 'Shkola_№2', 54.0123414649, 27.2647273076, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (28, 'Kirshi', 54.0092578987, 27.2423513375, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (29, 'd_Modern', 53.9911545615, 27.2726886688, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (30, 'Dzerzhinskaya', 53.9938946762, 27.2691935845, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (31, 'Masonry', 53.9959570464, 27.2735511069, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (32, 'Puteyko', 54.0012938966, 27.2798294877, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (33, 'Drugstore_sklady', 54.0181009015, 27.2526004941, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (34, 'Khmelevka', 54.023637533, 27.2571376701, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (35, 'Zagorodye', 54.0066114053, 27.3305532278, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (36, 'Scientist', 54.0087610408, 27.3941408286, 2);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (37, 'Scientist', 54.0087610408, 27.3941408286, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (38, 'San_Primorsky', 54.008645126, 27.4237323157, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (39, 'd_Primorie', 53.9906213852, 27.4823164492, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (40, 'd_Yakubovichi', 53.9757660021, 27.5369042116, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (41, 'Irinovskaya', 53.9633048435, 27.5377526048, 1);
INSERT INTO `BusRouter`.`Stations` (`id`, `name`, `laitude`, `longitude`, `city_id`) VALUES (42, 'Shchedrin', 53.9357171305, 27.545834273, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BusRouter`.`Routes`
-- -----------------------------------------------------
START TRANSACTION;
USE `BusRouter`;
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (1, 0, 1, 2, 1);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (2, 0, 2, 3, 1);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (3, 0, 3, 4, 1);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (4, 0, 4, 5, 1);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (5, 0, 5, 6, 1);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (6, 0, 6, 7, 1);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (7, 0, 7, 8, 1);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (8, 0, 8, 9, 1);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (9, 0, 9, 10, 5);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (10, 0, 10, 11, 5);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (11, 0, 11, 12, 5);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (12, 0, 12, 13, 5);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (13, 0, 13, 14, 5);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (14, 0, 14, 15, 5);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (15, 0, 15, 16, 5);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (16, 0, 17, 18, 7);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (17, 0, 18, 19, 7);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (18, 0, 19, 20, 7);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (19, 0, 20, 21, 7);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (20, 0, 21, 22, 7);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (21, 0, 22, 23, 7);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (22, 0, 23, 24, 7);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (23, 0, 22, 25, 4);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (24, 0, 25, 26, 4);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (25, 0, 26, 27, 4);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (26, 0, 27, 28, 4);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (27, 0, 29, 30, 2);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (28, 0, 30, 31, 2);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (29, 0, 31, 32, 2);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (30, 0, 32, 25, 2);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (31, 0, 25, 26, 2);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (32, 0, 26, 27, 2);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (33, 0, 27, 33, 2);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (34, 0, 33, 34, 2);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (35, 0, 25, 22, 6);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (36, 0, 22, 23, 6);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (37, 0, 23, 35, 6);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (38, 0, 35, 36, 6);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (39, 0, 36, 37, 6);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (40, 0, 37, 38, 3);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (41, 0, 38, 39, 3);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (42, 0, 39, 40, 3);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (43, 0, 40, 41, 3);
INSERT INTO `BusRouter`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`, `bus_id`) VALUES (44, 0, 41, 42, 3);

COMMIT;

select * from stations
