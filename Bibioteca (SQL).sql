-- serial é um tipo de dado que se auto incrementa
-- datetime não funciona no PostgreSQL
create table tblcursos(
	idcurso serial primary key,
	curso varchar(50) NOT NULL,
	nivel int NOT NULL,
	valor numeric(10,2) NOT NULL,
	dtcriacao timestamp NOT NULL
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
	nome varchar(50) NOT NULL,
	cpf char(11) NOT NULL,
	dtnascimento timestamp NOT NULL,
	pai varchar(50) NOT NULL,
	mae varchar(50) NOT NULL,
	dtcadastro timestamp NOT NULL
);

create table tbltelefones(
	idtelefone serial primary key,
	idaluno int NOT NULL,
	ddd char(2) NOT NULL,
	fone char(8) NOT NULL,
	tipo int NOT NULL,
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
	editora varchar(50) NOT NULL
);

insert into tbleditoras(editora) values
('Ática'), ('Globo'), ('São Paulo'), ('FESP'), ('Vision');

create table tblautores(
	idautor serial primary key,
	nomeautor varchar(50) NOT NULL,
	nacionalidade varchar(50) NOT NULL
);

insert into tblautores(nomeautor, nacionalidade) values
('Autor 1','Brasileiro'),
('Autor 2','Espanhol'),
('Autor 3','Brasileiro'),
('Autor 4','Espanhol'),
('Autor 5','Brasileiro');

create table tblacervo(
	idacervo serial primary key,
	titulo varchar(200) NOT NULL,
	editora int NOT NULL,
	anopub int NOT NULL,
	dtcadastro timestamp NOT NULL
);

-- para criar 2 PKs, usa-se a estrutura "primary key(PK1, PK2)". Ou seja, define as duas junto, e não separadamente
create table tbllivroautor(
	idacervo int,
	idautor int,
	tipo int NOT NULL,
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
	idaluno int NOT NULL,
	idcurso int NOT NULL,
	dtmatricula timestamp,
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

create table tblunidadesacervo(
	idunidadeacervo serial primary key,
	idacervo int NOT NULL,
	dtcadastro timestamp NOT NULL,
	codigo char(10) NOT NULL,
	valor numeric(10,2) NOT NULL,
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

create table tblemprestimos(
	idemprestimo serial primary key,
	idunidadeacervo int NOT NULL,
	idaluno int NOT NULL,
	dtemprestimo timestamp NOT NULL,
	dtdevolucao timestamp,
	status int NOT NULL,
	CHECK ((status=1 AND dtdevolucao IS NULL) OR (status=2 AND dtdevolucao IS NOT NULL))
	
);

insert into tblemprestimos(idunidadeacervo, idaluno, dtemprestimo, dtdevolucao, status) values
(1, 7,'2008-07-05','2008-07-06',2),
(9, 1,'2008-07-02','2008-07-06',2),
(1, 4,'2008-07-10','2008-07-11',2),
(2, 6,'2008-07-04','2008-07-08',2),
(3, 4,'2008-07-05','2008-07-06',2),
(2, 5,'2008-07-06','2008-07-06',2),
(3, 6,'2008-07-07','2008-07-11',2);

update tblemprestimos set dtemprestimo='2008-07-01', dtdevolucao='2008-07-05'
where idunidadeacervo=1 and idaluno=7 and status=2;

insert into tblemprestimos(idunidadeacervo, idaluno, dtemprestimo, status) values
(5, 7, '2008-07-08',1),
(4, 4, '2008-07-06',1),
(5, 3, '2008-07-10',1),
(6, 6, '2008-07-11',1),
(2, 3, '2008-07-06',1),
(7, 4, '2008-07-13',1),
(4, 1, '2008-07-10',1),
(8, 2, '2008-07-15',1);

alter table tblemprestimos add foreign key(idaluno) references tblalunos(idaluno);

alter table tblemprestimos drop constraint tblemprestimos_idaluno_fkey;

alter table tblemprestimos add foreign key(idunidadeacervo)
references tblunidadesacervo(idunidadeacervo);

alter table tblemprestimos add foreign key(idaluno) references tblalunos(idaluno);

create table tblenderecos(
	idendereco serial primary key,
	idaluno int NOT NULL,
	logradouro varchar(50) NOT NULL,
	numero int NOT NULL,
	bairro varchar(50) NOT NULL,
	complemento varchar(50),
	cep char(8) NOT NULL,
	cidade varchar(50) NOT NULL,
	estado char(2) NOT NULL,
	tipo int NOT NULL,
	foreign key(idaluno) references tblalunos(idaluno)
);

insert into tblenderecos
(idaluno, logradouro, numero, bairro, complemento, cep, cidade, estado, tipo)
values
(5, 'Log A', 344, 'Bairro 1', 'Comp 1', '37900000','Passos', 'MG', 1);

insert into tblenderecos
(idaluno, logradouro, numero, bairro, cep, cidade, estado, tipo)
values
(6, 'Log B', 4, 'Bairro 2', '54546545','Glória', 'MG', 1);

insert into tblenderecos
(idaluno, logradouro, numero, bairro, complemento, cep, cidade, estado, tipo)
values
(4, 'Log C', 34, 'Bairro 3', 'Comp 4', '45345678','Itú', 'SP', 1);

insert into tblenderecos
(idaluno, logradouro, numero, bairro, cep, cidade, estado, tipo)
values
(1, 'Log D', 6, 'Bairro 4', '37900000','Passos', 'MG', 1),
(7, 'Log A', 7, 'Bairro 1', '23321234','Franca', 'SP', 1);

insert into tblenderecos
(idaluno, logradouro, numero, bairro, complemento, cep, cidade, estado, tipo)
values
(2, 'Log B', 89, 'Bairro 2', 'Comp 7', '34343456','Glória', 'MG', 1);

insert into tblenderecos
(idaluno, logradouro, numero, bairro, cep, cidade, estado, tipo)
values
(3, 'Log G', 5, 'Bairro 7', '37900000','Passos', 'MG', 1),
(3, 'Log H', 43, 'Bairro 8', '23321234','Franca', 'SP', 2),
(2, 'Log M', 32, 'Bairro 9', '37900000','Passos', 'MG', 2);
