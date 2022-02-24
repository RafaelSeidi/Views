/* criando a  base de dados aula_view */
create database aula_view; 
/* entrando na base de dados aula_view*/
use aula_view;

/* criando a tabela livros*/
create table livros  (
isbn bigint primary key auto_increment,
titulo varchar(100) not null,
data_cadastro date not null,
valor_unitario decimal(7,2) 
)engine = innodb;

/* criando a tabela autores*/

create table autores  (
cod_autor bigint primary key auto_increment,
nome_autor varchar(50) not null,
isbn bigint not null
)engine = innodb;

drop table autores;
/* relacionando a tabela livros com a tabela autores*/

alter table autores
add constraint fk_livros_autores
foreign key (isbn)
references livros (isbn);


/* consultando o conteudo das tabelas*/
select * from livros;
select * from autores;

/* inserindo dados nas tabelas*/

insert into livros (isbn,titulo,data_cadastro,valor_unitario) values
                  (9788415620785 , 'Gente Hoy 1. Libro del alumno','2020-08-15',100.00);
                  
insert into livros (isbn,titulo,data_cadastro,valor_unitario) values
                  (9788516100315  , 'Moderna Matemática Plus 1','2020-06-20',120.50);
                  
insert into livros (isbn,titulo,data_cadastro,valor_unitario) values
                  (9788508190010  , 'Geografia Geral e do Brasil','2019-12-10',89.50);
                  
insert into autores (cod_autor,nome_autor,isbn) values
                  (1 , ' Ernesto Martín',9788415620785);
                  
insert into autores (nome_autor,isbn) values
                  (' Manoel Paiva ',9788516100315);
insert into autores (nome_autor,isbn) values
                  (' João Carlos Moreira  ',9788508190010);
insert into autores (nome_autor,isbn) values
                  (' Eustáquio de Sene ',9788508190010);
                  
                  
select * from livros;

select * from autores;

show tables;

SELECT livros.titulo AS livro, autores.nome_autor AS autores
FROM livros
INNER JOIN autores
ON  livros.isbn = autores.isbn; 


/* criando a view*/

CREATE VIEW vw_LivrosAutores
AS SELECT livros.titulo AS Livro, autores.nome_autor AS autores
FROM livros
INNER JOIN autores
ON  livros.isbn = autores.isbn;

/* usando  a view*/
SELECT Livro,autores
FROM vw_LivrosAutores
ORDER BY autores;


/*Alterando uma view*/
ALTER  VIEW vw_LivrosAutores AS
SELECT livros.titulo AS Livro, autores.nome_autor AS Autor, livros.valor_unitario AS Preco
FROM livros
INNER JOIN autores
ON  livros.isbn = autores.isbn;

/* usando  a view*/
SELECT Livro,Autor,Preco
FROM vw_LivrosAutores
ORDER BY Preco desc;

/*deletando uma view*/

DROP VIEW vw_LivrosAutores;
