package gapp.web.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import gapp.model.User;
import gapp.model.dao.UserDao;

@Component
public class UserValidator implements Validator {
	
	@Autowired
	private UserDao userDao;

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		User user = (User) target;
		
		String email = user.getEmail();
		if(!StringUtils.hasText(user.getEmail()))
			errors.rejectValue("email", "error.field.empty");
		if(!StringUtils.hasText(user.getPassword()))
			errors.rejectValue("password", "error.field.empty");
		if(!StringUtils.hasText(user.getFirstName()))
			errors.rejectValue("firstName", "error.field.empty");
		if(!StringUtils.hasText(user.getLastName()))
			errors.rejectValue("lastName", "error.field.empty");
		
		/*for(User u: userDao.getUsers(email))
		if(user.getEmail().equalsIgnoreCase(u.getEmail())){
				errors.rejectValue( "email", "error.email.exists" );
		}*/
		
	        if( email != null && userDao.getUser( email ) != null )
	            errors.rejectValue( "email", "error.email.exists" );
	}

}
