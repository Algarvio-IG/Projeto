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

import iade.Projeto.Models.PersonalTrainer;
import iade.Projeto.Models.Exceptions.NotFoundException;
import iade.Projeto.Models.Repository.PersonalTrainerRepository;

@RestController
@RequestMapping(path = "/api/PersonalTrainer")
public class PersonalTrainerControllar {
    private Logger logger=LoggerFactory.getLogger(PersonalTrainerControllar.class);
    @Autowired
    private PersonalTrainerRepository personaltrainerRepository;
    @GetMapping(path = "", produces = MediaType.APPLICATION_JSON_VALUE)

    public Iterable<PersonalTrainer> getPersonalTrainer(){
        logger.info("A obter todos os personal trainers inscritos");
            return personaltrainerRepository.findAll();
    }
    @GetMapping(path = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE) 
    public PersonalTrainer findById(@PathVariable int id) throws NotFoundException{
        logger.info("PersonalTrainer"+id);
        Optional<PersonalTrainer> _PersonalTrainer= personaltrainerRepository.findById(id);
        if (_PersonalTrainer.isEmpty()) throw new NotFoundException(""+id,"PersonalTrainer","id");
        else return _PersonalTrainer.get();
    }

}
    
