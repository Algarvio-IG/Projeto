package iade.Projeto.Controllars;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
/*import org.springframework.web.bind.annotation.PutMapping;*/
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import iade.Projeto.Models.Exceptions.NotFoundException;
import iade.Projeto.Models.Marcacao;
import iade.Projeto.Models.Repository.MarcacaoRepository;
import java.util.Optional;


@RestController
@RequestMapping(path = "/api/Marcacao")


public class MarcacaoControllar {

    private Logger logger= LoggerFactory.getLogger(MarcacaoControllar.class);

    @Autowired
    private MarcacaoRepository marcacaoRepository;

    @GetMapping(path = "", produces= MediaType.APPLICATION_JSON_VALUE)
    public Iterable<Marcacao> getMarcacao() {
        logger.info("A enviar todas as marcações");
        return marcacaoRepository.findAll();
    }

    @GetMapping(path = "/{id}", produces= MediaType.APPLICATION_JSON_VALUE)
    public Marcacao getMarcacao(@PathVariable int id) {
        logger.info("Sending resposta with id "+id);
        Optional<Marcacao> _marcacao= marcacaoRepository.findById(id);
        if (_marcacao.isEmpty()) throw new NotFoundException(""+id,"Marcacao","id");
        else return _marcacao.get() ;
    }

    @PostMapping(path = "", produces= MediaType.APPLICATION_JSON_VALUE)
    public Marcacao saveMarcacao(@RequestBody Marcacao newMarcacao) {
        logger.info("Guardar User com o id: "+newMarcacao.getID());
        Marcacao marcacao = marcacaoRepository.save(newMarcacao);
        return marcacao;
    }

    /*@PutMapping(path ="/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public Marcacao saveMarcacao(@RequestBody Marcacao newMarcacao,@PathVariable int id) {
        logger.info("Guardar nova Data: "+newMarcacao.data());
        java.util.Optional<Marcacao> marcacao = marcacaoRepository.findById(id);
        Marcacao marcacao_nova = marcacao_nova.get();
        marcacao_nova.setId(newMarcacao.getID());
        Marcacao nova_marcacao= marcacaoRepository.save(marcacao_nova);
            return nova_marcacao;
            
    }*/







    
}
