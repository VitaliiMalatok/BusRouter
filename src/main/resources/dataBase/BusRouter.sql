-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BusRouterNew
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BusRouterNew
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BusRouterNew` DEFAULT CHARACTER SET utf8 ;
USE `BusRouterNew` ;

-- -----------------------------------------------------
-- Table `BusRouterNew`.`Buses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BusRouterNew`.`Buses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BusRouterNew`.`Stations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BusRouterNew`.`Stations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `latitude` DOUBLE NOT NULL,
  `longitude` DOUBLE NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BusRouterNew`.`Routes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BusRouterNew`.`Routes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `distance` DOUBLE NOT NULL,
  `station_id1` INT NOT NULL,
  `station_id2` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `station_id1_idx` (`station_id1` ASC) VISIBLE,
  INDEX `station_id2_idx` (`station_id2` ASC) VISIBLE,
  CONSTRAINT `station_id1`
    FOREIGN KEY (`station_id1`)
    REFERENCES `BusRouterNew`.`Stations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `station_id2`
    FOREIGN KEY (`station_id2`)
    REFERENCES `BusRouterNew`.`Stations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BusRouterNew`.`Stations_have_Buses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BusRouterNew`.`Stations_have_Buses` (
  `id` VARCHAR(45) NOT NULL,
  `Stations_id` INT NOT NULL,
  `Buses_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Stations_has_Buses_Buses1_idx` (`Buses_id` ASC) VISIBLE,
  INDEX `fk_Stations_has_Buses_Stations1_idx` (`Stations_id` ASC) VISIBLE,
  CONSTRAINT `fk_Stations_has_Buses_Stations1`
    FOREIGN KEY (`Stations_id`)
    REFERENCES `BusRouterNew`.`Stations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Stations_has_Buses_Buses1`
    FOREIGN KEY (`Buses_id`)
    REFERENCES `BusRouterNew`.`Buses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `BusRouterNew`.`Buses`
-- -----------------------------------------------------
START TRANSACTION;
USE `BusRouterNew`;
INSERT INTO `BusRouterNew`.`Buses` (`id`, `number`) VALUES (1, '1');
INSERT INTO `BusRouterNew`.`Buses` (`id`, `number`) VALUES (2, '3');
INSERT INTO `BusRouterNew`.`Buses` (`id`, `number`) VALUES (3, '119');
INSERT INTO `BusRouterNew`.`Buses` (`id`, `number`) VALUES (4, '223');
INSERT INTO `BusRouterNew`.`Buses` (`id`, `number`) VALUES (5, '225');
INSERT INTO `BusRouterNew`.`Buses` (`id`, `number`) VALUES (6, '319');
INSERT INTO `BusRouterNew`.`Buses` (`id`, `number`) VALUES (7, '479');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BusRouterNew`.`Stations`
-- -----------------------------------------------------
START TRANSACTION;
USE `BusRouterNew`;
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (1, 'Railway_station', 53.8919235774, 27.5495325449, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (2, 'Kirova', 53.8932602686, 27.5519371772, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (3, 'Lenina', 53.900253855, 27.5579054699, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (4, 'Zamchishche', 53.9078528845, 27.550607687, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (5, 'Gvardeyskaya', 53.9160771448, 27.5351859915, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (6, 'Centra_tennisa', 53.9241763319, 27.523818628, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (7, 'Kruptsy', 53.9335172819, 27.5029495819, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (8, 'Minsk Arena', 53.9372778601, 27.4824905873, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (9, 'DS_Vesnyanka', 53.9320779442, 27.4798434988, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (10, 'Vesninka', 53.941095331, 27.4688615202, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (11, 'Aquapark', 53.9496143375, 27.4497281796, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (12, 'Center_Leader', 53.9513016294, 27.4391311989, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (13, 'Station_Zhdanovichi', 53.9481541877, 27.4265266316, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (14, 'Station_Minske_Sea', 53.9487066947, 27.3759619643, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (15, 'Vokzal_Minsk', 53.9467653395, 27.3479458331, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (16, 'Vokzal_Zaslavl', 53.9521176409, 27.3299226694, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (18, 'Yuny_Comunar', 53.9689255986, 27.315594081, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (19, 'Zelenoe', 53.9803314896, 27.3090273033, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (20, 'Velikoye', 53.9944012498, 27.2995024993, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (21, 'Hospital', 53.9992681554, 27.2952186431, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (22, 'Shkola_№1', 54.0047726054, 27.2925819453, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (23, 'Dehnovka', 54.0064949512, 27.3022580074, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (24, 'ST_Ptitsevod', 54.0183036134, 27.3128529263, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (25, 'Vokzalnaya', 54.0070335245, 27.2827117577, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (26, 'Supermarket', 54.0111324745, 27.2693444715, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (27, 'Shkola_№2', 54.0123414649, 27.2647273076, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (28, 'Kirshi', 54.0092578987, 27.2423513375, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (29, 'd_Modern', 53.9911545615, 27.2726886688, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (30, 'Dzerzhinskaya', 53.9938946762, 27.2691935845, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (31, 'Masonry', 53.9959570464, 27.2735511069, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (32, 'Puteyko', 54.0012938966, 27.2798294877, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (33, 'Drugstore_sklady', 54.0181009015, 27.2526004941, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (34, 'Khmelevka', 54.023637533, 27.2571376701, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (35, 'Zagorodye', 54.0066114053, 27.3305532278, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (36, 'Vokzal_Zaslavl_2', 54.0087610408, 27.3941408286, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (37, 'Vokzal_Minsk_2', 54.008645126, 27.4237323157, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (38, 'd_Primorie', 53.9906213852, 27.4823164492, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (39, 'd_Yakubovichi', 53.9757660021, 27.5369042116, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (40, 'Irinovskaya', 53.9633048435, 27.5377526048, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (41, 'Shchedrin', 53.9357171305, 27.545834273, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (18, 'Square_Myasnikov', 53.89285355930397, 27.542671456630803, 'Minsk');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BusRouterNew`.`Routes`
-- -----------------------------------------------------
START TRANSACTION;
USE `BusRouterNew`;
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (1, 0, 1, 2);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (2, 0, 2, 3);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (3, 0, 3, 4);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (4, 0, 4, 5);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (5, 0, 5, 6);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (6, 0, 6, 7);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (7, 0, 7, 8);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (8, 0, 8, 9);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (9, 0, 9, 10);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (10, 0, 10, 11);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (11, 0, 11, 12);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (12, 0, 12, 13);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (13, 0, 13, 14);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (14, 0, 14, 15);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (15, 0, 15, 16);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (16, 0, 17, 18);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (17, 0, 18, 19);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (18, 0, 19, 20);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (19, 0, 20, 21);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (20, 0, 21, 22);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (21, 0, 22, 23);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (22, 0, 23, 24);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (23, 0, 22, 25);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (24, 0, 25, 26);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (25, 0, 26, 27);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (26, 0, 27, 28);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (27, 0, 29, 30);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (28, 0, 30, 31);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (29, 0, 31, 32);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (30, 0, 32, 25);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (31, 0, 25, 26);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (32, 0, 26, 27);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (33, 0, 27, 33);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (34, 0, 33, 34);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (35, 0, 25, 22);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (36, 0, 22, 23);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (37, 0, 23, 35);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (38, 0, 35, 36);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (39, 0, 36, 37);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (40, 0, 37, 38);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (41, 0, 38, 39);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (42, 0, 39, 40);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (43, 0, 40, 41);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (44, 0, 1, 17);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BusRouterNew`.`Stations_have_Buses`
-- -----------------------------------------------------
START TRANSACTION;
USE `BusRouterNew`;
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('1', 1, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('2', 2, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('3', 3, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('4', 4, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('5', 5, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('6', 6, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('7', 7, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('8', 8, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('9', 9, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('10', 9, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('11', 10, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('12', 11, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('13', 12, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('14', 13, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('15', 14, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('16', 15, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('17', 16, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('18', 18, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('19', 19, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('20', 20, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('21', 21, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('22', 22, 4);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('23', 22, 6);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('24', 22, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('25', 23, 6);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('26', 23, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('27', 24, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('28', 17, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('29', 25, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('30', 25, 4);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('31', 25, 6);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('32', 26, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('33', 26, 4);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('34', 27, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('35', 27, 4);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('36', 28, 4);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('37', 29, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('38', 30, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('39', 31, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('40', 32, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('41', 33, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('42', 34, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('43', 35, 6);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('44', 36, 3);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('45', 36, 6);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('46', 37, 3);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('47', 38, 3);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('48', 39, 3);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('49', 40, 3);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('50', 41, 3);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('51', 17, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('52', 17, 1);

COMMIT;

