package iade.Projeto.Models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "Aula")

public class Aula {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    @Column(name="Au_Id")
    private int id;

    @Column(name="Au_nome")
    private String nome;

    @ManyToOne @JoinColumn(name="Au_Niv_id")@JsonIgnoreProperties({"aula"})private Nivel nivel;
    @ManyToOne @JoinColumn(name = "Au_Cat_ID")@JsonIgnoreProperties({"aula"})private Categoria categoria ;
    @OneToMany @JoinColumn(name="mar_Au_id")@JsonIgnoreProperties({"aula"})private List<Marcacao> marcacao;
    @OneToMany @JoinColumn(name="qual_Au_id")@JsonIgnoreProperties({"aula"})private List<Qualificado> qualificado;

    public Aula() {} 
    
    public int getId() {
        return id;
    }

    public void setId(int id){
        this.id = id;
    }


    public String getNome() {
        return nome;
    }

    public Nivel getNivel() {
        return nivel;
    }

    public Categoria getCategoria() {
        
        return categoria;
    }

    public List<Marcacao> getMarcacao(){
        return marcacao;
    }
    public List<Qualificado> getQualificado(){
        return qualificado;
    }
    

}
