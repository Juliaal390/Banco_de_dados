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