-- serial é um tipo de dado que se auto incrementa
-- datetime não funciona no PostgreSQL
create table tblcursos(
	idcurso serial primary key,
	curso varchar(50),
	nivel int,
	valor numeric(10,2),
	dtcriacao timestamp
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
	idaluno serial primary key,
	nome varchar(50),
	cpf char(11),
	dtnascimento timestamp,
	pai varchar(50),
	mae varchar(50)
	dtcadastro timestamp
);

create table tbltelefones(
	idtelefone serial primary key,
	idaluno int,
	ddd char(2),
	fone char(8),
	tipo int,
	foreign key(idaluno) references tblalunos(idaluno)
);

insert into tblalunos(nome, cpf, dtnascimento, pai, mae, dtcadastro) values
('João K', '12345678987', '1980-05-01', 'Fulano A', 'Fulana A', '2008-06-01'),
('Maria F', '34565456789', '1980-04-02', 'Fulano B', 'Fulana B', '2008-06-06'),
('Carlos P', '34545676789', '1980-06-04', 'Fulano C', 'Fulana C', '2008-06-03'),
('Rogério M', '45434323232', '1980-05-16', 'Fulano D', 'Fulana D', '2008-06-06'),
('Mário S', '34545656787', '1980-01-13', 'Fulano E', 'Fulana E', '2008-06-05'),
('Antonio G', '45656765432', '1980-04-12', 'Fulano F', 'Fulana F', '2008-06-06'),
('Gilberto A', '12134354543', '1980-06-14', 'Fulano G', 'Fulana G', '2008-06-01');

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

create table tbleditoras(
	ideditora serial primary key,
	editora varchar(50)
);

insert into tbleditoras(editora) values
('Ática'), ('Globo'), ('São Paulo'), ('FESP'), ('Vision');

create table tblautores(
	idautor serial primary key,
	nomeautor varchar(50),
	nacionalidade varchar(50)
);

insert into tblautores(nomeautor, nacionalidade) values
('Autor 1','Brasileiro'),
('Autor 2','Espanhol'),
('Autor 3','Brasileiro'),
('Autor 4','Espanhol'),
('Autor 5','Brasileiro');

create table tblacervo(
	idacervo serial primary key,
	titulo varchar(200),
	editora int,
	anopub int,
	dtcadastro timestamp
);

-- para criar 2 PKs, usa-se a estrutura "primary key(PK1, PK2)". Ou seja, define as duas junto, e não separadamente
create table tbllivroautor(
	idacervo int,
	idautor int,
	tipo int,
	primary key(idacervo, idautor),
	foreign key(idacervo) references tblacervo(idacervo),
	foreign key(idautor) references tblautores(idautor)
);

insert into tblacervo(titulo, editora, anopub, dtcadastro) values
('Delphi', 1, 1990, '2008-01-09'),
('Cálculo 1', 3, 1988, '2008-01-15'),
('Matemática', 2, 1980, '2008-01-09'),
('Física', 2, 1990, '2008-01-15'),
('Português', 3, 1994, '2008-01-09'),
('Java', 4, 1980, '2008-01-15'),
('Visual', 1, 1990, '2008-01-10');

insert into tbllivroautor(idacervo, idautor, tipo) values
(1,1,1),
(2,2,1),
(3,1,1),
(4,3,1),
(5,4,1),
(6,4,1),
(7,2,1),
(2,3,2);

create table tblmatriculas(
	idmatricula serial primary key,
	idaluno int,
	idcurso int,
	dtmatricula timestamp,
	situacao int,
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

create table tblunidadesacervo(
	idunidadeacervo serial primary key,
	idacervo int,
	dtcadastro timestamp,
	codigo char(10),
	valor numeric(10,2),
	foreign key (idacervo) references tblacervo(idacervo)
);

insert into tblunidadesacervo(idacervo, dtcadastro, codigo, valor) values
(1, '2008-04-10', '1001', 10.00),
(3, '2008-04-15', '1002', 15.00),
(2, '2008-04-10', '1003', 145.00),
(6, '2008-04-16', '1004', 45.00),
(4, '2008-04-15', '1005', 78.00),
(3, '2008-04-10', '1006', 102.00),
(3, '2008-04-16', '1007', 14.00),
(4, '2008-04-16', '1008', 136.00),
(5, '2008-04-10', '1009', 54.00);
