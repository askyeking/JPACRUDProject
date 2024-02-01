-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema albumsdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `albumsdb` ;

-- -----------------------------------------------------
-- Schema albumsdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `albumsdb` DEFAULT CHARACTER SET utf8 ;
USE `albumsdb` ;

-- -----------------------------------------------------
-- Table `band`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `band` ;

CREATE TABLE IF NOT EXISTS `band` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `genre` ;

CREATE TABLE IF NOT EXISTS `genre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `band_has_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `band_has_genre` ;

CREATE TABLE IF NOT EXISTS `band_has_genre` (
  `band_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`band_id`, `genre_id`),
  INDEX `fk_band_has_genre_genre1_idx` (`genre_id` ASC),
  INDEX `fk_band_has_genre_band1_idx` (`band_id` ASC),
  CONSTRAINT `fk_band_has_genre_band1`
    FOREIGN KEY (`band_id`)
    REFERENCES `band` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_band_has_genre_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `genre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `status` ;

CREATE TABLE IF NOT EXISTS `status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `album` ;

CREATE TABLE IF NOT EXISTS `album` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(2000) NULL,
  `release_year` INT NULL,
  `band_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_album_band1_idx` (`band_id` ASC),
  INDEX `fk_album_status1_idx` (`status_id` ASC),
  CONSTRAINT `fk_album_band1`
    FOREIGN KEY (`band_id`)
    REFERENCES `band` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_album_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `song`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `song` ;

CREATE TABLE IF NOT EXISTS `song` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(2000) NULL,
  `length` VARCHAR(200) NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_song_album1_idx` (`album_id` ASC),
  CONSTRAINT `fk_song_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES `album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS concerts;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'concerts' IDENTIFIED BY 'concerts';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'concerts';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `band`
-- -----------------------------------------------------
START TRANSACTION;
USE `albumsdb`;
INSERT INTO `band` (`id`, `name`, `image_url`) VALUES (1, 'Cap\'n Jazz', 'https://dieangryblog.files.wordpress.com/2014/02/tumblr_n0v9coloal1tqb6sbo1_1280.jpg?w=1200');

COMMIT;


-- -----------------------------------------------------
-- Data for table `genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `albumsdb`;
INSERT INTO `genre` (`id`, `name`) VALUES (1, 'Indie Rock');
INSERT INTO `genre` (`id`, `name`) VALUES (2, 'Midwest Emo');
INSERT INTO `genre` (`id`, `name`) VALUES (3, 'Post-Hardcore');

COMMIT;


-- -----------------------------------------------------
-- Data for table `band_has_genre`
-- -----------------------------------------------------
START TRANSACTION;
USE `albumsdb`;
INSERT INTO `band_has_genre` (`band_id`, `genre_id`) VALUES (1, 1);
INSERT INTO `band_has_genre` (`band_id`, `genre_id`) VALUES (1, 2);
INSERT INTO `band_has_genre` (`band_id`, `genre_id`) VALUES (1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `status`
-- -----------------------------------------------------
START TRANSACTION;
USE `albumsdb`;
INSERT INTO `status` (`id`, `name`) VALUES (1, 'Own');
INSERT INTO `status` (`id`, `name`) VALUES (2, 'Want');

COMMIT;


-- -----------------------------------------------------
-- Data for table `album`
-- -----------------------------------------------------
START TRANSACTION;
USE `albumsdb`;
INSERT INTO `album` (`id`, `name`, `release_year`, `band_id`, `status_id`) VALUES (1, 'Burritos, Inspiration Point, Fork Balloon Sports, Cards in the Spokes, Automatic Biographies, Kites, Kung Fu, Trophies, Banana Peels We\'ve Slipped On and Egg Shells We\'ve Tippy Toed Over', 1995, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `song`
-- -----------------------------------------------------
START TRANSACTION;
USE `albumsdb`;
INSERT INTO `song` (`id`, `name`, `length`, `album_id`) VALUES (1, 'Little League', '3:57', 1);
INSERT INTO `song` (`id`, `name`, `length`, `album_id`) VALUES (2, 'Oh Messy Life', '2:03', 1);
INSERT INTO `song` (`id`, `name`, `length`, `album_id`) VALUES (3, 'Puddle Splashers', '2:07', 1);
INSERT INTO `song` (`id`, `name`, `length`, `album_id`) VALUES (4, 'Flashpoint: Catheter', '3:21', 1);
INSERT INTO `song` (`id`, `name`, `length`, `album_id`) VALUES (5, 'In the Clear', '1:57', 1);
INSERT INTO `song` (`id`, `name`, `length`, `album_id`) VALUES (6, 'Yes, I Am Talking to You', '2:32', 1);
INSERT INTO `song` (`id`, `name`, `length`, `album_id`) VALUES (7, 'Basil\'s Kite', '2:36', 1);
INSERT INTO `song` (`id`, `name`, `length`, `album_id`) VALUES (8, 'Bluegrassish', '1:08', 1);
INSERT INTO `song` (`id`, `name`, `length`, `album_id`) VALUES (9, 'Planet Shhh', '2:59', 1);
INSERT INTO `song` (`id`, `name`, `length`, `album_id`) VALUES (10, 'The Sands Have Turned Purple', '2:45', 1);
INSERT INTO `song` (`id`, `name`, `length`, `album_id`) VALUES (11, 'Precious', '2:39', 1);
INSERT INTO `song` (`id`, `name`, `length`, `album_id`) VALUES (12, '¡Qué suerte!', '3:04', 1);

COMMIT;

