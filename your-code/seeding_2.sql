-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`cars` (
  `carVIN` INT NOT NULL,
  `Manufacture` VARCHAR(45) NULL DEFAULT NULL,
  `Model` VARCHAR(45) NULL DEFAULT NULL,
  `Year` INT NULL DEFAULT NULL,
  `Color` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`carVIN`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `lab_mysql`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`customer` (
  `customerid` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `phone` INT NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `adress` VARCHAR(45) NULL DEFAULT NULL,
  `cirty` VARCHAR(45) NULL DEFAULT NULL,
  `state` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `zipcode` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`customerid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `lab_mysql`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`salesperson` (
  `salespersonname` VARCHAR(45) NOT NULL,
  `Staffid` INT NULL DEFAULT NULL,
  `store` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`salespersonname`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `lab_mysql`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`invoices` (
  `invocienumber` INT NOT NULL,
  `customerid` INT NOT NULL,
  `salespersonname` VARCHAR(45) NOT NULL,
  `carVIN` INT NOT NULL,
  `date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`invocienumber`, `customerid`, `salespersonname`, `carVIN`),
  INDEX `fk_Invoices_Customer_idx` (`customerid` ASC) VISIBLE,
  INDEX `fk_Invoices_Cars1_idx` (`carVIN` ASC) VISIBLE,
  INDEX `fk_Invoices_Salesperson1_idx` (`salespersonname` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`carVIN`)
    REFERENCES `lab_mysql`.`cars` (`carVIN`),
  CONSTRAINT `fk_Invoices_Customer`
    FOREIGN KEY (`customerid`)
    REFERENCES `lab_mysql`.`customer` (`customerid`),
  CONSTRAINT `fk_Invoices_Salesperson1`
    FOREIGN KEY (`salespersonname`)
    REFERENCES `lab_mysql`.`salesperson` (`salespersonname`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
