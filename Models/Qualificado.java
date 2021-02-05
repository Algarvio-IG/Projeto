package iade.Projeto.Models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

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

    @Column(name = "dataderealizacao")
    private Date dataderealizacao;
   
    @ManyToMany @JoinColumn(name="qual_Pt_id") @JsonIgnoreProperties({"qualificado"}) private List<PersonalTrainer> personaltrainer;

    @ManyToMany @JoinColumn(name="qual_Au_id") @JsonIgnoreProperties({"qualificado"}) private List<Aula> aula;    
    
    public Qualificado() {} 

    public Qualificado(String local, Time horario, Date dataderealizacao, List<Aula> aula, List<PersonalTrainer> personaltrainer){
        this.local = local;
        this.horario = horario;
        this.dataderealizacao = dataderealizacao;
        this.aula = aula;
        this.personaltrainer = personaltrainer;
    }
    
    public String getLocal() {
        return local;
    }

    public Time getHorario() {
        return horario;
    }

    public Date getDataderealizacao(){
        return dataderealizacao;
    }

    public List<Aula> getAula(){
        return aula;
    }

    public List<PersonalTrainer> getPersonalTrainer(){
        return personaltrainer;
    }
}
  