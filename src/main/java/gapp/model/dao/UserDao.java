package gapp.model.dao;

import java.util.List;
import gapp.model.User;

public interface UserDao {

    User getUser( Integer id );
   
    User getUser( String email );

    List<User> getUsers();
    
    User saveUser(User user);
    
    
    
/*    List<User> getUsers(String email);
*/
}