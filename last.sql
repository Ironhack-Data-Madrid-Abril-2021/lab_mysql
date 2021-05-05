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
-- Table `mydb`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cars` (
  `VIN` VARCHAR(255) NOT NULL,
  `Manufacturer` VARCHAR(255) NOT NULL,
  `Model year` YEAR(4) NOT NULL,
  `Colour` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`VIN`));


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `Customer ID` VARCHAR(255) NOT NULL COMMENT 'Accepts numbers or letters',
  `Name` VARCHAR(255) NOT NULL COMMENT 'Full name',
  `Phone` VARCHAR(45) NOT NULL COMMENT 'Must include country code (acceptable + or 00)',
  `Email` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State/ Province` VARCHAR(45) NOT NULL,
  `Zip/ Postal Code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Customer ID`));


-- -----------------------------------------------------
-- Table `mydb`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Salespersons` (
  `Staff ID` VARCHAR(255) NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `Store` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Staff ID`));


-- -----------------------------------------------------
-- Table `mydb`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoices` (
  `Invoice number` VARCHAR(255) NOT NULL,
  `Date` DATE NOT NULL,
  `Salespersons_Staff ID` VARCHAR(255) NOT NULL,
  `Customer_Customer ID` VARCHAR(255) NOT NULL,
  `Cars_VIN` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Invoice number`),
  INDEX `fk_Invoices_Salespersons_idx` (`Salespersons_Staff ID` ASC) VISIBLE,
  INDEX `fk_Invoices_Customer1_idx` (`Customer_Customer ID` ASC) VISIBLE,
  INDEX `fk_Invoices_Cars1_idx` (`Cars_VIN` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Salespersons`
    FOREIGN KEY (`Salespersons_Staff ID`)
    REFERENCES `mydb`.`Salespersons` (`Staff ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customer1`
    FOREIGN KEY (`Customer_Customer ID`)
    REFERENCES `mydb`.`Customer` (`Customer ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars_VIN`)
    REFERENCES `mydb`.`Cars` (`VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
