/**
*    Grupo: 1    |  Curso: L-IG
*      UC: Bases de Dados
*
*    Pojeto: «GreenFit»
*
*      Nome: «Gonçalo Feliciano» (20190844)
*      Nome: «Ricardo Vidigal» (20190832)
*
**/
/*Obter as todas as Categorias*/

select * from categoria;

/* Obter só o nome da categoria e a descrição*/

select Cat_Nome as 'Nome da Categoria', Cat_descricao as "descricao" 
from categoria;

/*Obter o total de utilizadores por freguesia*/

select count(use_ID) as "Total de Utilizadores", cod_Freguesia as "Freguesia"
from utilizador
left join Codigo_Postal
on utilizador.use_cod_id=Codigo_Postal.cod_id
group by cod_freguesia
order by cod_freguesia desc;

/*Obter os dados do utilizador*/

select use_nomeP as 'Primeiro nome', use_nomeA as "Apelido", use_sexo as 'Sexo', use_email as "Email", use_Birthday as "data de nascimento",
timestampdiff(Year, use_Birthday,Curdate()) as "Idade", concat(Cod_id_4D,"/",right(concat("000",Cod_id_3D),3)) as "Codigo Postal"
from utilizador
inner join Codigo_Postal
on utilizador.use_cod_id=Codigo_Postal.Cod_id;

/*Agrupar por idades*/

SELECT use_ID,use_nomeP, use_nomeA,TIMESTAMPDIFF(YEAR,use_Birthday,CURDATE()) as use_idade 
from utilizador
WHERE use_Birthday IS NOT NULL
group by  use_idade;

/* Qual é a pessoa mais nova e em que nível se encontra*/
SELECT use_nomeP as "Nome", use_nomeA as "Apelido" , MIN(use_idade) as "Idade", Niv_qual as "Nivel" , Niv_descricao as "Descricao"
FROM utilizador , Nivel
WHERE Niv_qual <= 5;

/*Obter os dados da Aula, ou seja, o id do personal trainer, o nome da aula e qual o nivel a que essa aula corresponde.*/

select Au_Pt_id as "ID do Personal Trainer", Au_nome as "Aula", Au_Niv_id as "Nivel da Aula" 
from aula;

/*Ver a aula e a que categoria pertence*/

select Au_id,Au_nome as "Aula", Categoria.Cat_id,Cat_nome as "Categoria"
from Aula
inner join Categoria
on Aula.Au_Cat_id=Categoria.Cat_id;

/* Obter o nivel da aula */

select Au_Id,Au_nome as "Aula", Nivel.Niv_ID,Niv_nome as "Nivel da Aula"
from Aula
inner join Nivel
on Aula.Au_niv_ID=Nivel.Niv_ID;

/* Observar o nome da aula e o utilizador que está inscrito*/

select Au_id,Au_nome as "Aula", utilizador.use_id,use_nomeP as " Nome do inscrito",use_nomeA as "Apelido do inscrito" 
from Aula
inner join utilizador
on Aula.Au_use_id=utilizador.use_id;

/* Utilizador mais jovem consoante o nível(1)*/

SELECT MIN(use_idade) as Idade_mínima 
FROM utilizador
WHERE use_id IN (SELECT Au_use_id FROM Aula WHERE Au_Niv_id 
IN (SELECT Niv_id FROM Nivel WHERE Niv_qual = 1));

/* Utilizador mais jovem consoante o nível(2)*/

SELECT MIN(use_idade) as Idade_mínima 
FROM utilizador
WHERE use_id IN (SELECT Au_use_id FROM Aula WHERE Au_Niv_id 
IN (SELECT Niv_id FROM Nivel WHERE Niv_qual = 2));

/* Utilizador mais jovem consoante o nível(3)*/

SELECT MIN(use_idade) as Idade_mínima 
FROM utilizador
WHERE use_id IN (SELECT Au_use_id FROM Aula WHERE Au_Niv_id 
IN (SELECT Niv_id FROM Nivel WHERE Niv_qual = 3));

/* Utilizador mais jovem consoante o nível(4)*/

SELECT MIN(use_idade) as Idade_mínima 
FROM utilizador
WHERE use_id IN (SELECT Au_use_id FROM Aula WHERE Au_Niv_id 
IN (SELECT Niv_id FROM Nivel WHERE Niv_qual = 4));

/* Utilizador mais jovem consoante o nível(5)*/

SELECT MIN(use_idade) as Idade_mínima 
FROM utilizador
WHERE use_id IN (SELECT Au_use_id FROM Aula WHERE Au_Niv_id 
IN (SELECT Niv_id FROM Nivel WHERE Niv_qual = 5));

/* Utilizador mais velho consoante o nível(1)*/

SELECT MAX(use_idade) as Idade_máxima 
FROM utilizador
WHERE use_id IN (SELECT Au_use_id FROM Aula WHERE Au_Niv_id 
IN (SELECT Niv_id FROM Nivel WHERE Niv_qual = 1));

/* Utilizador mais velho consoante o nível(2)*/

SELECT MAX(use_idade) as Idade_máxima 
FROM utilizador
WHERE use_id IN (SELECT Au_use_id FROM Aula WHERE Au_Niv_id 
IN (SELECT Niv_id FROM Nivel WHERE Niv_qual = 2));

/* Utilizador mais velho consoante o nível(3)*/

SELECT MAX(use_idade) as Idade_máxima 
FROM utilizador
WHERE use_id IN (SELECT Au_use_id FROM Aula WHERE Au_Niv_id 
IN (SELECT Niv_id FROM Nivel WHERE Niv_qual = 3));

/* Utilizador mais velho consoante o nível(4)*/

SELECT MAX(use_idade) as Idade_máxima 
FROM utilizador
WHERE use_id IN (SELECT Au_use_id FROM Aula WHERE Au_Niv_id 
IN (SELECT Niv_id FROM Nivel WHERE Niv_qual = 4));

/* Utilizador mais velho consoante o nível(5)*/

SELECT MAX(use_idade) as Idade_máxima 
FROM utilizador
WHERE use_id IN (SELECT Au_use_id FROM Aula WHERE Au_Niv_id 
IN (SELECT Niv_id FROM Nivel WHERE Niv_qual = 5));

/* qual o número de pessoas do sexo masculino e feminino abaixo ou acima de um certo nível*/

SELECT use_nomeP as "Nome", use_nomeA as "Apelido" , Niv_descricao as "Nivel em que se encontra"
FROM utilizador , Nivel
WHERE Niv_qual < 3 AND use_sexo = 'M' OR Niv_qual = 5 AND use_sexo = 'F';

/* Qual é a pessoa mais velha e em que nível se encontra*/
SELECT use_nomeP as "Nome", use_nomeA as "Apelido" , MAX(use_idade) as "Idade", Niv_qual as "Nivel" , Niv_descricao as "Descricao"
FROM utilizador , Nivel
WHERE Niv_qual <= 5;