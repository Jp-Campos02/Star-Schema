# Star-Schema
Este projeto documenta o processo de criação de um modelo de Esquema Estrela no Power BI, com foco na análise de dados relacionados a professores, departamentos, cursos, e datas, utilizando tabelas provenientes de um banco de dados PostgreSQL.

Objetivo
Criar um modelo dimensional (Esquema Estrela) no Power BI para organizar os dados de maneira eficiente, facilitando análises futuras.

Descrição do Modelo
O Esquema Estrela foi projetado com as seguintes tabelas:

Tabela Fato
fato_professor: Centraliza os dados quantitativos (ex.: carga horária, salário, alunos atendidos).
Tabelas Dimensão
dim_professor: Informações dos professores (ex.: nome, titulação, especialidade).
dim_departamento: Detalhes dos departamentos (ex.: nome, localização).
dim_curso: Dados dos cursos ministrados (ex.: nome, categoria, créditos).
dim_data: Informações temporais (ex.: data, dia da semana, mês, ano).
Passos Realizados
1. Preparação dos Dados
As tabelas foram importadas de um banco de dados PostgreSQL.
A tabela dim_data foi criada manualmente no Power BI usando DAX.
2. Configuração do Modelo
Relacionamentos entre as tabelas foram configurados no painel Modelo do Power BI:
dim_professor.ID_Professor → fato_professor.ID_Professor

dim_departamento.ID_Departamento → fato_professor.ID_Departamento

dim_curso.ID_Curso → fato_professor.ID_Curso

dim_data.Date → fato_professor.Data_Oferta

4. Organização do Esquema Estrela
O modelo foi visualmente organizado no painel Modelo, posicionando a tabela fato no centro e as dimensões ao redor, formando um diagrama de estrela.
Tecnologias Utilizadas
Power BI: Para modelagem e visualização.
PostgreSQL: Como banco de dados fonte.
DAX: Para criação de tabelas calculadas, como dim_data.
