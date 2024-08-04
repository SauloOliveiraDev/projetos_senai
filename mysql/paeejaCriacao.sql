CREATE SCHEMA IF NOT EXISTS `paeeja` DEFAULT CHARACTER SET utf8 ;
USE `paeeja` ;

-- -----------------------------------------------------
-- Table `paeeja`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paeeja`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nomeUsuario` VARCHAR(45) NOT NULL,
  `sobrenomeUsuario` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `dtNascimento` DATE NULL,
  `nivelProgresso` INT NULL,
  `bairro` VARCHAR(45) NULL,
  `logradouro` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paeeja`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paeeja`.`Telefone` (
  `DDD` INT NOT NULL,
  `numero` VARCHAR(9) NOT NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`DDD`, `numero`, `Usuario_idUsuario`),
  INDEX `fk_Telefone_Usuario_idx` (`Usuario_idUsuario` ASC) ,
  CONSTRAINT `fk_Telefone_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `paeeja`.`Usuario` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paeeja`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paeeja`.`Curso` (
  `idCurso` INT NOT NULL AUTO_INCREMENT,
  `nomeCurso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paeeja`.`Cursa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paeeja`.`Cursa` (
  `idCursa` INT NOT NULL AUTO_INCREMENT,
  `Usuario_idUsuario` INT NOT NULL,
  `Curso_idCurso` INT NOT NULL,
  PRIMARY KEY (`idCursa`, `Usuario_idUsuario`, `Curso_idCurso`),
  INDEX `fk_Usuario_has_Curso_Curso1_idx` (`Curso_idCurso` ASC) ,
  INDEX `fk_Usuario_has_Curso_Usuario1_idx` (`Usuario_idUsuario` ASC) ,
  CONSTRAINT `fk_Usuario_has_Curso_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `paeeja`.`Usuario` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Usuario_has_Curso_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `paeeja`.`Curso` (`idCurso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paeeja`.`Modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paeeja`.`Modulo` (
  `numeroModulo` INT NOT NULL auto_increment,
  `Curso_idCurso` INT NOT NULL,
  `nomeModulo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`numeroModulo`, `Curso_idCurso`),
  INDEX `fk_Modulo_Curso1_idx` (`Curso_idCurso` ASC) ,
  CONSTRAINT `fk_Modulo_Curso1`
    FOREIGN KEY (`Curso_idCurso`)
    REFERENCES `paeeja`.`Curso` (`idCurso`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paeeja`.`Questao_Teste`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paeeja`.`Questao_Teste` (
  `idQuestao` INT NOT NULL AUTO_INCREMENT,
  `pergunta` VARCHAR(400) NOT NULL,
  `alternativaA` VARCHAR(200) NOT NULL,
  `alternativaB` VARCHAR(200) NOT NULL,
  `alternativaC` VARCHAR(200) NOT NULL,
  `alternativaD` VARCHAR(200) NOT NULL,
  `respostaCorreta` VARCHAR(45) NULL,
  `Modulo_numeroModulo` INT NOT NULL,
  PRIMARY KEY (`idQuestao`, `Modulo_numeroModulo`),
  INDEX `fk_Questao_Teste_Modulo1_idx` (`Modulo_numeroModulo` ASC) ,
  CONSTRAINT `fk_Questao_Teste_Modulo1`
    FOREIGN KEY (`Modulo_numeroModulo`)
    REFERENCES `paeeja`.`Modulo` (`numeroModulo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paeeja`.`Aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paeeja`.`Aula` (
  `idAula` INT NOT NULL AUTO_INCREMENT,
  `linkVideoAula` VARCHAR(70) NOT NULL,
  `nomeAula` VARCHAR(55) NOT NULL,
  `Modulo_numeroModulo` INT NOT NULL,
  PRIMARY KEY (`idAula`, `Modulo_numeroModulo`),
  INDEX `fk_Aula_Modulo1_idx` (`Modulo_numeroModulo` ASC) ,
  CONSTRAINT `fk_Aula_Modulo1`
    FOREIGN KEY (`Modulo_numeroModulo`)
    REFERENCES `paeeja`.`Modulo` (`numeroModulo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paeeja`.`Aula_Excluida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paeeja`.`Aula_Excluida` (
  `idAulaExcluida` INT NOT NULL AUTO_INCREMENT,
  `idAula_antiga` INT NOT NULL ,
  `linkVideoAula_antigo` VARCHAR(70) NOT NULL,
  `nomeAula` VARCHAR(55) NOT NULL,
  `modulo_antigo` INT NOT NULL,
  PRIMARY KEY (`idAulaExcluida`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paeeja`.`Questao_Questionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paeeja`.`Questao_Questionario` (
  `idQuestao` INT NOT NULL AUTO_INCREMENT,
  `Aula_idAula` INT NOT NULL,
  `pergunta` VARCHAR(400) NOT NULL,
  `alternativaA` VARCHAR(200) NOT NULL,
  `alternativaB` VARCHAR(200) NOT NULL,
  `alternativaC` VARCHAR(200) NOT NULL,
  `alternativaD` VARCHAR(200) NOT NULL,
  `respostaCorreta` VARCHAR(45) NULL,
  PRIMARY KEY (`idQuestao`, `Aula_idAula`),
  INDEX `fk_Questao_Questionario_Aula1_idx` (`Aula_idAula` ASC) ,
  CONSTRAINT `fk_Questao_Questionario_Aula1`
    FOREIGN KEY (`Aula_idAula`)
    REFERENCES `paeeja`.`Aula` (`idAula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paeeja`.`Cursa_Modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paeeja`.`Cursa_Modulo` (
  `idCursa_Modulo` INT NOT NULL AUTO_INCREMENT,
  `Cursa_idCursa` int NOT NULL,
  `Modulo_numeroModulo` INT NOT NULL,
  `nota` FLOAT NULL,
  PRIMARY KEY (`idCursa_Modulo`, `Cursa_idCursa`, `Modulo_numeroModulo`),
  INDEX `fk_Cursa_has_Modulo_Modulo1_idx` (`Modulo_numeroModulo` ASC) ,
  INDEX `fk_Cursa_Modulo_Cursa1_idx` (`Cursa_idCursa` ASC) ,
  CONSTRAINT `fk_Cursa_has_Modulo_Modulo1`
    FOREIGN KEY (`Modulo_numeroModulo`)
    REFERENCES `paeeja`.`Modulo` (`numeroModulo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Cursa_Modulo_Cursa1`
    FOREIGN KEY (`Cursa_idCursa`)
    REFERENCES `paeeja`.`Cursa` (`idCursa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paeeja`.`Cursa_Aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paeeja`.`Cursa_Aula` (
  `idCursa_Aula` INT NOT NULL AUTO_INCREMENT,
  `Aula_idAula` INT NOT NULL,
  `Cursa_Modulo_idCursa_Modulo` INT NOT NULL,
  PRIMARY KEY (`idCursa_Aula`, `Aula_idAula`, `Cursa_Modulo_idCursa_Modulo`),
  INDEX `fk_Cursa_Aula_Aula1_idx` (`Aula_idAula` ASC) ,
  INDEX `fk_Cursa_Aula_Cursa_Modulo1_idx` (`Cursa_Modulo_idCursa_Modulo` ASC) ,
  CONSTRAINT `fk_Cursa_Aula_Aula1`
    FOREIGN KEY (`Aula_idAula`)
    REFERENCES `paeeja`.`Aula` (`idAula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Cursa_Aula_Cursa_Modulo1`
    FOREIGN KEY (`Cursa_Modulo_idCursa_Modulo`)
    REFERENCES `paeeja`.`Cursa_Modulo` (`idCursa_Modulo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paeeja`.`RespostaUsuarioTeste`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paeeja`.`RespostaUsuarioTeste` (
  `idRespostaUsuarioTeste` INT NOT NULL AUTO_INCREMENT,
  `Questao_Teste_idQuestao` INT NOT NULL,
  `Cursa_Modulo_idCursa_Modulo` INT NOT NULL,
  `resposta` VARCHAR(45) NULL,
  `status` INT NULL,
  PRIMARY KEY (`idRespostaUsuarioTeste`, `Questao_Teste_idQuestao`, `Cursa_Modulo_idCursa_Modulo`),
  INDEX `fk_RespostaUsuarioTeste_Questao_Teste1_idx` (`Questao_Teste_idQuestao` ASC) ,
  INDEX `fk_RespostaUsuarioTeste_Cursa_Modulo1_idx` (`Cursa_Modulo_idCursa_Modulo` ASC) ,
  CONSTRAINT `fk_RespostaUsuarioTeste_Questao_Teste1`
    FOREIGN KEY (`Questao_Teste_idQuestao`)
    REFERENCES `paeeja`.`Questao_Teste` (`idQuestao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_RespostaUsuarioTeste_Cursa_Modulo1`
    FOREIGN KEY (`Cursa_Modulo_idCursa_Modulo`)
    REFERENCES `paeeja`.`Cursa_Modulo` (`idCursa_Modulo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paeeja`.`RespostaUsuarioQuestionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `paeeja`.`RespostaUsuarioQuestionario` (
  `idRespostaUsuarioQuestionario` INT NOT NULL AUTO_INCREMENT,
  `Questao_Questionario_idQuestao` INT NOT NULL,
  `Cursa_Aula_idCursa_Aula` INT NOT NULL,
  `resposta` VARCHAR(45) NULL,
  `status` INT NULL,
  PRIMARY KEY (`idRespostaUsuarioQuestionario`, `Questao_Questionario_idQuestao`, `Cursa_Aula_idCursa_Aula`),
  INDEX `fk_RespostaUsuarioQuestionario_Questao_Questionario1_idx` (`Questao_Questionario_idQuestao` ASC) ,
  INDEX `fk_RespostaUsuarioQuestionario_Cursa_Aula1_idx` (`Cursa_Aula_idCursa_Aula` ASC) ,
  CONSTRAINT `fk_RespostaUsuarioQuestionario_Questao_Questionario1`
    FOREIGN KEY (`Questao_Questionario_idQuestao`)
    REFERENCES `paeeja`.`Questao_Questionario` (`idQuestao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_RespostaUsuarioQuestionario_Cursa_Aula1`
    FOREIGN KEY (`Cursa_Aula_idCursa_Aula`)
    REFERENCES `paeeja`.`Cursa_Aula` (`idCursa_Aula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;