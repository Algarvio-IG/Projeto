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
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@Table(name = "marcacao")

public class Marcacao {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    
    @Column(name = "mar_id")
    private int id;

    @Column(name="mar_data")
    private Date data;

    @ManyToOne @JoinColumn(name="mar_use_ID") @JsonIgnoreProperties({"marcacao"}) private User user;
    @ManyToOne @JoinColumn(name="mar_Au_id") @JsonIgnoreProperties({"marcacao"})private Aula aula;
    
    public Marcacao() {}
    
    public int getID(){
        return id;
    }
    
    public void setId(int id){
        this.id = id;
    }

    public Date data() {
        return data;
    }

    public void setData(Date data){
        this.data=data;
    }

    public Aula getAula(){
        return aula;
    }

    public void setAula(Aula aula){
        this.aula=aula;
    }

    public User getUser(){
        return user;
    }
    public void setUser(User user){
        this.user=user;
    }

}

