package springmvc.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

import gapp.model.dao.UserDao;

@Test(groups = "UserDaoTests")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserDaoTest extends AbstractTransactionalTestNGSpringContextTests {

    @Autowired
    UserDao userDao;

    @Test
    public void getUser()
    {
        assert userDao.getUser( 1 ).getFirstName().equalsIgnoreCase( "admin" );
    }

    @Test
    public void getUsers()
    {
        assert userDao.getUsers().size() > 0;
    }

}
