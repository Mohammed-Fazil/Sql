-- MySQL Script generated by MySQL Workbench
-- Mon May 22 15:52:01 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`employees` ;

CREATE TABLE IF NOT EXISTS `mydb`.`employees` (
  `emp_no` INT(11) UNSIGNED NOT NULL,
  `birth_date` DATE NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `gender` ENUM('M', 'F') NOT NULL,
  `hire_date` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `employeescol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`emp_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`titles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`titles` ;

CREATE TABLE IF NOT EXISTS `mydb`.`titles` (
  `emp_no` INT(11) UNSIGNED NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`),
  CONSTRAINT `emp_no from employees table`
    FOREIGN KEY (`emp_no`)
    REFERENCES `mydb`.`employees` (`emp_no`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`salaries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`salaries` ;

CREATE TABLE IF NOT EXISTS `mydb`.`salaries` (
  `emp_no` INT(11) UNSIGNED NOT NULL,
  `from_date` DATE NOT NULL,
  `salary` INT(11) NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`),
  INDEX `tilte from title table_idx` (`emp_no` ASC, `from_date` ASC) VISIBLE,
  CONSTRAINT `emp no from employees`
    FOREIGN KEY (`emp_no`)
    REFERENCES `mydb`.`employees` (`emp_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT ``
    FOREIGN KEY (`emp_no` , `from_date`)
    REFERENCES `mydb`.`titles` (`emp_no` , `title`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`departments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`departments` ;

CREATE TABLE IF NOT EXISTS `mydb`.`departments` (
  `dept_no` CHAR(14) NOT NULL,
  `dept_name` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`dept_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`delpt_emp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`delpt_emp` ;

CREATE TABLE IF NOT EXISTS `mydb`.`delpt_emp` (
  `emp_no` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `demp_no` CHAR(14) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NOT NULL,
  PRIMARY KEY (`emp_no`, `demp_no`),
  INDEX `depno_idx` (`demp_no` ASC) VISIBLE,
  CONSTRAINT `empno`
    FOREIGN KEY (`emp_no`)
    REFERENCES `mydb`.`employees` (`emp_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `depno`
    FOREIGN KEY (`demp_no`)
    REFERENCES `mydb`.`departments` (`dept_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`dept_manager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`dept_manager` ;

CREATE TABLE IF NOT EXISTS `mydb`.`dept_manager` (
  `emp_no` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dept_no` CHAR(14) NOT NULL,
  `from_date` DATE NOT NULL,
  `to_date` DATE NULL,
  PRIMARY KEY (`emp_no`, `dept_no`, `from_date`),
  CONSTRAINT `dept no`
    FOREIGN KEY (`dept_no`)
    REFERENCES `mydb`.`departments` (`dept_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `empno`
    FOREIGN KEY (`emp_no`)
    REFERENCES `mydb`.`employees` (`emp_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
