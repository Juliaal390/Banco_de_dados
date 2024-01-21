--listar alunos em que o cpf inicia com: 123, mostrar apenas o nome, cpf e data de nascimento
    select nome, cpf, dtnascimento from tblalunos where cpf like '123%';


--listar alunos com data de nascimento menor que 1/10/2020 e data de cadastro maior/igual à 02/06/2008
    select * from tblalunos where dtnascimento<'2020-10-01' and dtcadastro >='2008-06-02';


--listar livros do autor "autor 1" mostrando o nome do autor, nome do livro e ano de publicação
    select tblautores.nomeautor, tblacervo.titulo, tblacervo.anopub
    from tblacervo
    inner join tbllivroautor on tblacervo.idacervo=tbllivroautor.idacervo
    inner join tblautores ON tblLivroAutor.idAutor = tblAutores.idAutor
    where nomeautor='Autor 1';


--liste o nome dos alunos e separe suas datas de nascimento em ano, mês e dia
    SELECT
    nome,
    EXTRACT(YEAR FROM dtnascimento) AS ano,
     EXTRACT(MONTH FROM dtnascimento) AS mes,
    EXTRACT(DAY FROM dtnascimento) AS dia
    FROM
     tblalunos;


--converta o campo codigo de tblunidadesacervo de CHAR para INT, com autoincremento
    create sequence incrementocod start 1001 increment by 1;

    ALTER TABLE tblunidadesacervo alter column codigo type int using codigo::int;
    ALTER TABLE tblunidadesacervo alter column codigo set default nextval('incrementocod');
