package gapp.model.dao;

import java.util.List;

import gapp.model.AdditionalInfo;
import gapp.model.Department;
import gapp.model.Program;

public interface DepartmentDao {

	//Department
	List<Department> getDepartment();
	
	Department getDepartment( Integer id );
	
	//Program
	
	List<Program> getProgram();
	
	List<Program> getProgram(Integer id);
	
	Program getPrograms( Integer id);
	
	//Additional Info
	List<AdditionalInfo> getAdditionalInfo(Integer id);
	
	AdditionalInfo getAdditional(Integer id);

	//Addition
	Department saveDepartment(Department department);

	Program saveProgram(Program program);

	AdditionalInfo saveAdditionalInfo(AdditionalInfo addinfo);
	
	//Delete
	
	void deleteProg ( Program program );
	
	void deleteAddinfo (AdditionalInfo addinfo);
	
}
