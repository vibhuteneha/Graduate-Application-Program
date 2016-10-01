package gapp.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import gapp.model.AdditionalInfo;
import gapp.model.Department;
import gapp.model.Program;
import gapp.model.dao.DepartmentDao;

@Controller
@SessionAttributes("department")
public class DepartmentController {

	@Autowired
	private DepartmentDao departmentDao;
	
	//----------------------Department View------------------------------------------

	@RequestMapping("/dept/view.html")
	public String view( @RequestParam Integer id, ModelMap models )
	{
		models.put("dept", departmentDao.getDepartment(id));
		models.put("prog", departmentDao.getProgram(id));
		models.put("addinfo", departmentDao.getAdditionalInfo(id));
		return "dept/view";
	}

	@RequestMapping("/{id}.html")
	public String view2( @PathVariable Integer id, ModelMap models )
	{
		return view( id, models );
	}
	
	//-----------------------Adding Department----------------------------------------

	@RequestMapping(value = "/dept/addDept.html", method = RequestMethod.GET)
	public String addDept( ModelMap models )
	{
		models.put( "department", new Department() );

		return "/dept/addDept";

	}

	@RequestMapping(value="/dept/addDept.html", method = RequestMethod.POST)
	public String addDept( @ModelAttribute Department department)
	{
		department = departmentDao.saveDepartment(department);	
		return "redirect:/admin.html";
	}
	
	//-------------------------Editing Department--------------------------------------
	
	@RequestMapping(value = "/dept/editDept.html", method = RequestMethod.GET)
	public String editDept( @RequestParam Integer id, ModelMap models )
	{
		models.put( "department", departmentDao.getDepartment(id) );
		models.put("prog", departmentDao.getProgram(id));
		models.put("addinfo", departmentDao.getAdditionalInfo(id));

		return "/dept/editDept";

	}

	@RequestMapping(value="/dept/editDept.html", method = RequestMethod.POST)
	public String editDept( @ModelAttribute Department department)
	{
		departmentDao.saveDepartment(department);
		return "redirect:/admin.html";
	}

	//------------------------Adding Program------------------------------------------

	@RequestMapping(value = "/dept/addProg.html", method = RequestMethod.GET)
	public String addProg( ModelMap models )
	{
		models.put( "program", new Program() );

		return "/dept/addProg";

	}

	@RequestMapping(value="/dept/addProg.html", method = RequestMethod.POST)
	public String addProg( @ModelAttribute Program program, @RequestParam Integer id)
	{
		Department department = departmentDao.getDepartment(id);
		program.setDepartments(department);
		program = departmentDao.saveProgram(program);

		return "redirect:/admin.html";
	}
	
	//--------------------------------Delete Program-------------------------------------

	@RequestMapping(value="/dept/deleteProg.html", method=RequestMethod.GET)
	public String delete( @RequestParam Integer progId,@RequestParam Integer deptId, ModelMap models, RedirectAttributes ra )
	{
		Program program = departmentDao.getPrograms(progId);
		departmentDao.deleteProg(program);
		ra.addAttribute("id", deptId);
		return "redirect:/dept/editDept.html";
	}
	
	//--------------------------------Delete Additional info-------------------------------------

		@RequestMapping(value="/dept/deleteAddInfo.html", method=RequestMethod.GET)
		public String deleteinfo( @RequestParam Integer addinfoId,@RequestParam Integer deptId, ModelMap models, RedirectAttributes ra )
		{
			AdditionalInfo addinfo= departmentDao.getAdditional(addinfoId);
			departmentDao.deleteAddinfo(addinfo);;
			ra.addAttribute("id", deptId);
			return "redirect:/dept/editDept.html";
		}

	//--------------------------------Adding Additional Information------------------------
	
	@RequestMapping(value = "/dept/addInfo.html", method = RequestMethod.GET)
	public String addInfo( ModelMap models )
	{
		models.put( "addinfo", new AdditionalInfo() );

		return "/dept/addInfo";

	}

	@RequestMapping(value="/dept/addInfo.html", method = RequestMethod.POST)
	public String addInfo( @ModelAttribute AdditionalInfo addinfo, @RequestParam Integer id)
	{
		Department department = departmentDao.getDepartment(id);
		addinfo.setDepartments(department);
		addinfo = departmentDao.saveAdditionalInfo(addinfo);

		return "redirect:/admin.html";
	}


}
