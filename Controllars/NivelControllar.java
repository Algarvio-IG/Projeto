package iade.Projeto.Controllars;


import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import iade.Projeto.Models.Nivel;
import iade.Projeto.Models.Exceptions.NotFoundException;
import iade.Projeto.Models.Repository.NivelRepository;

@RestController
@RequestMapping(path = "/api/Nivel")
public class NivelControllar {
    private Logger logger=LoggerFactory.getLogger(NivelControllar.class);
    @Autowired
    private NivelRepository nivelRepository;
    @GetMapping(path = "", produces = MediaType.APPLICATION_JSON_VALUE)

    public Iterable<Nivel> getNivel(){
        logger.info("A obter todos os niveis das aulas");
            return nivelRepository.findAll();
    }
    @GetMapping(path = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE) //"/{id:entre 1 e 5}"
    public Nivel findById(@PathVariable int id) throws NotFoundException{
        logger.info("Nivel numero"+id);
        Optional<Nivel> _nivel=nivelRepository.findById(id);
        if (_nivel.isEmpty()) throw new NotFoundException(""+id,"Nivel","id");
        else return _nivel.get();
    }
    
}