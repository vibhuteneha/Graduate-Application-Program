package gapp.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User implements Serializable{


	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Integer id;

	@ElementCollection
	@CollectionTable(name = "admin_staff",
	joinColumns = @JoinColumn(name = "user_id") )
	@Column(name = "role")
	private Set<String> roles;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(unique = true, nullable = false)
	private String email;

	@Column(nullable = false)
	private String password;

	@OneToMany(mappedBy = "applicant")
	private List<Application> applications;

	@OneToMany(mappedBy = "userid")
	private List<ApplicationStatus> applicationStatus;


	public User()
	{
		roles = new HashSet<String>();
	}

	public boolean isAdmin()
	{
		return roles.contains( "Admin" );
	}

	public boolean isStaff()
	{
		return roles.contains( "Staff" );
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Application> getApplications() {
		return applications;
	}

	public void setApplications(List<Application> applications) {
		this.applications = applications;
	}

	public Set<String> getRoles() {
		return roles;
	}

	public void setRoles(Set<String> roles) {
		this.roles = roles;
	}

	public List<ApplicationStatus> getApplicationStatus() {
		return applicationStatus;
	}

	public void setApplicationStatus(List<ApplicationStatus> applicationStatus) {
		this.applicationStatus = applicationStatus;
	}
	
	
	
}