-- MySQL Script generated by MySQL Workbench
-- Tue Mar 31 15:05:10 2020
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
-- Table `mydb`.`produit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`produit` ;

CREATE TABLE IF NOT EXISTS `mydb`.`produit` (
  `idproduit` INT NOT NULL AUTO_INCREMENT,
  `prix` VARCHAR(45) NULL,
  `taille` VARCHAR(45) NULL,
  `modele` VARCHAR(45) NULL,
  `stock` VARCHAR(45) NULL,
  PRIMARY KEY (`idproduit`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`commande`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`commande` ;

CREATE TABLE IF NOT EXISTS `mydb`.`commande` (
  `idcommande` INT NOT NULL AUTO_INCREMENT,
  `dateCommande` DATE NULL,
  `dateLivraison` VARCHAR(45) NULL,
  `destinataire` VARCHAR(45) NULL,
  `commandecol` VARCHAR(45) NULL,
  `produit_idproduit` INT NULL,
  PRIMARY KEY (`idcommande`),
  INDEX `fk_commande_produit1_idx` (`produit_idproduit` ASC),
  CONSTRAINT `fk_commande_produit1`
    FOREIGN KEY (`produit_idproduit`)
    REFERENCES `mydb`.`produit` (`idproduit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`client` ;

CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `idclient` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `prenom` VARCHAR(45) NULL,
  `telephone` INT NULL,
  `email` VARCHAR(45) NULL,
  `adresse` VARCHAR(45) NULL,
  `code_postal` INT NULL,
  `ville` VARCHAR(45) NULL,
  `pays` VARCHAR(45) NULL,
  `region` VARCHAR(45) NULL,
  `commande_idcommande` INT NULL,
  PRIMARY KEY (`idclient`),
  INDEX `fk_client_commande_idx` (`commande_idcommande` ASC),
  CONSTRAINT `fk_client_commande`
    FOREIGN KEY (`commande_idcommande`)
    REFERENCES `mydb`.`commande` (`idcommande`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fournisseur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`fournisseur` ;

CREATE TABLE IF NOT EXISTS `mydb`.`fournisseur` (
  `idfournisseur` INT NOT NULL AUTO_INCREMENT,
  `societe` VARCHAR(45) NULL,
  `contact` VARCHAR(45) NULL,
  `telephone` VARCHAR(45) NULL,
  `fax` VARCHAR(45) NULL,
  `pays` VARCHAR(45) NULL,
  `region` VARCHAR(45) NULL,
  `ville` VARCHAR(45) NULL,
  `code_postal` VARCHAR(45) NULL,
  `adresse` VARCHAR(45) NULL,
  `produit_idproduit` INT NULL,
  PRIMARY KEY (`idfournisseur`),
  INDEX `fk_fournisseur_produit1_idx` (`produit_idproduit` ASC),
  CONSTRAINT `fk_fournisseur_produit1`
    FOREIGN KEY (`produit_idproduit`)
    REFERENCES `mydb`.`produit` (`idproduit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
