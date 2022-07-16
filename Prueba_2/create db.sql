SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_nuxiba
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_nuxiba` DEFAULT CHARACTER SET utf8 ;
USE `db_nuxiba` ;

-- -----------------------------------------------------
-- Table `db_nuxiba`.`Usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_nuxiba`.`Usuarios` ;

CREATE TABLE IF NOT EXISTS `db_nuxiba`.`Usuarios` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(100) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `paterno` VARCHAR(100) NOT NULL,
  `materno` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_nuxiba`.`Empleados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_nuxiba`.`Empleados` ;

CREATE TABLE IF NOT EXISTS `db_nuxiba`.`Empleados` (
  `empleadoId` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(100) NOT NULL,
  `sueldo` DOUBLE NULL,
  `fechaIngreso` DATE NULL,
  `userId` INT NOT NULL,
  PRIMARY KEY (`empleadoId`, `userId`),
  INDEX `userId_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `userId`
    FOREIGN KEY (`userId`)
    REFERENCES `db_nuxiba`.`Usuarios` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
