package gapp.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import gapp.model.AdditionalInfo;
import gapp.model.Application;
import gapp.model.ApplicationStatus;
import gapp.model.Degree;
import gapp.model.Department;
import gapp.model.Program;
import gapp.model.User;
import gapp.model.dao.ApplicationDao;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.UserDao;

@Controller
@SessionAttributes("application")
public class ApplicationController {

	@Autowired
	private ApplicationDao applicationDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private DepartmentDao departmentDao;

	@Autowired
	private ServletContext context;

	// -------------------------Application Details------------------

	@RequestMapping("/app/appview.html")
	public String appview(@RequestParam Integer appid, @RequestParam Integer deptid, ModelMap models) {
		models.put("applications", applicationDao.getApplications(appid));
		models.put("addinfo", applicationDao.getAdditionalInfo(appid));

		return "app/appview";
	}

	// -----------------------Uploading file------------------------------------

	private File getFileDirectory() {
		String path = context.getRealPath("/WEB-INF/files");
		return new File(path);
	}

	// -----------------------------Apply for New Application----------------

	@RequestMapping(value = "/app/apply.html", method = RequestMethod.GET)
	public String apply(ModelMap models, @RequestParam Integer id) {
		models.put("user", userDao.getUser(id));
		models.put("departments", departmentDao.getDepartment());
		models.put("application", new Application());
		models.put("addinfo", new AdditionalInfo());
		return "/app/apply";
	}

	@RequestMapping(value = "/app/apply.html", method = RequestMethod.POST)
	public String apply(@ModelAttribute Application application, @RequestParam(required = false) MultipartFile file1,
			@RequestParam Integer id, HttpServletRequest request, @RequestParam String[] schoolname,
			@RequestParam String[] timeperiod, @RequestParam String[] degreeearned, @RequestParam String[] major)
					throws IllegalStateException, IOException {

		File file2 = new File(context.getRealPath("/WEB-INF/files"));
		gapp.model.File file = new gapp.model.File();

		User user = userDao.getUser(id);
		application.setApplicant(user);

		Date submitDate = new Date();

		ApplicationStatus appstatus = new ApplicationStatus();

		String save = request.getParameter("save");
		String submit = request.getParameter("submit");
		if ("Save".equals(save)) {
			application.setStatus("Not Submitted");
			application = applicationDao.saveApplication(application);
		}
		if ("Submit".equals(submit)) {

			application.setStatus("New");
			application.setSubmitDate(submitDate);
			appstatus.setStatusName("New");
			appstatus.setStatusTime(submitDate);
			appstatus.setUserid(user);
			application = applicationDao.saveApplication(application);
			appstatus.setApplications(application);

			appstatus = applicationDao.saveAppStatus(appstatus);
		}

		if (null != file1) {
			if (!file2.exists()) {
				if (file2.mkdir()) {
					file1.transferTo(new File(context.getRealPath("/WEB-INF/files"),
							"ts" + application.getId() + file1.getOriginalFilename()));
					file.setName("ts" + application.getId() + file1.getOriginalFilename());
					file.setType(file1.getContentType());
					gapp.model.File filets = applicationDao.saveFile(file);
					application.setTranscripts(filets);
				}
			} else {
				file1.transferTo(
						new File(getFileDirectory(), "ts" + application.getId() + file1.getOriginalFilename()));
				file.setName("ts" + application.getId() + file1.getOriginalFilename());
				file.setType(file1.getContentType());
				gapp.model.File filets = applicationDao.saveFile(file);
				application.setTranscripts(filets);
			}
		}

		for (int i = 0; i < schoolname.length; i++) {
			Degree d = new Degree();
			d.setSchoolName(schoolname[i]);
			d.setTimePeriod(timeperiod[i]);
			d.setDegreeEarned(degreeearned[i]);
			d.setMajor(major[i]);

			d.setApplication(application);
			d = applicationDao.saveDegree(d);
		}

		return "redirect:/student.html?id=" + id;
	}

	@ModelAttribute("populateDepartments")
	public List<Department> populateDepartments() {
		List<Department> dept = new ArrayList<Department>();
		dept.add(new Department(0, "Select Department..."));
		for (Department department : departmentDao.getDepartment()) {
			dept.add(new Department(department.getId(), department.getDepartmentName()));
		}
		return dept;
	}

	@RequestMapping(value = "/app/getPrograms.html", method = RequestMethod.POST)
	@ResponseBody
	public String getPrograms(@RequestParam Integer departmentID) {
		List<Program> program = departmentDao.getProgram(departmentID);
		String html = "<label>Programs<font color='red'>*</font>: </label><select name='programs.id' id ='selectprog' class='form-control input-lg'><option value=''>Select Program...</option>";
		for (Program program1 : program) {
			html += "<option value='" + program1.getId() + "'>" + program1.getProgramName() + "</option>";
		}
		html += "</select>";
		return html;
	}

	@RequestMapping(value = "/app/editPrograms.html", method = RequestMethod.POST)
	@ResponseBody
	public String editPrograms(@RequestParam Integer departmentID, @RequestParam Integer programID) {
		List<Program> program = departmentDao.getProgram(departmentID);
		String html = "<label>Programs<font color='red'>*</font>: </label><select name='programs.id' required class='form-control input-lg'>";
		String selected = null;
		for (Program program1 : program) {
			if (program1.getId() == programID) {
				selected = "selected";
			} else {
				selected = null;
			}
			html += "<option value='" + program1.getId() + "'" + selected + ">" + program1.getProgramName()
					+ "</option>";
		}
		html += "</select>";
		return html;
	}

	// ------------------------Download
	// file-----------------------------------------

	@RequestMapping("/app/download.html")
	public String download(HttpServletResponse response, @RequestParam Long fileid) throws IOException {

		gapp.model.File name = applicationDao.getFiles(fileid);
		response.setContentType(name.getType());
		response.setHeader("Content-Disposition", "attachment; filename=" + name.getName());
		FileInputStream in = new FileInputStream(new File(getFileDirectory() + "/" + name.getName()));
		OutputStream out = response.getOutputStream();

		byte buffer[] = new byte[2048];
		int bytesRead;
		while ((bytesRead = in.read(buffer)) > 0)
			out.write(buffer, 0, bytesRead);

		in.close();

		return null;
	}

	// -----------------------------EditApplication------------------------------------------

	@RequestMapping(value = "/app/editApp.html", method = RequestMethod.GET)
	public String editApp(@RequestParam Integer appid, @RequestParam Integer deptid, ModelMap models) {
		models.put("application", applicationDao.getApplications(appid));
		models.put("departments", departmentDao.getDepartment(deptid));

		return "app/editApp";

	}

	@RequestMapping(value = "/app/editApp.html", method = RequestMethod.POST)
	public String editApp(@ModelAttribute Application application, @RequestParam Integer appid,
			@RequestParam Integer deptid, HttpServletRequest request, @RequestParam String[] schoolname,
			@RequestParam String[] timeperiod, @RequestParam String[] degreeearned, @RequestParam String[] major,
			@RequestParam(required = false) MultipartFile file1) throws IllegalStateException, IOException {
		User user = application.getApplicant();

		gapp.model.File file = new gapp.model.File();

		Date submitDate = new Date();

		ApplicationStatus appstatus = new ApplicationStatus();

		String save = request.getParameter("save");
		String submit = request.getParameter("submit");

		if ("Save".equals(save)) {
			application.setStatus("Not Submitted");
			application = applicationDao.saveApplication(application);

		}
		if ("Submit".equals(submit)) {
			application.setStatus("New");
			application.setSubmitDate(submitDate);
			appstatus.setStatusName("New");
			appstatus.setStatusTime(submitDate);
			appstatus.setUserid(user);
			application = applicationDao.saveApplication(application);
			appstatus.setApplications(application);

			appstatus = applicationDao.saveAppStatus(appstatus);

		}

		if (null != file1 && !file1.isEmpty()) {
			file1.transferTo(new File(getFileDirectory(), "ts" + application.getId() + file1.getOriginalFilename()));
			file.setName("ts" + application.getId() + file1.getOriginalFilename());
			file.setType(file1.getContentType());
			gapp.model.File filets = applicationDao.saveFile(file);
			application.setTranscripts(filets);

		}

		if (schoolname != null) {
			for (int i = 0; i < schoolname.length; i++) {
				Degree d = new Degree();
				d.setSchoolName(schoolname[i]);
				d.setTimePeriod(timeperiod[i]);
				d.setDegreeEarned(degreeearned[i]);
				d.setMajor(major[i]);

				d.setApplication(application);
				d = applicationDao.saveDegree(d);

			}
		}

		application = applicationDao.saveApplication(application);
		return "redirect:/app/appview.html?appid=" + appid + "&deptid=" + deptid;

	}

	// -----------------------Delete Degree----------------------------------

	@RequestMapping(value = "/app/deleteDeg.html", method = RequestMethod.GET)
	public String deletedeg(@RequestParam Integer appid, @RequestParam Integer degid, @RequestParam Integer deptid,
			ModelMap models, RedirectAttributes ra) {
		Degree degree = applicationDao.getDegree(degid);
		applicationDao.deleteDeg(degree);
		return "redirect:/app/editApp.html?appid=" + appid + "&deptid=" + deptid;
	}

}
