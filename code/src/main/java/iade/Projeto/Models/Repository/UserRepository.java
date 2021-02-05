package iade.Projeto.Models.Repository;
import org.springframework.data.repository.CrudRepository;
import iade.Projeto.Models.User;


public interface UserRepository extends CrudRepository<User, Integer> {

    
}