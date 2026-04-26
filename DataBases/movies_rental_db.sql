-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema movies_rental
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema movies_rental
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movies_rental` DEFAULT CHARACTER SET utf8 ;
USE `movies_rental` ;

-- -----------------------------------------------------
-- Table `movies_rental`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_rental`.`roles` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `describtion` VARCHAR(255) NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_rental`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_rental`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_user_role_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_role`
    FOREIGN KEY (`role_id`)
    REFERENCES `movies_rental`.`roles` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_rental`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_rental`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_rental`.`movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_rental`.`movies` (
  `Movie_id` INT NOT NULL AUTO_INCREMENT,
  `barcode` VARCHAR(50) NOT NULL,
  `daily_rantal_rate` DECIMAL(7,2) NOT NULL,
  `num_in_stock` INT NOT NULL,
  PRIMARY KEY (`Movie_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_rental`.`coupon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_rental`.`coupon` (
  `coupon_id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(50) NOT NULL,
  `discription` VARCHAR(255) NOT NULL,
  `discount` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`coupon_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies_rental`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies_rental`.`rental` (
  `customer_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  `coupon_coupon_id` INT NULL,
  `rent_date` DATE NOT NULL,
  `return_date` DATE NOT NULL,
  PRIMARY KEY (`customer_id`, `movie_id`),
  INDEX `fk_customers_has_Movies_Movies1_idx` (`movie_id` ASC) VISIBLE,
  INDEX `fk_customers_has_Movies_customers1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_rental_coupon1_idx` (`coupon_coupon_id` ASC) VISIBLE,
  CONSTRAINT `fk_customers_has_Movies_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `movies_rental`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customers_has_Movies_Movies1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies_rental`.`movies` (`Movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_coupon1`
    FOREIGN KEY (`coupon_coupon_id`)
    REFERENCES `movies_rental`.`coupon` (`coupon_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
