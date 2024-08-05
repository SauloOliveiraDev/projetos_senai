use paeeja;

-- ---------------------------------------------------------------------------------------------
--  CRIANDO VIEW PARA GERENCIAR O PROGRESSO DO USUARIO(CURSO QUE ESTÁ CURSANDO, O MODULO, AULA) 
-- ---------------------------------------------------------------------------------------------
create view gerenciador_de_progresso as 
select nomeUsuario, sobrenomeUsuario, nomecurso, nomeModulo, nomeAula, nota from usuario inner join curso 
inner join cursa on Usuario_idUsuario = idUsuario and curso_idcurso = idcurso
inner join modulo 
inner join cursa_modulo on Modulo_numeroModulo = numeroModulo and Cursa_idCursa = idCursa
inner join aula 
inner join cursa_aula on Aula_idAula = idAula and Cursa_Modulo_idCursa_Modulo = idCursa_Modulo;

-- ---------------------------------------------------------
--  CRIANDO VIEW PARA GERENCIAR OS DADOS BASICOS DO USUARIO
-- ---------------------------------------------------------
create view dados_basicos_usuario as 
select nomeUsuario, sobrenomeUsuario, cpf, email, ddd, numero 
from usuario 
inner join telefone on Usuario_idUsuario = idUsuario;

-- ----------------------------------------------
--   SELECIONAR A VIEW GERENCIADORA DE PROGRESSO
-- ----------------------------------------------
SELECT * FROM paeeja.gerenciador_de_progresso;

-- --------------------------------------------------
--  SELECIONAR A VIEW DOS DADOS BASICOS DOS USUARIOS
-- --------------------------------------------------
SELECT * FROM paeeja.dados_basicos_usuario;

-- --------------------------------------------------------------
--  CRIANDO PROCEDURE QUE PROCURA OS ALUNOS DE DETERMINADO CURSO
-- --------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE getPessoaCursaCurso(in nomedCurso varchar(45))
BEGIN
	SELECT * FROM paeeja.gerenciador_de_progresso 
    where nomedCurso = nomecurso;
END$$
DELIMITER ;

-- -------------------------------------------------------------------------------
--  CRIANDO PROCEDURE QUE INSIRA UM MODULO E UMA AULA DESSE MODULO AO MESMO TEMPO
-- -------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE inserirModuloAula(in iCurso int, in inomeModulo varchar(45), in ilink varchar(70), in inomeAula varchar(55))
BEGIN
	declare  numeroDoModulo int;
    
    insert into modulo(Curso_idCurso, nomeModulo)
	values
	(iCurso, inomeModulo);
    
    select numeroModulo into numeroDoModulo
    from modulo 
    where Curso_idCurso = iCurso and nomeModulo = inomeModulo;
    
    insert into aula(linkVideoAula, nomeAula, Modulo_numeroModulo)
    values
    (ilink, inomeAula, numeroDoModulo)
    ;

END$$
DELIMITER ;

-- -----------------------------------------------------------------
--  EXECUTANDO PROCEDURE QUE PROCURA OS ALUNOS DE DETERMINADO CURSO
-- -----------------------------------------------------------------
call getPessoaCursaCurso('Português');

-- ----------------------------------------------------
--  EXECUTANDO PROCEDURE QUE INSIRA NOVO MODULO E AULA
-- ----------------------------------------------------
call inserirModuloAula('1', 'Modulo Fundamental II', 'www.youtube.com', 'raiz');
select * from curso; -- verificando o id do curso
select * from modulo order by Curso_idCurso; -- verificando os modulos

-- -----------------------------------------------------------------------------------------------------------------------------
--  CRIANDO UMA PROCEDURE PARA COMPARAR A RESPOSTA INSERIDA COM A RESPOSTA CORRETA SE IGUAIS ATRIBUI O VALOR "1" A COLUNA STATUS
-- -----------------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE compara_resposta(Questao_Teste_idQuestao INT, iresposta VARCHAR(45), cModulo INT)
BEGIN
  DECLARE correta VARCHAR(45);

  SELECT respostaCorreta 
  INTO correta 
  FROM Questao_Teste 
  WHERE idQuestao = Questao_Teste_idQuestao;

  IF iresposta = correta THEN
    UPDATE respostausuarioteste
    SET `status` = 1
    WHERE Questao_Teste_idQuestao = Questao_Teste_idQuestao 
      AND Cursa_Modulo_idCursa_Modulo = cModulo 
      AND resposta = iresposta;
  ELSE
    UPDATE respostausuarioteste
    SET `status` = 2
    WHERE Questao_Teste_idQuestao = Questao_Teste_idQuestao 
      AND Cursa_Modulo_idCursa_Modulo = cModulo 
      AND resposta = iresposta;
  END IF;

END $$
DELIMITER ;

-- inserindo valores para testar a procedure
insert into respostausuarioteste(Questao_Teste_idQuestao, Cursa_Modulo_idCursa_Modulo, resposta)
values
('16', '10', 'Tigre'),
('15', '10', 'Barco');

-- ativando a procedure
call compara_resposta(16, 'Tigre', 10); 
call compara_resposta(15, 'Barco', 10);
select * from respostausuarioteste;-- verificando o resultado

-- -------------------------------------------
--  CRIANDO UMA FUNCTION PARA CALCULAR A NOTA
-- -------------------------------------------

DELIMITER $$

CREATE FUNCTION verificaNota(cModulo INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    declare quantidadeAcerto int;
    declare resultado float;
    
    select count(`status`) into quantidadeAcerto
    from respostausuarioteste
    where `status` = 1 and Cursa_Modulo_idCursa_Modulo = cModulo;
    
	set resultado = 2.5 * quantidadeAcerto;
    RETURN resultado;
END $$

DELIMITER ;

SELECT	verificaNota(5);

-- ---------------------------------------------------------------------------
--  CRIANDO TRIGGER PARA QUANDO UMA AULA FOR EXCLUIDA ARMAZENAR OS DADOS DELA
-- ---------------------------------------------------------------------------
DELIMITER $
CREATE TRIGGER Backup_Aula AFTER DELETE
ON Aula
FOR EACH ROW
BEGIN
	insert into aula_excluida(idAula_Antiga, linkVideoAula_antigo, nomeAula, modulo_antigo)
    values
    (OLD.idAula, OLD.linkVideoAula, OLD.nomeAula, OLD.Modulo_numeroModulo);
END$
DELIMITER ;

drop trigger Backup_Aula; -- EXCLUIR A TRIGGER

select * from paeeja.aula_excluida; 
SELECT * FROM paeeja.aula; -- verificar se deu certo
delete from aula where idAula = 3; -- escolher qual aula quer apagar