package iade.Projeto.Models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.List;

@Entity
@Table(name = "Personal_Trainer")

public class PersonalTrainer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Pt_id")
    private int ID;

    @Column(name = "pt_nome")
    private String nome;

    @Column(name = "pt_email")
    private String email;

    @Column(name = "pt_sexo")
    private char sexo;

    @ManyToMany
    @JoinColumn(name = "Au_pt_ID")
    @JsonIgnoreProperties({ "PersonalTrainer" })
    private List<Aula> aula;

    public PersonalTrainer() {}

    public int getID() {
        return ID;
    }

    public String getNome(){
        return nome;
    }

    public String getEmail() {
        return email;
    }

    public char getSexo() {
        return sexo;
    }

    
}
