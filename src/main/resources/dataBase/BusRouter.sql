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
INSERT INTO `BusRouterNew`.`Buses` (`id`, `number`) VALUES (8, '7');
INSERT INTO `BusRouterNew`.`Buses` (`id`, `number`) VALUES (9, '16');
INSERT INTO `BusRouterNew`.`Buses` (`id`, `number`) VALUES (10, '130');
INSERT INTO `BusRouterNew`.`Buses` (`id`, `number`) VALUES (11, '91');
INSERT INTO `BusRouterNew`.`Buses` (`id`, `number`) VALUES (12, '44');
INSERT INTO `BusRouterNew`.`Buses` (`id`, `number`) VALUES (13, '133');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BusRouterNew`.`Stations`
-- -----------------------------------------------------
START TRANSACTION;
USE `BusRouterNew`;
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (id, 'name', latitude, longitude, 'city');
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
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (15, 'Zamornaya', 53.9467653395, 27.3479458331, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (16, 'Robinson_club', 53.9521176409, 27.3299226694, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (17, 'Novovilenskaya', 53.9308739206, 27.5387664395, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (18, 'Yuny_Comunar', 53.9689255986, 27.315594081, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (19, 'Zelenoe', 53.9803314896, 27.3090273033, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (20, 'Velikoye', 53.9944012498, 27.2995024993, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (21, 'Hospital', 53.9992681554, 27.2952186431, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (22, 'Shkola_в„–1', 54.0047726054, 27.2925819453, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (23, 'Dehnovka', 54.0064949512, 27.3022580074, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (24, 'ST_Ptitsevod', 54.0183036134, 27.3128529263, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (25, 'Vokzalnaya', 54.0070335245, 27.2827117577, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (26, 'Supermarket', 54.0111324745, 27.2693444715, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (27, 'Shkola_в„–2', 54.0123414649, 27.2647273076, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (28, 'Kirshi', 54.0092578987, 27.2423513375, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (29, 'Novaya', 53.9911545615, 27.2726886688, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (30, 'Dzerzhinskaya', 53.9938946762, 27.2691935845, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (31, 'Kladochki', 53.9959570464, 27.2735511069, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (32, 'Puteyko', 54.0012938966, 27.2798294877, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (33, 'Naberezhnaya', 53.9953309147, 27.2918888987, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (34, 'Hmelevka', 54.0110910299, 27.2567215144, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (35, 'Zagorodye', 54.0066114053, 27.3305532278, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (36, 'Laporovichi_2', 54.0087610408, 27.3941408286, 'Zaslavl');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (37, 'Laporovichi_1', 54.008645126, 27.4237323157, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (38, 'd_Primorie', 53.9906213852, 27.4823164492, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (39, 'd_Yakubovichi', 53.9757660021, 27.5369042116, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (40, 'Irinovskaya', 53.9633048435, 27.5377526048, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (41, 'Vodonasosnaya', 53.9445576081, 27.5396928825, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (42, 'Shchedrin', 53.9357171305, 27.545834273, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (43, 'MKAD_42', 53.9621456388, 27.4609770953, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (44, 'MKAD_43', 53.9660971248, 27.4720324644, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (45, 'MKAD_45', 53.9683452785, 27.5096455117, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (46, 'Bangalor', 53.9318057123, 27.5749415539, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (47, 'Komarovka', 53.9167935284, 27.5639859853, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (48, 'Operny_Teatr', 53.9096898717, 27.5584602673, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (49, 'Frunzenskaya', 53.9055000614, 27.5379112537, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (50, 'Timiryazeva', 53.9111636469, 27.5267101269, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (51, '2e_Kolzzo', 53.9269081812, 27.5065327624, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (52, 'Stadion_Dinamo', 53.895362452, 27.5656701068, 'Minsk');
INSERT INTO `BusRouterNew`.`Stations` (`id`, `name`, `latitude`, `longitude`, `city`) VALUES (53, 'Teatralnaya', 53.917764703, 27.5553197688, 'Minsk');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BusRouterNew`.`Routes`
-- -----------------------------------------------------
START TRANSACTION;
USE `BusRouterNew`;
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (1, 0, 52, 1);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (2, 0, 2, 1);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (3, 0, 1, 2);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (4, 0, 3, 2);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (5, 0, 2, 3);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (6, 0, 48, 3);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (7, 0, 4, 3);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (8, 0, 49, 3);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (9, 0, 52, 3);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (10, 0, 3, 4);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (11, 0, 5, 4);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (12, 0, 4, 5);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (13, 0, 6, 5);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (14, 0, 5, 6);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (15, 0, 7, 6);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (16, 0, 17, 6);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (17, 0, 53, 6);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (18, 0, 6, 7);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (19, 0, 8, 7);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (20, 0, 7, 8);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (21, 0, 9, 8);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (22, 0, 8, 9);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (23, 0, 51, 9);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (24, 0, 10, 9);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (25, 0, 9, 10);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (26, 0, 11, 10);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (27, 0, 10, 11);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (28, 0, 12, 11);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (29, 0, 11, 12);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (30, 0, 13, 12);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (31, 0, 12, 13);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (32, 0, 14, 13);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (33, 0, 13, 14);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (34, 0, 15, 14);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (35, 0, 14, 15);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (36, 0, 16, 15);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (37, 0, 15, 16);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (38, 0, 18, 16);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (39, 0, 6, 17);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (40, 0, 42, 17);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (41, 0, 16, 18);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (42, 0, 19, 18);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (43, 0, 18, 19);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (44, 0, 20, 19);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (45, 0, 24, 19);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (46, 0, 19, 20);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (47, 0, 33, 20);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (48, 0, 21, 20);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (49, 0, 20, 21);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (50, 0, 22, 21);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (51, 0, 21, 22);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (52, 0, 25, 22);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (53, 0, 23, 22);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (54, 0, 25, 22);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (55, 0, 23, 22);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (56, 0, 22, 23);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (57, 0, 22, 23);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (58, 0, 24, 23);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (59, 0, 35, 23);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (60, 0, 23, 24);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (61, 0, 19, 24);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (62, 0, 22, 25);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (63, 0, 32, 25);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (64, 0, 26, 25);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (65, 0, 26, 25);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (66, 0, 22, 25);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (67, 0, 25, 26);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (68, 0, 25, 26);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (69, 0, 27, 26);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (70, 0, 27, 26);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (71, 0, 26, 27);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (72, 0, 26, 27);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (73, 0, 34, 27);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (74, 0, 34, 28);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (75, 0, 30, 29);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (76, 0, 29, 30);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (77, 0, 31, 30);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (78, 0, 30, 31);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (79, 0, 32, 31);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (80, 0, 31, 32);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (81, 0, 25, 32);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (82, 0, 33, 32);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (83, 0, 34, 32);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (84, 0, 32, 33);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (85, 0, 20, 33);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (86, 0, 27, 34);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (87, 0, 32, 34);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (88, 0, 28, 34);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (89, 0, 23, 35);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (90, 0, 36, 35);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (91, 0, 35, 36);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (92, 0, 37, 36);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (93, 0, 36, 37);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (94, 0, 38, 37);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (95, 0, 37, 38);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (96, 0, 39, 38);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (97, 0, 38, 39);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (98, 0, 40, 39);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (99, 0, 39, 40);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (100, 0, 41, 40);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (101, 0, 40, 41);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (102, 0, 42, 41);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (103, 0, 41, 42);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (104, 0, 17, 42);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (105, 0, 46, 42);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (106, 0, 42, 46);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (107, 0, 47, 46);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (108, 0, 46, 47);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (109, 0, 53, 47);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (110, 0, 48, 47);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (111, 0, 47, 48);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (112, 0, 3, 48);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (113, 0, 3, 49);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (114, 0, 50, 49);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (115, 0, 49, 50);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (116, 0, 51, 50);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (117, 0, 50, 51);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (118, 0, 9, 51);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (119, 0, 3, 52);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (120, 0, 1, 52);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (121, 0, 6, 53);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (122, 0, 47, 53);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (123, 0, 45, 40);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (124, 0, 40, 45);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (125, 0, 11, 43);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (126, 0, 43, 11);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (127, 0, 43, 44);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (128, 0, 44, 43);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (129, 0, 44, 45);
INSERT INTO `BusRouterNew`.`Routes` (`id`, `distance`, `station_id1`, `station_id2`) VALUES (130, 0, 45, 44);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BusRouterNew`.`Stations_have_Buses`
-- -----------------------------------------------------
START TRANSACTION;
USE `BusRouterNew`;
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('1', 1, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('2', 1, 10);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('3', 2, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('4', 3, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('5', 3, 10);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('6', 3, 11);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('7', 4, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('8', 4, 11);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('9', 5, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('10', 5, 12);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('11', 6, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('12', 6, 12);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('13', 6, 13);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('14', 7, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('15', 7, 12);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('16', 7, 13);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('17', 8, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('18', 8, 12);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('19', 9, 1);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('20', 9, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('21', 9, 10);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('22', 10, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('23', 10, 12);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('24', 11, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('25', 11, 9);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('26', 12, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('27', 12, 9);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('28', 13, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('29', 14, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('30', 15, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('31', 16, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('32', 17, 13);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('33', 18, 5);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('34', 18, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('35', 19, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('36', 19, 8);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('37', 20, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('38', 20, 8);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('39', 21, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('40', 22, 4);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('41', 22, 6);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('42', 22, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('43', 23, 6);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('44', 23, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('45', 24, 7);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('46', 24, 8);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('47', 25, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('48', 25, 6);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('49', 26, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('50', 26, 4);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('51', 27, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('52', 27, 4);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('53', 28, 4);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('54', 29, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('55', 30, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('56', 31, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('57', 32, 2);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('58', 32, 8);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('59', 33, 8);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('60', 34, 4);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('61', 34, 8);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('62', 35, 6);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('63', 36, 3);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('64', 36, 6);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('65', 37, 3);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('66', 38, 3);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('67', 39, 3);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('68', 39, 9);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('69', 40, 3);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('70', 40, 9);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('71', 41, 3);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('72', 41, 11);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('73', 41, 13);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('74', 42, 11);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('75', 42, 13);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('76', 43, 9);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('77', 44, 9);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('78', 45, 9);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('79', 46, 11);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('80', 46, 12);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('81', 47, 11);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('82', 47, 12);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('83', 48, 11);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('84', 49, 10);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('85', 50, 10);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('86', 51, 10);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('87', 52, 10);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('88', 53, 12);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('89', 6, 11);
INSERT INTO `BusRouterNew`.`Stations_have_Buses` (`id`, `Stations_id`, `Buses_id`) VALUES ('90', 17, 11);

COMMIT;

