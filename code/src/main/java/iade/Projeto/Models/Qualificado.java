package iade.Projeto.Models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import java.sql.Date;
import java.sql.Time;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@Table(name = "Qualificado")

public class Qualificado {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)

    @Column(name="qual_local")
    private String local;

    @Column(name="qual_horario")
    private Time horario;

    @Column(name = "qual_dataderealizacao")
    private Date dataderealizacao;

    @ManyToOne @JoinColumn(name="qual_Pt_id") @JsonIgnoreProperties({"qualificado"}) private PersonalTrainer personaltrainer;

    @ManyToOne @JoinColumn(name="qual_Au_id") @JsonIgnoreProperties({"qualificado"}) private Aula aula;

    public Qualificado() {} 

    public String getLocal() {
        return local;
    }

    public Time getHorario() {
        return horario;
    }

    public Date getDataderealizacao(){
        return dataderealizacao;
    }
    public Aula getAula(){
        return aula;
    }
    public PersonalTrainer getPersonalTrainer(){
        return personaltrainer;
    }

}