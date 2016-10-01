package gapp.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.User;
import gapp.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

	
    @Override
    public User getUser( Integer id )
    {
        return entityManager.find( User.class, id );
    }

    @Override
    public List<User> getUsers()
    {
        return entityManager.createQuery( "from User order by id", User.class )
            .getResultList();
    }

	@Override
	@Transactional
	public User saveUser(User user) {
		
		return entityManager.merge(user);
	}

	@Override
	public User getUser(String email) {
	        List<User> users = entityManager.createQuery( "from User user left join fetch user.roles "
	        		+ "where lower(email) = :email", User.class )
	            .setParameter( "email", email.toLowerCase() )
	            .getResultList();
	        return users.size() == 0 ? null : users.get( 0 );
	}
	
}