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

import iade.Projeto.Models.User;
import iade.Projeto.Models.Exceptions.NotFoundException;
import iade.Projeto.Models.Repository.UserRepository;

@RestController
@RequestMapping(path = "/api/User")
public class UserControllar {
    private Logger logger=LoggerFactory.getLogger(UserControllar.class);
    @Autowired
    private UserRepository userRepository;
    @GetMapping(path = "", produces = MediaType.APPLICATION_JSON_VALUE)

    public Iterable<User> getUser(){
        logger.info("A obter todos os Users inscritos");
            return userRepository.findAll();
    }
    @GetMapping(path = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE) 
    public User findById(@PathVariable int id) throws NotFoundException {
        logger.info("User"+id);
        Optional<User> _User= userRepository.findById(id);
        if (_User.isEmpty()) throw new NotFoundException(""+id,"User","id");
        else  return _User.get();
    }

}

