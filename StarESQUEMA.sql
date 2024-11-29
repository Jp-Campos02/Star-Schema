-- Criando a tabela fato
CREATE TABLE fato_professor (
    ID_Professor INT NOT NULL,
    ID_Departamento INT NOT NULL,
    ID_Curso INT NOT NULL,
    Data_Oferta DATE NOT NULL,
    Carga_Horaria INT NOT NULL,
    Salario NUMERIC(10, 2) NOT NULL,
    Alunos_Atendidos INT NOT NULL,
    PRIMARY KEY (ID_Professor, ID_Curso, Data_Oferta)
);

-- Criando a dimensão professor
CREATE TABLE dim_professor (
    ID_Professor SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Titulacao VARCHAR(50),
    Especialidade VARCHAR(100),
    Contratacao DATE
);

-- Criando a dimensão departamento
CREATE TABLE dim_departamento (
    ID_Departamento SERIAL PRIMARY KEY,
    Nome_Departamento VARCHAR(100) NOT NULL,
    Localizacao VARCHAR(100)
);

-- Criando a dimensão curso
CREATE TABLE dim_curso (
    ID_Curso SERIAL PRIMARY KEY,
    Nome_Curso VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50),
    Nivel VARCHAR(50),
    Creditos INT
);

-- Criando a dimensão data
CREATE TABLE dim_data (
    ID_Data SERIAL PRIMARY KEY,
    Data_Oferta DATE NOT NULL,
    Dia INT NOT NULL,
    Mes INT NOT NULL,
    Ano INT NOT NULL,
    Dia_Semana VARCHAR(20)
);

-- Adicionando chaves estrangeiras na tabela fato
ALTER TABLE fato_professor
ADD CONSTRAINT fk_professor FOREIGN KEY (ID_Professor) REFERENCES dim_professor(ID_Professor),
ADD CONSTRAINT fk_departamento FOREIGN KEY (ID_Departamento) REFERENCES dim_departamento(ID_Departamento),
ADD CONSTRAINT fk_curso FOREIGN KEY (ID_Curso) REFERENCES dim_curso(ID_Curso);
-- Inserindo dados na tabela dim_professor
INSERT INTO dim_professor (Nome, Titulacao, Especialidade, Contratacao)
VALUES
('João da Silva', 'Doutor', 'Inteligência Artificial', '2015-03-10'),
('Maria Oliveira', 'Mestre', 'Sistemas de Controle', '2018-07-21'),
('Carlos Pereira', 'Doutor', 'Robótica', '2013-06-15'),
('Ana Souza', 'Especialista', 'Eletrônica Digital', '2017-09-01'),
('Fernanda Lima', 'Mestre', 'Sistemas Embarcados', '2020-01-12'),
('Ricardo Mendes', 'Doutor', 'Visão Computacional', '2010-04-22'),
('Cláudia Santos', 'Especialista', 'Redes de Computadores', '2019-11-30');

-- Inserindo dados na tabela dim_departamento
INSERT INTO dim_departamento (Nome_Departamento, Localizacao)
VALUES
('Engenharia Elétrica', 'Bloco A'),
('Ciência da Computação', 'Bloco B'),
('Mecatrônica', 'Bloco C'),
('Engenharia de Produção', 'Bloco D'),
('Engenharia Civil', 'Bloco E'),
('Engenharia Mecânica', 'Bloco F'),
('Engenharia Química', 'Bloco G');

-- Inserindo dados na tabela dim_curso
INSERT INTO dim_curso (Nome_Curso, Categoria, Nivel, Creditos)
VALUES
('Introdução à Programação', 'Básico', 'Graduação', 4),
('Redes de Computadores', 'Avançado', 'Graduação', 6),
('Automação Industrial', 'Intermediário', 'Graduação', 5),
('Projeto de Circuitos', 'Avançado', 'Graduação', 6),
('Sistemas Embarcados', 'Intermediário', 'Pós-Graduação', 8),
('Visão Computacional', 'Avançado', 'Pós-Graduação', 10),
('Controle de Sistemas', 'Intermediário', 'Graduação', 5);

-- Inserindo dados na tabela dim_data
INSERT INTO dim_data (Data_Oferta, Dia, Mes, Ano, Dia_Semana)
VALUES
('2024-01-15', 15, 1, 2024, 'Segunda-feira'),
('2024-02-20', 20, 2, 2024, 'Terça-feira'),
('2024-03-10', 10, 3, 2024, 'Domingo'),
('2024-04-05', 5, 4, 2024, 'Sexta-feira'),
('2024-05-25', 25, 5, 2024, 'Sábado'),
('2024-06-18', 18, 6, 2024, 'Terça-feira'),
('2024-07-12', 12, 7, 2024, 'Quarta-feira');

-- Inserindo dados na tabela fato_professor
INSERT INTO fato_professor (ID_Professor, ID_Departamento, ID_Curso, Data_Oferta, Carga_Horaria, Salario, Alunos_Atendidos)
VALUES
(1, 1, 1, '2024-01-15', 40, 7500.00, 30),
(2, 2, 2, '2024-02-20', 60, 8200.00, 50),
(3, 3, 3, '2024-03-10', 45, 9000.00, 35),
(4, 4, 4, '2024-04-05', 50, 7000.00, 40),
(5, 5, 5, '2024-05-25', 55, 8500.00, 25),
(6, 6, 6, '2024-06-18', 70, 9200.00, 60),
(7, 7, 7, '2024-07-12', 35, 6800.00, 20);


