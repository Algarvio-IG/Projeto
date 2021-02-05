package iade.Projeto.Models;

import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Utilizador")

public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "use_ID")
    private int ID;

    @Column(name = "use_nomeP")
    private String nomeP;

    @Column(name = "use_nomeA")
    private String nomeA;

    @Column(name = "use_Birthday")
    private LocalDate Birthday;

    @Column(name = "use_idade")
    private int idade;
    
    @Column(name = "Use_email")
    private String email;

    @Column(name = "Use_sexo")
    private char sexo;

    

    public User() {}
    public <string> User(int ID, String nomeP, String nomeA, LocalDate Birthday, int idade, String email, char sexo){
        this.ID = ID;
        this.nomeP = nomeP;
        this.nomeA = nomeA;
        this.Birthday = Birthday;
        this.idade = idade;
        this.email = email;
        this.sexo = sexo;
    }

    public int getId() {
        return ID;
    }

    public String getNomeP() {
        return nomeP;
    }

    public String getNomeA(){
        return nomeA;
    }

    public LocalDate getBirthday() {
        return Birthday;
    }

    public int getIdade(){
        return idade;
    }

    public String getemail() {
        return email;
    }

    public char getsexo() {
        return sexo;
    }

    
}
