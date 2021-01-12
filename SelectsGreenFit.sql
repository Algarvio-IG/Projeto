/*Obter as todas as Categorias*/
select*from categoria;
/* Obter só o nome da categoria e a descrição*/
select Cat_Nome as 'Nome da Categoria', Cat_descricao as "descricao" from categoria;
/*Obter o total de utilizadores num deteminado local*/
select count(use_ID) as "Total de Utilizadores", use_Cod_id_3D as "Codigo Postal" from utilizador
group by use_Cod_id_3D
order by use_Cod_id_3D desc;
/*Obter os dados do utilizador*/
select use_nomeP as 'Primeiro nome', use_nomeA as "Apelido", use_sexo as 'Sexo', use_email as "Email" from utilizador;
