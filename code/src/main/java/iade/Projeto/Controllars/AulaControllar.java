package iade.Projeto.Controllars;

import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
/*import org.springframework.web.bind.annotation.PostMapping;*/
/*import org.springframework.web.bind.annotation.PutMapping;*/
/*import org.springframework.web.bind.annotation.RequestBody;*/
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import iade.Projeto.Models.Aula;
import iade.Projeto.Models.Exceptions.NotFoundException;
import iade.Projeto.Models.Repository.AulaRepository;


@RestController
@RequestMapping(path = "/api/Aula")

public class AulaControllar {
    private Logger logger= LoggerFactory.getLogger(AulaControllar.class);
    
    @Autowired
    private AulaRepository aulaRepository;
    
    @GetMapping(path = "", produces = MediaType.APPLICATION_JSON_VALUE)
    public Iterable<Aula> getAulas() {
        logger.info("A obter todas as Aulas");
            return aulaRepository.findAll();
        }

    @GetMapping(path = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public Aula getUnit(@PathVariable int id) throws NotFoundException{
        logger.info("A obter todas as aulas com o id"+id);
        Optional<Aula> _aula=aulaRepository.findById(id);
        if(_aula.isEmpty()) throw new NotFoundException("A Aula"+id,"não existe","id");
        else return _aula.get();
    }
    
    /*@PostMapping(path = "", produces= MediaType.APPLICATION_JSON_VALUE)
    public Aula saveAula(@RequestBody Aula newAula) {
        logger.info("Guardar Personal Trainer com o id: "+newAula.getId());
        Aula personaltrainer = aulaRepository.save(newAula);
        return personaltrainer;
    }*/

    /*@PutMapping(path ="/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public Aula saveAula(@RequestBody Aula newAula,@PathVariable int id) {
        logger.info("Guardar nova aula: "+newAula.getNome());
        java.util.Optional<Aula> resposta = aulaRepository.findById(id);
        Aula aula_nova = aula_nova.get();
        aula_nova.setId(newAula.getId());
    }
    */

}
