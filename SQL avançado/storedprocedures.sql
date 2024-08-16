-- STORED PROCEDURES são conjuntos de instruções SQL pré-compiladas e armazenadas
-- podem realizar várias operações, como consultas, inserções, atualizações e exclusões, 

-- Cria uma stored procedure que procura nomes na tabela tblalunos baseado no valor da variável @nome
CREATE PROCEDURE buscarnome @nome varchar(50)
AS
SELECT * FROM tblalunos where nome = @nome

EXEC buscarnome @nome='Antonio G'




-- Cria uma stored procedure que adiciona um novo aluno à tabela tblalunos
GO
CREATE PROCEDURE sp_AdicionarAluno
    @nome VARCHAR(50),
    @cpf CHAR(11),
    @dtnascimento DATE,
    @pai VARCHAR(50),
    @mae VARCHAR(50),
    @dtcadastro DATE
AS
    INSERT INTO tblalunos (nome, cpf, dtnascimento, pai, mae, dtcadastro)
    VALUES (@nome, @cpf, @dtnascimento, @pai, @mae, @dtcadastro);

EXEC sp_AdicionarAluno 
    @nome = 'Carlos P',
    @cpf = '34545676789',
    @dtnascimento = '1980-06-04',
    @pai = 'Fulano',
    @mae = 'Fulana C',
    @dtcadastro = '2008-06-03';

select * from tblalunos




-- Cria uma stored procedure que edita um curso
GO
CREATE PROCEDURE sp_AtualizarCurso
    @idcurso INT,
    @novo_valor NUMERIC(10, 2),
    @nova_dtcriacao DATE
AS
    -- Atualiza o valor e a data de criação do curso
    UPDATE tblcursos
    SET valor = @novo_valor,
        dtcriacao = @nova_dtcriacao
    WHERE idcurso = @idcurso;

EXEC sp_AtualizarCurso 
    @idcurso = 3,
    @novo_valor = 250.00,
    @nova_dtcriacao = '2024-01-01';

select * from tblcursos