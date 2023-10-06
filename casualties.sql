-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`School`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`School` (
  `SchoolID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  `SchoolType` VARCHAR(45) NOT NULL,
  `Unrollment` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`SchoolID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Location` (
  `LocationID` INT NOT NULL,
  `District` VARCHAR(45) NOT NULL,
  `County` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`LocationID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Shooter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Shooter` (
  `ShooterID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Age` INT NULL,
  `Gender` VARCHAR(45) NULL,
  `Ethnicity` VARCHAR(45) NULL,
  PRIMARY KEY (`ShooterID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Incident`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Incident` (
  `IncidentID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `SchoolID` INT NOT NULL,
  `ShooterID` INT NOT NULL,
  `LocationID` INT NOT NULL,
  PRIMARY KEY (`IncidentID`),
  INDEX `LocationID_idx` (`LocationID` ASC) VISIBLE,
  INDEX `ShooterID_idx` (`ShooterID` ASC) VISIBLE,
  INDEX `SchoolID_idx` (`SchoolID` ASC) VISIBLE,
  CONSTRAINT `LocationID`
    FOREIGN KEY (`LocationID`)
    REFERENCES `mydb`.`Location` (`LocationID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ShooterID`
    FOREIGN KEY (`ShooterID`)
    REFERENCES `mydb`.`Shooter` (`ShooterID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `SchoolID`
    FOREIGN KEY (`SchoolID`)
    REFERENCES `mydb`.`School` (`SchoolID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
