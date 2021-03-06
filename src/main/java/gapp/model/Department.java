package gapp.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "departments")
public class Department implements Serializable{


	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue
    private Integer id;
	
	@Column(name = "department_name")
	private String departmentName;
	
	@OneToMany(mappedBy = "departments")
	private List<Program> programs;
	
	@OneToMany(mappedBy = "departments")
	private List<AdditionalInfo> additionalinfo;

	public Department() {
	
	}

	public Department(Integer id, String departmentName) {
		super();
		this.id = id;
		this.departmentName = departmentName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public List<Program> getPrograms() {
		return programs;
	}

	public void setPrograms(List<Program> programs) {
		this.programs = programs;
	}

	public List<AdditionalInfo> getAdditionalinfo() {
		return additionalinfo;
	}

	public void setAdditionalinfo(List<AdditionalInfo> additionalinfo) {
		this.additionalinfo = additionalinfo;
	}
}
