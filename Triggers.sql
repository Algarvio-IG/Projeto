

/*Consultar a aula onde está inscrito*/

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

/*Verificar a idade*/

DELIMITER //
CREATE TRIGGER verificar_idade BEFORE INSERT ON utilizador FOR EACH ROW
BEGIN
    IF TIMESTAMPDIFF(YEAR,New.use_birthday,CURDATE()) < 16 THEN 
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'ERRO: A idade tem de ser no mínimo 16!';
    END IF;
END//
DELIMITER ;

insert into utilizador (use_nomeP, use_nomeA, use_birthday, use_idade, use_email, use_sexo, use_Cod_id) values ("Gonçalo", "Feliciano", cast("2010.07.07" as date),TIMESTAMPDIFF(YEAR,use_birthday,CURDATE()), "gf@gmail.com", "M", 1);
insert into utilizador (use_nomeP, use_nomeA, use_birthday, use_idade, use_email, use_sexo, use_Cod_id) values ("Ricardo", "Vidigal", cast("2008.09.17" as date),TIMESTAMPDIFF(YEAR,use_birthday,CURDATE()), "RV@gmail.com", "M", 2);
insert into utilizador (use_nomeP, use_nomeA, use_birthday, use_idade, use_email, use_sexo, use_Cod_id) values ("Ana"," Alves", cast( "2002.04.03" as date),TIMESTAMPDIFF(YEAR,use_birthday,CURDATE()), "av@gmail.com", "F", 3);


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


/*inscrever um novo user*/

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

/*Verificar género user*/
drop trigger if exists trg_verificar_gen_ins;

DELIMITER //
Create trigger trg_verificar_gen_ins before insert on utilizador for each row
Begin
    if new.use_sexo<>'M' and new.use_sexo<>'F' then 
        set new.use_sexo='M';
    END if;
END//
DELIMITER ;

/*Alterar género user*/
drop trigger if exists trg_verificar_gen_alt;

DELIMITER //

Create trigger trg_verificar_gen_alt before update on utilizador for each row
Begin
    if new.use_sexo<>'M' and new.use_sexo<>'F' then 
        set new.use_sexo='M';
    END if;
END//
DELIMITER ;


/*Verificar genero personal trainer*/

drop trigger if exists trg_verificar_gen_Pt;

DELIMITER //
Create trigger trg_verificar_gen_Pt before insert on Personal_Trainer for each row
Begin
    if new.Pt_sexo<>'M' and new.Pt_sexo<>'F' then 
        set new.Pt_sexo='M';
    END if;
END//
DELIMITER ;

/*Alterar genero*/

drop trigger if exists trg_verificar_gen_Pt

DELIMITER //

Create trigger trg_verificar_gen_Pt before update on Personal_Trainer for each row
Begin
    if new.Pt_sexo<>'M' and new.Pt_sexo<>'F' then 
        set new.Pt_sexo='M';
    END if;
END//
DELIMITER ;

DELIMITER //
create trigger trg_verificar_nivel before insert on Niveis for each row
Begin 
	if not isnull(new.Niv_qual) then
		if new.Niv_qual<1 then
			set new.Niv_qual = 1;
		else
			if new.Niv_qual>5 then
				set new.Niv_qual = 5;
			end if;
		end if;
    end if;
    end//
DELIMITER ;
    







	
