package iade.Projeto.Models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@Table(name = "Categoria")

public class Categoria {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    @Column(name="Cat_ID")
    private int id;

    @Column(name="Cat_Nome")
    private String nome;

    @Column(name = "Cat_descricao")
    private String descricao;

    @OneToMany
    @JoinColumn(name="Au_Cat_ID")
    @JsonIgnoreProperties({"categoria"})
    private List <Aula> aula;
    
    public Categoria() {} 
    
    public Categoria(int id, String nome, String descricao, List<Aula> aula){
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

    public String getDescricao(){
        return descricao;
    }
    
    public List<Aula> getAula() {
        return aula;
    }
    
   


    
}
