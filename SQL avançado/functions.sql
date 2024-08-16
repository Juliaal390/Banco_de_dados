-- Cria uma função que retorna a quantidade de cursos que um aluno está matriculado
GO
CREATE FUNCTION dbo.fnContarCursosAluno (@idaluno INT)
RETURNS INT
AS
BEGIN
    DECLARE @totalCursos INT;

    SELECT @totalCursos = COUNT(*)
    FROM tblmatriculas
    WHERE idaluno = @idaluno;

    RETURN @totalCursos;
END;
GO
SELECT dbo.fnContarCursosAluno(4) AS TotalCursos;

-- Cria uma função que calcula o valor total dos cursos em que o aluno está matriculado
GO
CREATE FUNCTION dbo.fnSomaValorCursos (@idaluno INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @somaValor DECIMAL(10, 2);

    -- Calcula a soma dos valores dos cursos em que o aluno está matriculado
    SELECT @somaValor = SUM(c.valor)
    FROM tblmatriculas m
    INNER JOIN tblcursos c ON m.idcurso = c.idcurso
    WHERE m.idaluno = @idaluno;

    -- Retorna o valor calculado
    RETURN ISNULL(@somaValor, 0);
END;
GO
SELECT dbo.fnSomaValorCursos(1) AS TotalValorCursos;

-- Cria uma função que formata CPF
GO
CREATE FUNCTION dbo.fnFormatarCPF (@cpf CHAR(11))
RETURNS VARCHAR(14)
AS
BEGIN
    RETURN SUBSTRING(@cpf, 1, 3) + '.' +
           SUBSTRING(@cpf, 4, 3) + '.' +
           SUBSTRING(@cpf, 7, 3) + '-' +
           SUBSTRING(@cpf, 10, 2);
END;
GO
SELECT dbo.fnFormatarCPF('12345678987') AS CPFFormatado;


