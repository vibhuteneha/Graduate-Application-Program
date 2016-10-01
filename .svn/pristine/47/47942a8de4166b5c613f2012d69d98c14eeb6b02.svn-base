package gapp.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "applications")
public class Application implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Integer id;

	private String status;

	private String term;

	private String toefl;

	private String gre;

	private String gpa;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	private String email;

	private String cin;

	private String gender;

	private String dob;

	private String citizenship;

	private String phone;

	@OneToMany(mappedBy = "applications")
	private List<ApplicationStatus> applicationstatus;

	@ManyToOne
	private User applicant;

	@Column(name = "submit_date")
	private Date submitDate;

	@ManyToOne
	private Program programs;

	@OneToMany(mappedBy = "application")
	private List<Degree> degrees;

	@OneToMany(mappedBy = "application")
	private List<AdditionalInfo> additionalinfo;
	
	@OneToOne
	private File transcripts;

	public Application() {

	}
	
	public List<Degree> getDegrees() {
		return degrees;
	}

	public void setDegrees(List<Degree> degrees) {
		this.degrees = degrees;
	}
	
	public Date getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<ApplicationStatus> getApplicationstatus() {
		return applicationstatus;
	}

	public void setApplicationstatus(List<ApplicationStatus> applicationstatus) {
		this.applicationstatus = applicationstatus;
	}

	public User getApplicant() {
		return applicant;
	}

	public void setApplicant(User applicant) {
		this.applicant = applicant;
	}

	public Program getPrograms() {
		return programs;
	}

	public void setPrograms(Program programs) {
		this.programs = programs;
	}

	public List<AdditionalInfo> getAdditionalinfo() {
		return additionalinfo;
	}

	public void setAdditionalinfo(List<AdditionalInfo> additionalinfo) {
		this.additionalinfo = additionalinfo;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public String getToefl() {
		return toefl;
	}

	public void setToefl(String toefl) {
		this.toefl = toefl;
	}

	public String getGre() {
		return gre;
	}

	public void setGre(String gre) {
		this.gre = gre;
	}

	public String getGpa() {
		return gpa;
	}

	public void setGpa(String gpa) {
		this.gpa = gpa;
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

	public String getCin() {
		return cin;
	}

	public void setCin(String cin) {
		this.cin = cin;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getCitizenship() {
		return citizenship;
	}

	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public File getTranscripts() {
		return transcripts;
	}

	public void setTranscripts(File transcripts) {
		this.transcripts = transcripts;
	}
	
	

}
