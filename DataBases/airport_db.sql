-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema airport_booking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema airport_booking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `airport_booking` DEFAULT CHARACTER SET utf8 ;
USE `airport_booking` ;

-- -----------------------------------------------------
-- Table `airport_booking`.`passengers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport_booking`.`passengers` (
  `passenger_idl` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NULL,
  PRIMARY KEY (`passenger_idl`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport_booking`.`airline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport_booking`.`airline` (
  `airline_confirmation_numbers` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`airline_confirmation_numbers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport_booking`.`airport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport_booking`.`airport` (
  `airport_id` INT NOT NULL AUTO_INCREMENT,
  `IATACode` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`airport_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport_booking`.`flight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport_booking`.`flight` (
  `number` INT NOT NULL AUTO_INCREMENT,
  `departure_date_time` DATETIME NOT NULL,
  `arrival_date_time` DATETIME NOT NULL,
  `duration` INT NOT NULL,
  `distance` INT NOT NULL,
  `airline_confirmation_numbers` INT NOT NULL,
  `departure_airport_id` INT NOT NULL,
  `arrival_airport_id` INT NOT NULL,
  PRIMARY KEY (`number`),
  INDEX `fk_flight_airport1_idx` (`departure_airport_id` ASC) VISIBLE,
  INDEX `fk_flight_airport2_idx` (`arrival_airport_id` ASC) VISIBLE,
  CONSTRAINT `fk_flight_airline`
    FOREIGN KEY (`airline_confirmation_numbers`)
    REFERENCES `airport_booking`.`airline` (`airline_confirmation_numbers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_flight_airport1`
    FOREIGN KEY (`departure_airport_id`)
    REFERENCES `airport_booking`.`airport` (`airport_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_flight_airport2`
    FOREIGN KEY (`arrival_airport_id`)
    REFERENCES `airport_booking`.`airport` (`airport_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport_booking`.`tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport_booking`.`tickets` (
  `ticket_num` INT NOT NULL AUTO_INCREMENT,
  `price` DECIMAL(7,2) NOT NULL,
  `flight_class` VARCHAR(50) NOT NULL,
  `confirmation_num` INT NOT NULL,
  `flight_number` INT NOT NULL,
  `passengers_passenger_idl` INT NOT NULL,
  PRIMARY KEY (`ticket_num`),
  INDEX `fk_tickets_flight1_idx` (`flight_number` ASC) VISIBLE,
  INDEX `fk_tickets_passengers1_idx` (`passengers_passenger_idl` ASC) VISIBLE,
  CONSTRAINT `fk_tickets_flight1`
    FOREIGN KEY (`flight_number`)
    REFERENCES `airport_booking`.`flight` (`number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tickets_passengers1`
    FOREIGN KEY (`passengers_passenger_idl`)
    REFERENCES `airport_booking`.`passengers` (`passenger_idl`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
