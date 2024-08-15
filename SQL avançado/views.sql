-- INICIO CRIACAO TABELAS
create table tblcursos(
	idcurso int primary key identity(1,1),
	curso varchar(50) NOT NULL,
	nivel int NOT NULL,
	valor numeric(10,2) NOT NULL,
	dtcriacao date NOT NULL
);

insert into tblcursos(curso, nivel, valor, dtcriacao) values
('FIP', 1, 202.00, '2007-06-12'),
('FASESP', 1, 205.00, '2001-05-10'),
('FEP', 1, 230.00, '2004-10-15'),
('FAFIPA', 1, 210.00, '2007-06-12'),
('FAP', 1, 200.00, '2001-04-13'),
('FADIPA', 1, 208.00, '2004-07-14'),
('FAMOPA', 1, 204.00, '2007-06-12');

create table tblalunos(
	idaluno int primary key identity(1,1),
	nome varchar(50) NOT NULL,
	cpf char(11) NOT NULL,
	dtnascimento date NOT NULL,
	pai varchar(50) NOT NULL,
	mae varchar(50) NOT NULL,
	dtcadastro date NOT NULL
);

insert into tblalunos(nome, cpf, dtnascimento, pai, mae, dtcadastro) values
('João K', '12345678987', '1980-05-01', 'Fulano A', 'Fulana A', '2008-06-01'),
('Maria F', '34565456789', '1980-04-02', 'Fulano B', 'Fulana B', '2008-06-06'),
('Carlos P', '34545676789', '1980-06-04', 'Fulano C', 'Fulana C', '2008-06-03'),
('Rogério M', '45434323232', '1980-05-16', 'Fulano D', 'Fulana D', '2008-06-06'),
('Mário S', '34545656787', '1980-01-13', 'Fulano E', 'Fulana E', '2008-06-05'),
('Antonio G', '45656765432', '1980-04-12', 'Fulano F', 'Fulana F', '2008-06-06'),
('Gilberto A', '12134354543', '1980-06-14', 'Fulano G', 'Fulana G', '2008-06-01');

create table tbltelefones(
	idtelefone int primary key identity(1,1),
	idaluno int NOT NULL,
	ddd char(2) NOT NULL,
	fone char(8) NOT NULL,
	tipo int NOT NULL,
	foreign key(idaluno) references tblalunos(idaluno)
);

insert into tbltelefones(idaluno, ddd, fone, tipo) values
(5, '35', '12345545', 1),
(4, '35', '54548787', 1),
(1, '35', '12312456', 1),
(2, '34', '45678945', 1),
(5, '37', '12345678', 2),
(3, '35', '78945612', 1),
(1, '35', '12345678', 2),
(2, '34', '12345678', 2),
(6, '35', '15848457', 1),
(7, '35', '78945612', 1);

create table tblmatriculas(
	idmatricula int primary key identity(1,1),
	idaluno int NOT NULL,
	idcurso int NOT NULL,
	dtmatricula date,
	situacao int NOT NULL,
	foreign key(idaluno) references tblalunos(idaluno),
	foreign key(idcurso) references tblcursos(idcurso)
);

insert into tblmatriculas(idaluno, idcurso, dtmatricula, situacao) values
(1,1,'2008-04-10',1),
(3,3,'2008-04-13',2),
(2,2,'2008-04-10',1),
(5,4,'2008-01-12',2),
(3,1,'2008-04-10',1),
(7,3,'2008-04-13',1),
(4,6,'2008-04-13',1),
(6,4,'2008-04-10',2),
(5,2,'2008-04-16',1),
(6,5,'2008-04-13',1);
-- FIM CRIACAO TABELAS

-- Cria a view de nome cpfalunos, que mostra apenas as colunas nome e cpf da tabela tblalunos
GO
CREATE VIEW cpfalunos AS
SELECT nome, cpf 
FROM tblalunos;
GO
SELECT * FROM cpfalunos 

-- Cria a view de nome alunostelefones, que mostra apenas as colunas nome (de lblalunos), ddd e fone (de tbltelefones)
GO
CREATE VIEW alunostelefones AS
SELECT 
    a.nome,
    t.ddd,
    t.fone
FROM 
    tblalunos a
INNER JOIN 
    tbltelefones t ON a.idaluno = t.idaluno;
GO
SELECT * FROM alunostelefones
GO

-- Cria a view alunoscursos, que exibe o aluno, seu curso e a data de matrícula
CREATE VIEW alunoscursos AS
SELECT 
    a.nome,
    c.curso,
    m.dtmatricula
FROM 
    tblalunos a
INNER JOIN 
    tblmatriculas m ON a.idaluno = m.idaluno
INNER JOIN 
    tblcursos c ON m.idcurso = c.idcurso;
GO
SELECT * FROM alunoscursos

