use paeeja;

									-- INSERINDO DADOS NA TABELAS

-- inserindo dados na tabela usuario
insert into usuario(nomeUsuario, sobrenomeUsuario, cpf, email, dtNascimento, nivelProgresso, bairro, logradouro, estado) 
values 
('Saulo', 'Oliveira', '001.002.003-23', 'saulo@hotmail.com', '20050307','0', 'Periperi', 'Salvador', 'Bahia'),
('Ana', 'Silva', '111.222.333-44', 'ana.silva@gmail.com', '19901215', '10', 'Centro', 'São Paulo', 'São Paulo'),
('Carlos', 'Santos', '222.333.444-55', 'carlos.santos@yahoo.com', '19850720', '7', 'Liberdade', 'Belo Horizonte', 'Minas Gerais'),
('Maria', 'Pereira', '333.444.555-66', 'maria.pereira@outlook.com', '19730530', '5', 'Boa Viagem', 'Recife', 'Pernambuco'),
('João', 'Souza', '444.555.666-77', 'joao.souza@hotmail.com', '20000101', '8', 'Copacabana', 'Rio de Janeiro', 'Rio de Janeiro'),
('Fernanda', 'Costa', '555.666.777-88', 'fernanda.costa@uol.com.br', '19950505', '6', 'Itaim Bibi', 'São Paulo', 'São Paulo'),
('Bruno', 'Oliveira', '666.777.888-99', 'bruno.oliveira@terra.com.br', '19820312', '9', 'Porto Alegre', 'Porto Alegre', 'Rio Grande do Sul'),
('Patrícia', 'Ferreira', '777.888.999-00', 'patricia.ferreira@gmail.com', '20010818', '4', 'Ipanema', 'Rio de Janeiro', 'Rio de Janeiro'),
('Roberto', 'Lima', '888.999.000-11', 'roberto.lima@live.com', '19860525', '3', 'Pampulha', 'Belo Horizonte', 'Minas Gerais'),
('Juliana', 'Gomes', '999.000.111-22', 'juliana.gomes@yahoo.com', '19791110', '7', 'Jardim Paulista', 'São Paulo', 'São Paulo'),
('Ricardo', 'Melo', '000.111.222-33', 'ricardo.melo@hotmail.com', '19971102', '5', 'Centro', 'Curitiba', 'Paraná');

-- inserindo dados na tabela telefone
insert into telefone(ddd, numero, Usuario_idUsuario) 
values
('71', '88897732', '1'),
('11', '99887766', '2'),
('31', '98765432', '3'),
('21', '91234567', '4'),
('81', '93456789', '5'),
('51', '92345678', '6'),
('21', '94567890', '7'),
('31', '95678901', '8'),
('41', '96789012', '9'),
('11', '97890123', '10')
;

-- inserindo dados na tabela curso
insert into curso(nomeCurso)
values
('Matemática'),
('Português'),
('Ciências'),
('História')
;

-- inserindo dados na tabela cursa
insert into cursa(Usuario_idUsuario, Curso_idCurso) 
values
('1', '3'),
('2', '3'),
('3', '2'),
('4', '1'),
('5', '4'),
('6', '2'),
('7', '3'),
('8', '1'),
('9', '1'),
('10', '4')
;

-- inserindo dados na tabela modulo
insert into modulo(Curso_idCurso, nomeModulo)
values
( '1', 'Modulo Fundamental I'),
( '2', 'Modulo Fundamental I'),
( '3', 'Modulo Fundamental I'),
( '4', 'Modulo Fundamental I')
;

-- inserindo dados na tabela Questão Teste
insert into questao_teste(pergunta, alternativaA, alternativaB, alternativaC, alternativaD, respostaCorreta, Modulo_numeroModulo)
values
('Quanto é 10 + 5 ?', '11', '2', '15', '20', '15','1'),
('Quanto é 50 x 3 ?', '150', '205', '125', '170', '150', '1'),
('Quanto é 100 + 7 ?', '43', '90', '88', '93', '93', '1'),
('Quanto é 100 / 2 ?', '43', '90', '88', '50', '50', '1'),

('Qual é o plural de "livro"?', 'Livros', 'Livroes', 'Livroses', 'Livrix', 'Livros', '2'),
('Qual é o plural de "jarro"?', 'Jarvros', 'Jarros', 'Jarres', 'Jarris', 'Jarros', '2'),
('Qual é a palavra correta para completar a frase: "O menino _____ na escola."', 'Corueu', 'Correio', 'Correu', 'Correis', 'Correu', '2'),
('O que indica o acento agudo na palavra "está"?', 'Indica passado', 'Indica que a sílaba é tônica', 'Indica pluralidade', 'Indica futuro', 
'Indica que a sílaba é tônica', '2'),

('Qual desses animais é um mamífero?', 'Tartaruga', 'Cobra', 'Tubarão', 'Cachorro', 'Cachorro', '3'),
('Qual dessas partes do corpo humano é usada para respirar?', 'Pernas', 'Nariz', 'Pescoço', 'Braços', 'Nariz', '3'),
('O que as plantas precisam para crescerem saudáveis?', ' Ar e água', 'Sol e ar', 'Água e sol', 'Fogo e vento', 'Água e sol', '3'),
('Qual dessas partes do corpo humano é usada para mastigar?', 'Pernas', 'Nariz', 'Boca', 'Braços', 'Boca', '3'),

('Qual foi a civilização que construiu as famosas pirâmides no Egito?', 'Romanos', 'Gregos', 'Egípcios', 'Persas', 'Egípcios', '4'),
('Quem foi o descobridor do Brasil?', 'Pedro Álvares Cabral', 'Cristóvão Colombo', 'Fernão de Magalhães', 'Vasco da Gama', 'Pedro Álvares Cabral', '4'),
('Qual era o nome da embarcação em que Cristóvão Colombo navegou quando descobriu a América?', 'Santa Maria', 'Nina', 'Victoria', 'Pinta', 'Pinta', '4'),
('Qual dos seguintes rios era crucial para a civilização mesopotâmica?', 'Nilo', 'Ganges', 'Tigre', 'Amazonas', 'Tigre', '4')
;

-- inserindo dados na tabela Cursa Modulo
insert into cursa_modulo(Cursa_idCursa, Modulo_numeroModulo)
values
('1', '3'),
('2', '3'),
('3', '2'),
('4', '1'),
('5', '4'),
('6', '2'),
('7', '3'),
('8', '1'),
('9', '1'),
('10','4')
;

-- inserindo dados na tabela Resposta Usuario Teste
insert into respostaUsuarioteste(Questao_Teste_idQuestao, Cursa_Modulo_idCursa_Modulo, resposta, `status`)
values
('9', '1', 'Cachorro', '1'),
('10', '1', 'Braços', '2'),
('11', '1', 'Água e sol', '1'),
('12', '1', 'Nariz', '1'),
('9', '2', 'Cachorro', '1'),
('10', '2', 'Nariz', '1'),
('11', '2', 'Água e sol', '1'),
('12', '2', 'Nariz', '1'),

('1', '4', '15', '1'),
('2', '4', '205', '2'),
('3', '4', '88', '2'),
('4', '4', '50', '1'),
('1', '9', '20', '2'),
('2', '9', '205', '2'),
('3', '9', '88', '2'),
('4', '9', '50', '1'),

('13', '5', 'Egípcios', '1'),
('14', '5', 'Pedro Álvares Cabral', '1'),
('15', '5', 'Pinta', '1'),
('16', '5', 'Tigre', '1'),

('13', '10', 'Egípcios', '1'),
('14', '10', 'Pedro Álvares Cabral', '1')
;

-- inserindo dados na tabela Aula
insert into aula(linkVideoAula, nomeAula, Modulo_numeroModulo)
values
('https://youtu.be/h3sFlP8Rmqc?si=-oPKpIt-1YfZqrXd', 'Adição | Subtração | Multiplicação | Divisão', '1'),
('https://youtu.be/O3HJCzfBzkg?si=KYkDKrFY19g9ztz3', 'Plural dos Substantivos', '2'),
('https://youtu.be/--UZIchwfl8?si=qZLGh28odNgUSyxT', 'Mamíferos', '3'),
('https://youtu.be/qh7CKGQvTwY?si=2i0xjtJLeLRY2cV9', 'Mesopotâmia', '4')
;

-- inserindo dados na tabela Cursa Aula
insert into cursa_aula(Cursa_Modulo_idCursa_Modulo, Aula_idAula)
values
('1', '3'),
('2', '3'),
('3', '2'),
('4', '1'),
('5', '4'),
('6', '2'),
('7', '3'),
('8', '1'),
('9', '1'),
('10', '4')
;

-- inserindo dados na tabela Questão Questionario
insert into questao_questionario(pergunta, alternativaA, alternativaB, alternativaC, alternativaD, respostaCorreta, Aula_idAula)
values
('Quanto é 18 + 2 ?', '18', '22', '17', '20', '20', '1'),
('Quanto é 60 x 3 ?', '150', '180', '125', '170', '180', '1'),

('Qual é o plural de "Casa"?', 'Casus', 'Casas', 'Casis', 'Cazas', 'Casas', '2'),
('Qual é o plural de "Carro" ?', 'Carroes', 'Carres', 'Carros', 'Cerris', 'Carros', '2'),

('Qual desses animais é um mamífero?', 'Tubarão', 'Golfinho', 'Jacaré', 'Pinguim', 'Golfinho', '3'),
('Qual desses animais é um mamífero?', 'Tartaruga', 'Papagaio', 'Elefante', 'Sapo', 'Elefante', '3'),

('Qual das seguintes civilizações é conhecida por ter se desenvolvido na região da Mesopotâmia?', 'Romana', 'Grega', 'Egípcia', 'Suméria', 'Suméria', '4'),
('Qual das invenções a seguir é atribuída aos povos da Mesopotâmia?', 'Roda', 'Papel', 'Pólvora', 'Bússola', 'Roda', '4')
;

-- inserindo dados na tabela Resposta Usuario Questionario
insert into respostausuarioquestionario(Questao_Questionario_idQuestao, Cursa_Aula_idCursa_Aula, resposta, `status`)
values
('1', '4', '20', '1'),
('2', '4', '180', '1'),
('1', '8', '20', '1'),
('2', '8', '170', '2'),
('1', '9', '22', '2'),
('2', '9', '170', '2'),

('3', '3', 'Cazas', '2'),
('4', '3', 'Carres', '2'),
('3', '6', 'Casas', '1'),
('4', '6', 'Carros', '1'),

('5', '1', 'Golfinho', '1'),
('6', '1', 'Elefante', '1'),
('5', '2', 'Golfinho', '1'),
('6', '2', 'Elefante', '1'),
('5', '7', 'Golfinho', '1'),
('6', '7', 'Elefante', '1'),

('7', '5', 'Grega', '2'),
('8', '5', 'Papel', '2'),
('7', '10', 'Suméria', '1'),
('8', '10', 'Roda', '1')
;
