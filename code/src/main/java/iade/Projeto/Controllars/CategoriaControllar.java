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

import iade.Projeto.Models.Categoria;
import iade.Projeto.Models.Exceptions.NotFoundException;
import iade.Projeto.Models.Repository.CategoriaRepository;

@RestController
@RequestMapping(path = "/api/Categoria")    //localhost:8080/api/Categoria

public class CategoriaControllar {
    private Logger logger= LoggerFactory.getLogger(CategoriaControllar.class);
    
    @Autowired
    
    private CategoriaRepository categoriaRepository;
    
    @GetMapping(path = "", produces = MediaType.APPLICATION_JSON_VALUE)
    public Iterable<Categoria> getCategorias() {
        logger.info("A obter todas as Categorias");
            return categoriaRepository.findAll();
        }

    @GetMapping(path="/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public Categoria getUnit(@PathVariable int id) throws NotFoundException{
        logger.info("A obter a Categoria com o id"+id);
        Optional<Categoria> _categoria=categoriaRepository.findById(id);
        if(_categoria.isEmpty()) throw new NotFoundException(""+id,"Categoria", "id");
        else return _categoria.get();
    }
}  
