package iade.Projeto.Models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.OneToMany;
import javax.persistence.JoinColumn;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.List;



@Entity
@Table (name="Nivel")

public class Nivel {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    
    @Column(name="Niv_ID")
    private int id;
    
    @Column(name="Niv_Nome")
    private String nome;
    
    @Column(name = "Niv_descricao")
    private String descricao;

    @OneToMany
    @JoinColumn(name="Niv_ID")
    @JsonIgnoreProperties({"Nivel"})
    private List <Aula> aula;
    
    public Nivel(){}

    public Nivel(int id, String nome, String descricao, List <Aula> aula){
        this.id=id;
        this.nome=nome;
        this.descricao=descricao;
        this.aula=aula;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getDescricao() {
        return descricao;
    }




}
