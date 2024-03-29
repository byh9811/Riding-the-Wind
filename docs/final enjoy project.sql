-- MySQL Script generated by MySQL Workbench
-- Fri Apr 14 16:52:29 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema riding_the_wind
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema riding_the_wind
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `riding_the_wind` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema riding_the_wind
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema riding_the_wind
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `riding_the_wind` DEFAULT CHARACTER SET utf8mb3 ;
USE `riding_the_wind` ;

-- -----------------------------------------------------
-- Table `riding_the_wind`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`user` (
  `user_id` VARCHAR(20) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(100) NOT NULL,
  `email_id` VARCHAR(45) NOT NULL,
  `email_domain` VARCHAR(45) NOT NULL,
  `birth` varchar(10) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `joindate` TIMESTAMP NULL DEFAULT now(),
  `phone` CHAR(13) NOT NULL,
  `deleted` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `nickname_UNIQUE` (`nickname` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)

ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `riding_the_wind`.`notice_article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`notice_article` (
  `article_no` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(20) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` VARCHAR(500) NOT NULL,
  `register_time` TIMESTAMP NOT NULL DEFAULT now(),
  `modify_time` TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (`article_no`),
  UNIQUE INDEX `article_no_UNIQUE` (`article_no` ASC) VISIBLE,
  INDEX `user_user_id_fk_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `riding_the_wind`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `riding_the_wind`.`place_article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`place_article` (
  `article_no` INT NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` VARCHAR(500) NOT NULL,
  `register_time` TIMESTAMP NOT NULL DEFAULT now(),
  `view` INT NOT NULL DEFAULT 0,
  `like` INT NOT NULL DEFAULT 0,
  `modify_time` TIMESTAMP NULL DEFAULT now(),
  PRIMARY KEY (`article_no`),
  UNIQUE INDEX `article_no_UNIQUE` (`article_no` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `riding_the_wind`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`comment` (
  `comment_no` INT NOT NULL AUTO_INCREMENT,
  `article_no` INT NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  `content` VARCHAR(200) NOT NULL,
  `register_time` TIMESTAMP NOT NULL DEFAULT now(),
  `modify_time` TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (`comment_no`, `article_no`),
  UNIQUE INDEX `comment_no_UNIQUE` (`comment_no` ASC) VISIBLE,
  INDEX `fk_place_article_article_no_idx` (`article_no` ASC) VISIBLE,
  CONSTRAINT `fk_place_article_article_no`
    FOREIGN KEY (`article_no`)
    REFERENCES `riding_the_wind`.`place_article` (`article_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `riding_the_wind`.`personal_trip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`personal_trip` (
  `content_id` INT NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  `select` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`content_id`, `user_id`),
  INDEX `fk_user_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `riding_the_wind`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `riding_the_wind` ;

-- -----------------------------------------------------
-- Table `riding_the_wind`.`sido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`sido` (
  `sido_code` INT NOT NULL,
  `sido_name` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`sido_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `riding_the_wind`.`gugun`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`gugun` (
  `gugun_code` INT NOT NULL,
  `gugun_name` VARCHAR(30) NULL DEFAULT NULL,
  `sido_code` INT NOT NULL,
  PRIMARY KEY (`gugun_code`, `sido_code`),
  INDEX `gugun_to_sido_sido_code_fk_idx` (`sido_code` ASC) VISIBLE,
  CONSTRAINT `gugun_to_sido_sido_code_fk`
    FOREIGN KEY (`sido_code`)
    REFERENCES `riding_the_wind`.`sido` (`sido_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `riding_the_wind`.`attraction_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`attraction_info` (
  `content_id` INT NOT NULL,
  `content_type_id` INT NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `addr1` VARCHAR(100) NULL DEFAULT NULL,
  `addr2` VARCHAR(50) NULL DEFAULT NULL,
  `zipcode` VARCHAR(50) NULL DEFAULT NULL,
  `tel` VARCHAR(50) NULL DEFAULT NULL,
  `first_image` VARCHAR(200) NULL DEFAULT NULL,
  `first_image2` VARCHAR(200) NULL DEFAULT NULL,
  `readcount` INT NULL DEFAULT NULL,
  `sido_code` INT NULL DEFAULT NULL,
  `gugun_code` INT NULL DEFAULT NULL,
  `latitude` DECIMAL(20,17) NULL DEFAULT NULL,
  `longitude` DECIMAL(20,17) NULL DEFAULT NULL,
  `mlevel` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  INDEX `attraction_to_content_type_id_fk_idx` (`content_type_id` ASC) VISIBLE,
  INDEX `attraction_to_sido_code_fk_idx` (`sido_code` ASC) VISIBLE,
  INDEX `attraction_to_gugun_code_fk_idx` (`gugun_code` ASC) VISIBLE,
  CONSTRAINT `attraction_to_content_type_id_fk`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `riding_the_wind`.`content_type` (`content_type_id`),
  CONSTRAINT `attraction_to_gugun_code_fk`
    FOREIGN KEY (`gugun_code`)
    REFERENCES `riding_the_wind`.`gugun` (`gugun_code`),
  CONSTRAINT `attraction_to_sido_code_fk`
    FOREIGN KEY (`sido_code`)
    REFERENCES `riding_the_wind`.`sido` (`sido_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `riding_the_wind`.`attraction_description`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`attraction_description` (
  `content_id` INT NOT NULL,
  `homepage` VARCHAR(100) NULL DEFAULT NULL,
  `overview` VARCHAR(10000) NULL DEFAULT NULL,
  `telname` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  CONSTRAINT `attraction_detail_to_attraciton_id_fk`
    FOREIGN KEY (`content_id`)
    REFERENCES `riding_the_wind`.`attraction_info` (`content_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `riding_the_wind`.`attraction_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`attraction_detail` (
  `content_id` INT NOT NULL,
  `cat1` VARCHAR(3) NULL DEFAULT NULL,
  `cat2` VARCHAR(5) NULL DEFAULT NULL,
  `cat3` VARCHAR(9) NULL DEFAULT NULL,
  `created_time` VARCHAR(14) NULL DEFAULT NULL,
  `modified_time` VARCHAR(14) NULL DEFAULT NULL,
  `booktour` VARCHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  CONSTRAINT `attraction_detail_to_basic_content_id_fk`
    FOREIGN KEY (`content_id`)
    REFERENCES `riding_the_wind`.`attraction_info` (`content_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `riding_the_wind`.`place_article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`place_article` (
  `article_no` INT NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` VARCHAR(500) NOT NULL,
  `register_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `view` INT NOT NULL DEFAULT '0',
  `like` INT NOT NULL DEFAULT '0',
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_no`),
  UNIQUE INDEX `article_no_UNIQUE` (`article_no` ASC) VISIBLE,
  constraint `place_article_to_user_user_id_fk`
	foreign key (`user_id`)
    references `riding_the_wind`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `riding_the_wind`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`comment` (
  `comment_no` INT NOT NULL AUTO_INCREMENT,
  `article_no` INT NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  `content` VARCHAR(200) NOT NULL,
  `register_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_no`, `article_no`),
  UNIQUE INDEX `comment_no_UNIQUE` (`comment_no` ASC) VISIBLE,
  INDEX `fk_place_article_article_no_idx` (`article_no` ASC) VISIBLE,
  CONSTRAINT `fk_place_article_article_no`
    FOREIGN KEY (`article_no`)
    REFERENCES `riding_the_wind`.`place_article` (`article_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `riding_the_wind`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`user` (
  `user_id` VARCHAR(20) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(100) NOT NULL,
  `email_id` VARCHAR(45) NOT NULL,
  `email_domain` VARCHAR(45) NOT NULL,
  `birth` TIMESTAMP NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `joindate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` CHAR(13) NOT NULL,
  `deleted` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC) VISIBLE,
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `email_id_UNIQUE` (`email_id` ASC) VISIBLE,
  UNIQUE INDEX `nickname_UNIQUE` (`nickname` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `riding_the_wind`.`notice_article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`notice_article` (
  `article_no` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(20) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `content` VARCHAR(500) NOT NULL,
  `register_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_no`),
  UNIQUE INDEX `article_no_UNIQUE` (`article_no` ASC) VISIBLE,
  INDEX `user_user_id_fk_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_user_id_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `riding_the_wind`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `riding_the_wind`.`personal_trip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `riding_the_wind`.`personal_trip` (
  `content_id` INT NOT NULL,
  `user_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`content_id`, `user_id`),
  INDEX `fk_user_user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_personal_trip_attraction_info1_idx` (`content_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `riding_the_wind`.`user` (`user_id`),
  CONSTRAINT `fk_personal_trip_attraction_info1`
    FOREIGN KEY (`content_id`)
    REFERENCES `riding_the_wind`.`attraction_info` (`content_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
