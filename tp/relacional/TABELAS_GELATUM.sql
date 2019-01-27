-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema GELATUM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GELATUM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GELATUM` DEFAULT CHARACTER SET utf8 ;
USE `GELATUM` ;

-- -----------------------------------------------------
-- Table `GELATUM`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GELATUM`.`Cliente` (
  `nif` INT NOT NULL,
  `nome_cliente` VARCHAR(45) NOT NULL,
  `password_cliente` VARCHAR(20) NOT NULL,
  `nome_utilizador` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telemovel` INT NOT NULL,
  `data_nascimento` DATE NOT NULL,
  PRIMARY KEY (`nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GELATUM`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GELATUM`.`Funcionario` (
  `id_funcionario` INT NOT NULL AUTO_INCREMENT,
  `nome_funcionario` VARCHAR(45) NOT NULL,
  `password_funcionario` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_funcionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GELATUM`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GELATUM`.`Pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `dataP` DATETIME NOT NULL,
  `valor_total` DECIMAL(5,2) NOT NULL,
  `tempo` INT NOT NULL,
  `pago` TINYINT NOT NULL,
  `recolhido` TINYINT NOT NULL,
  `desconto` DECIMAL(3,2) NOT NULL,
  `id_funcionario` INT NOT NULL,
  `nif` INT NOT NULL,
  PRIMARY KEY (`id_pedido`),
  INDEX `fk_Pedido_Funcionario1_idx` (`id_funcionario` ASC) VISIBLE,
  INDEX `fk_Pedido_Cliente1_idx` (`nif` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Funcionario1`
    FOREIGN KEY (`id_funcionario`)
    REFERENCES `GELATUM`.`Funcionario` (`id_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`nif`)
    REFERENCES `GELATUM`.`Cliente` (`nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GELATUM`.`Gelado_Base`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GELATUM`.`Gelado_Base` (
  `id_gelado` INT NOT NULL AUTO_INCREMENT,
  `nome_gelado` VARCHAR(45) NOT NULL,
  `preco_gelado` DECIMAL(4,2) NOT NULL,
  `stock_gelado` INT NOT NULL,
  `composicao_gelado` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`id_gelado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GELATUM`.`Extra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GELATUM`.`Extra` (
  `id_extra` INT NOT NULL AUTO_INCREMENT,
  `nome_extra` VARCHAR(45) BINARY NOT NULL,
  `preco_extra` DECIMAL(4,2) NOT NULL,
  `composicao_extra` VARCHAR(100) NOT NULL,
  `stock_extra` INT NOT NULL,
  PRIMARY KEY (`id_extra`),
  UNIQUE INDEX `nome_UNIQUE` (`nome_extra` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GELATUM`.`Criacao_Gelado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GELATUM`.`Criacao_Gelado` (
  `id_criacao` INT NOT NULL AUTO_INCREMENT,
  `valor_criacao` DECIMAL(4,2) NOT NULL,
  `id_gelado` INT NOT NULL,
  PRIMARY KEY (`id_criacao`),
  INDEX `fk_Criacao_Gelado_Gelado_Base1_idx` (`id_gelado` ASC) VISIBLE,
  CONSTRAINT `fk_Criacao_Gelado_Gelado_Base1`
    FOREIGN KEY (`id_gelado`)
    REFERENCES `GELATUM`.`Gelado_Base` (`id_gelado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GELATUM`.`Criacao_Gelado__Extra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GELATUM`.`Criacao_Gelado__Extra` (
  `id_criacao` INT NOT NULL,
  `id_extra` INT NOT NULL,
  `quantidade_extra` INT NOT NULL,
  PRIMARY KEY (`id_criacao`, `id_extra`),
  INDEX `fk_Criacao_Gelado_has_Extra_Extra1_idx` (`id_extra` ASC) VISIBLE,
  INDEX `fk_Criacao_Gelado_has_Extra_Criacao_Gelado1_idx` (`id_criacao` ASC) VISIBLE,
  CONSTRAINT `fk_Criacao_Gelado_has_Extra_Criacao_Gelado1`
    FOREIGN KEY (`id_criacao`)
    REFERENCES `GELATUM`.`Criacao_Gelado` (`id_criacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Criacao_Gelado_has_Extra_Extra1`
    FOREIGN KEY (`id_extra`)
    REFERENCES `GELATUM`.`Extra` (`id_extra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GELATUM`.`Pedido__Criacao_Gelado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GELATUM`.`Pedido__Criacao_Gelado` (
  `id_pedido` INT NOT NULL,
  `id_criacao` INT NOT NULL,
  `quantidade_criacao` INT NOT NULL,
  PRIMARY KEY (`id_pedido`, `id_criacao`),
  INDEX `fk_Pedido_has_Criacao_Gelado_Criacao_Gelado1_idx` (`id_criacao` ASC) VISIBLE,
  INDEX `fk_Pedido_has_Criacao_Gelado_Pedido1_idx` (`id_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_has_Criacao_Gelado_Pedido1`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `GELATUM`.`Pedido` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_has_Criacao_Gelado_Criacao_Gelado1`
    FOREIGN KEY (`id_criacao`)
    REFERENCES `GELATUM`.`Criacao_Gelado` (`id_criacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
