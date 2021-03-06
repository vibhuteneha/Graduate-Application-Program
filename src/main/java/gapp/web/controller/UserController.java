package gapp.web.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import gapp.model.Department;
import gapp.model.User;
import gapp.model.dao.ApplicationDao;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.UserDao;
import gapp.web.validator.UserValidator;

@Controller
public class UserController {

    @Autowired
    private UserDao userDao;
    
    @Autowired
	private DepartmentDao departmentDao;
    
    @Autowired
    private UserValidator uservalidator;
    
    @Autowired
    private ApplicationDao applicationDao;
    
    
    @RequestMapping("/index.html")
    public String index()
    {	
    	return "index";	
    }
    
    //-------------------Registration-------------------------------
    
    @RequestMapping(value="/register.html", method=RequestMethod.GET)
    public String register( ModelMap models)
    {
    	models.put("user", new User());
    	return "/register";
    }
    
    @RequestMapping(value="/register.html", method=RequestMethod.POST)
    public String register( @ModelAttribute User user,BindingResult result)
    {	
    	uservalidator.validate(user, result);
    	if(result.hasErrors()) return "register";

        Set<String> roles = new HashSet<String>();
        roles.add( "Student" );
        user.setRoles( roles );
        
    	
    	user = userDao.saveUser(user);	
    	return "redirect:/login.html";
    }
    
    //-----------------------Admin/Department view------------------------------
    
    @RequestMapping("/admin.html")
	public String admin(ModelMap models)
	{
		List<Department> departments = departmentDao.getDepartment();
		models.put("departments", departments);
		
		return "/admin";
	}
    
    
    //-------------------------Staff------------------------------------
    
    @RequestMapping("/staff.html")
    public String staff()
    {
    	return "/staff";
    }
    
    //------------------------------Student/Application view----------------
    
    @RequestMapping("/student.html")
    public String student(@RequestParam Integer id, ModelMap models)
    {
    	models.put("applications", applicationDao.getApplication(id));
    	
    	return "/student";
    }
    
    //------------------------------Login---------------------------------
    
    @RequestMapping(value="/login.html", method=RequestMethod.GET)
    public String login( ModelMap models)
    {
    	models.put("user", new User());
    	return "/login";
    }
    
    
    @RequestMapping(value = "/login.html", method = RequestMethod.POST)
    public String login( ModelMap models,@RequestParam String email,
        @RequestParam String password, HttpSession session, HttpServletRequest request)
    {
        User user = userDao.getUser( email );
        if( user == null || !user.getPassword().equals( password ) )
            return "redirect:/login.html";
        if(user!=null)
        {
        	session  = request.getSession(true);
        	session.setAttribute( "user", user);
        }
        if( user.isAdmin() )
        {
            return "redirect:/admin.html";
        }
        else if( user.isStaff() )
        {
            return "redirect:/staff.html";
        }
        else
        {
        	int id = user.getId();
        	models.put("id",id);
        	
            return "redirect:/student.html";
        }
    }
    
    //-------------------------------Logout--------------------------------
    
    @RequestMapping("/logout.html")
    public String logout( HttpSession session )
    {
    	session.removeAttribute("user");
        session.invalidate();
        return "redirect:/login.html";
    }

}