package springmvc;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class MainModel {
	private int jobid;
	private String jobname;
	private String jobexp;
	private String jobpackage;
	private String jobskills;
	private String jobtype;
	private String name;
	private String phone;
	private String filename;
	private CommonsMultipartFile resume;
	private int id;
		
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public CommonsMultipartFile getResume() {
		return resume;
	}
	public void setResume(CommonsMultipartFile resume) {
		this.resume = resume;
	}
	public int getJobid() {
		return jobid;
	}
	public void setJobid(int jobid) {
		this.jobid = jobid;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
	public String getJobexp() {
		return jobexp;
	}
	public void setJobexp(String jobexp) {
		this.jobexp = jobexp;
	}
	public String getJobpackage() {
		return jobpackage;
	}
	public void setJobpackage(String jobpackage) {
		this.jobpackage = jobpackage;
	}
	public String getJobskills() {
		return jobskills;
	}
	public void setJobskills(String jobskills) {
		this.jobskills = jobskills;
	}
	public String getJobtype() {
		return jobtype;
	}
	public void setJobtype(String jobtype) {
		this.jobtype = jobtype;
	}
	
}
