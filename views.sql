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
create view utilizadores_da_app as
select concat( "U", use_id) as "ID" ,use_nomeP as "Primeiro Nome", use_nomeA as "Apelido" ,"Utilizador" as status
from utilizador
union
select concat( "PT", Pt_id) as "ID", Pt_nome as "Nome", Pt_contacto as "Contacto", "Personal Trainer" as status
from Personal_Trainer;

create view Aula_utlizadores as
select use_id, concat( use_nomeP ," ", use_nomeA ) as "Nome", Au_use_id as "Aula"
from utilizador
right join Aula
on use_id = Au_use_id
group by use_id;