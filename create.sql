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
drop database if exists Greenfit;
Create database GreenFit;
use GreenFit;
/************************************************************
*  Lista de Entidades Informaconais Primárias
************************************************************/
create table codigo_postal(
Cod_id int auto_increment,
Cod_local VarChar(100),
Cod_id_4D Char(4) not null, check ((Cod_id_4D >= 1000 ) and (cod_id_4D <= 1998)),
Cod_id_3D char(3), 
Cod_Cidade VarChar(50),check ('Lisboa' = Cod_cidade),
Cod_Concelho VarChar(50),
Cod_Freguesia VarChar(50),
Cod_Distrito VarChar(50),
 primary key(Cod_id));
 
 create table Nivel(Niv_ID int auto_increment,
 Niv_Nome VarChar(50)not null,
 Niv_descricao VarChar(100),
 Niv_qual int not null,
 primary key(Niv_id),
 check (Niv_qual>0 and Niv_qual<=5),
 check ((Niv_qual = 1 and Niv_Nome= 'Muito básico') or (Niv_qual = 2 and Niv_Nome = 'Básico') or (Niv_qual = 3 and Niv_Nome = 'Médio') or (Niv_qual = 4 and Niv_Nome = 'Avançado') or (Niv_qual = 5 and Niv_Nome = 'Muito avançado')));
 
 create table Categoria(Cat_ID Int auto_increment,
 Cat_Nome VarChar(50),
 Cat_descricao VarChar(100),
 primary key(Cat_ID));

 


/************************************************************
*  Lista de Entidades Informaconais com FK
************************************************************/
create table utilizador(
 use_ID int auto_increment,
 use_nomeP VarChar(50) not null ,
 use_nomeA varchar(50) not null,
 use_Birthday date,
 use_idade int,
 use_Email VarChar(50), 
 use_Sexo Char(1)not null, check (use_Sexo = 'M' OR use_Sexo = 'F'),
 use_cod_id int not null,
 check (16 <= 2020 - year(use_Birthday) <= 100),
 primary key(Use_ID),
 Foreign Key(use_Cod_id) references codigo_postal(Cod_id));

create table Personal_Trainer(Pt_id int auto_increment, 
 Pt_nome VarChar(50)not null,
 Pt_sexo Char(1)not null, check (Pt_sexo = 'M' OR Pt_sexo = 'F'),
 Pt_email VarChar(100),
 Pt_contacto int not null, 
 Pt_Cod_id int not null,
 primary key(Pt_id),
 foreign key(Pt_Cod_id) references codigo_postal(Cod_id));
 
 create table Aula(Au_Id Int auto_increment,
 Au_nome VarChar(50) not null,
 Au_use_id int not null,
 Au_Pt_id int not null,
 Au_Cat_ID int not null ,
 Au_Niv_id int not null ,
 primary key(Au_ID),
 foreign key(Au_use_id) references utilizador(use_ID),
 foreign key(Au_Pt_id) references Personal_Trainer(Pt_id),
 foreign key(Au_Cat_ID) references Categoria(Cat_ID),
 foreign key(Au_Niv_id) references Nivel(Niv_id));
 


/************************************************************
*  Lista de Entidades de Associação 
************************************************************/
create table qualificado( qual_id int auto_increment ,
qual_local varchar(50),
 qual_horario time,
 qual_dataderealizacao date, check (qual_dataderealizacao >= '2021-01-01'),
 qual_Pt_id int not null,
 qual_Au_id int not null,
 primary key (qual_id),
 foreign key (qual_Pt_id) references Personal_Trainer(Pt_id),
 foreign key (qual_Au_id) references Aula(Au_Id));

 
 create table marcacao(mar_id int auto_increment,
 mar_data date,
 mar_use_ID int not null,
 mar_Au_id int not null,
 primary key(mar_id),
 foreign key(mar_use_ID) references utilizador(use_ID),
 foreign key(mar_Au_id) references Aula(Au_Id));

 