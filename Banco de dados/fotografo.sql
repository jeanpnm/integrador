
CREATE SCHEMA IF NOT EXISTS `fotografo` DEFAULT CHARACTER SET utf8 ;
USE `fotografo` ;

CREATE TABLE tb_administrador(
	id int auto_increment,
    nome varchar(100) not null,
    senha varchar(32) not null,
    primary key (id)
    );
select * from tb_administrador;

CREATE TABLE IF NOT EXISTS `fotografo`.`tb_album` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(200) NULL,
  PRIMARY KEY (`id_album`))
;
select * from tb_album;

SET foreign_key_checks = 0;
SET foreign_key_checks = 1;

CREATE TABLE IF NOT EXISTS `fotografo`.`tb_foto` (
  `id_foto` INT auto_increment NOT NULL,
  `id_album` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `foto_capa` INT(1) NULL,
  PRIMARY KEY (`id_foto`),
  INDEX `fk_tb_foto_tb_album_idx` (`id_album` ASC),
  CONSTRAINT `fk_tb_foto_tb_album`
    FOREIGN KEY (`id_album`)
    REFERENCES `fotografo`.`tb_album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
select * from tb_foto;




CREATE TABLE IF NOT EXISTS `fotografo`.`tb_tag` (
  `id_tag` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tag`))
;
select * from tb_tag;


CREATE TABLE IF NOT EXISTS `fotografo`.`tb_album_tag` (
  `id_album` INT NOT NULL,
  `id_tag` INT NOT NULL,
  PRIMARY KEY (`id_album`, `id_tag`),
  INDEX `fk_tb_album_tag_album_idx` (`id_album` ASC),
  INDEX `fk_tb_album_tag_tag_idx` (`id_tag` ASC),
  CONSTRAINT `fk_tb_album_tag_tag`
    FOREIGN KEY (`id_tag`)
    REFERENCES `fotografo`.`tb_tag` (`id_tag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_album_tag_album`
    FOREIGN KEY (`id_album`)
    REFERENCES `fotografo`.`tb_album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
select * from tb_album_tag;


