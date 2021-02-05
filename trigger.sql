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

/*inserir género utilizador*/
drop trigger if exists trg_verificar_gen_ins;

DELIMITER //
Create trigger trg_verificar_gen_ins before insert on utilizador for each row
Begin
    if new.use_sexo<>'M' and new.use_sexo<>'F' then 
        set new.use_sexo='M';
    END if;
END//
DELIMITER ;

/*Alterar género utilizador*/
drop trigger if exists trg_verificar_gen_alt_Pt;

DELIMITER //

Create trigger trg_verificar_gen_alt_Pt before update on utilizador for each row
Begin
    if new.use_sexo<>'M' and new.use_sexo<>'F' then 
        set new.use_sexo='F';
    END if;
END//
DELIMITER ;

/*Inserir género personal trainer*/
drop trigger if exists trg_verificar_gen_ins_Pt;

DELIMITER //
Create trigger trg_verificar_gen_ins_Pt before insert on Personal_Trainer for each row
Begin
    if new.Pt_sexo<>'M' and new.Pt_sexo<>'F' then 
        set new.Pt_sexo='M';
    END if;
END//
DELIMITER ;

/*Alterar género personal trainer*/
drop trigger if exists trg_verificar_gen_alt_Pt;

DELIMITER //

Create trigger trg_verificar_gen_alt_Pt before update on Personal_Trainer for each row
Begin
    if new.Pt_sexo<>'M' and new.Pt_sexo<>'F' then 
        set new.Pt_sexo='F';
    END if;
END//
DELIMITER ;

/*Verificars se o número está compreendido entre 1 e 5 */ 
DELIMITER //
create trigger trg_verificar_nivel before insert on Nivel for each row
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
