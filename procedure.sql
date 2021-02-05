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
/Consultar a aula onde está inscrito/

DELIMITER //
DROP PROCEDURE IF EXISTS consultar_Aula//

CREATE PROCEDURE consultar_Aula(IN p_UID INT)
BEGIN
    SELECT use_id AS 'ID Utilizador', use_nomeP AS Nome, use_nomeA As Apelido , Au_nome AS 'Nome da Aula', Cat_nome AS 'Categoria', Niv_nome As 'Nível'
    FROM utilizador INNER JOIN Aula          ON Au_use_id= use_id
                    INNER JOIN Nivel         ON Niv_id = Au_Niv_id
                    INNER JOIN Categoria     ON Au_Cat_id = Cat_ID
                    INNER JOIN Personal_Trainer  ON Au_Pt_id = Pt_id
    GROUP BY use_id, use_nomeP, use_nomeA, Au_nome, Cat_nome, Niv_nome
    HAVING use_id = p_UID;
END//
DELIMITER ;
call consultar_Aula(1);
call consultar_Aula(2)

/Para inscrever um novo utilizador/

DELIMITER //
DROP PROCEDURE IF EXISTS p_Inscricao//

CREATE PROCEDURE p_Inscricao(out p_id int,
                                in p_nomeP varchar(50),
                                in p_nomeA varchar(50),
                                in p_Birthday  date,
                                in p_idade int,
                                in p_Email varchar(50),
                                in p_Sexo char(1),
                                in p_Cod varchar(50))
Begin
    Declare idUse int default 0;
    select Cod_id into idUse from codigo_postal where Cod_Cidade= p_Cod;
    insert into utilizadores(use_nomeP, use_nomeA, use__Birthday, use_idade, use_Email, use_Sexo, use_Cod_id)
                            values (p_nomeP, p_nomeA, p_Birthday, p_idade, p_Email, p_Sexo, idUse);
    select last_insert_id() into p_id;
    select p_id as newID;

End//
DELIMITER ; 

/*call p_Inscricao("Andre", "Josefino", "1984-08-31", "23", "andrezinho@gmail.com", "M", "Lisboa" ) existe algo de errado pois a call não esta correta, só p procedure*/


/ Adicionar novo Personal Trainer/

DELIMITER //
DROP PROCEDURE IF EXISTS novo_Personal_Trainer//
create procedure novo_Personal_Trainer (p_nomePt varchar (60), 
                                        p_sexo char(1),
                                        p_email Varchar(100),
                                        p_contacto int,
                                        p_Cod_ID int)
begin

insert into Personal_Trainer (Pt_nome, Pt_sexo, Pt_email,Pt_contacto,Pt_Cod_id)
    values (p_nomePt , p_sexo , p_email,p_contacto , p_Cod_ID );

end //
DELIMITER ;

call novo_Personal_Trainer("Miguel Bugalho", "M","adorogatos@gmail.com",913652894, 15);
