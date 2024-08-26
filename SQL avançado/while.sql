DECLARE @counter INT = 1;
DECLARE @descricao NVARCHAR(50);
WHILE @counter <= 300
BEGIN
    SET @descricao = 'descrição' + CAST(@counter AS NVARCHAR(10));
    INSERT INTO tbPermissoesPrazo (tipo, descricao, RG, senha, idEntidade)
    VALUES ('Nome', @descricao, 0, 0, '6AE42657-94D5-4B65-98D5-AFFC00B179A1');
    SET @counter = @counter + 1;
END;

/*_________________________*/

DECLARE @I INT = 0;
  -- criando a tabela que será populada
  CREATE TABLE Numeros (numero Int);
  WHILE @I < 50
  BEGIN
      SET @I += 1;
      INSERT INTO Numeros VALUES (@I);
  END
  SELECT * FROM Numeros;