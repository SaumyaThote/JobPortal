package springmvc;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@Autowired
	MainDao dao;
	
	//for job table
	@RequestMapping("/jobtable")
	public String getJobTable() {
		return "jobtable";
	}
	
	//for job view
	@RequestMapping("view")
	public String getViewJob() {
		return "viewjob";
	}
			
	// add job
	@RequestMapping(value="/addjob",method=RequestMethod.POST)
	public String addjob(@ModelAttribute("rm") MainModel rm,HttpSession session) {		
		int status=dao.addjob(rm);
		session.setAttribute("sesaddjob", "success");	
		return "redirect:/joblist";
	}
	
	//to view job table
	@RequestMapping("joblist")
	public String getRecords(Model model) {
		List<MainModel>list=dao.getJobList();
		model.addAttribute("list", list);
		return "jobtable";
	}
	
	//for getting job detail in viewjob page
	@RequestMapping("/view/{jobid}")
	public String getelementbyid(@PathVariable int jobid,Model model) {
		List<MainModel>list=dao.getJobById(jobid);
		model.addAttribute("list",list);
		return "viewjob";			
	}
	
	// add applicant
	@RequestMapping(value="view/apply",method=RequestMethod.POST)
	public String addApplicant(@ModelAttribute("rm") MainModel rm,HttpSession session) {	
		session.setAttribute("sesreg", "success");	
		System.out.println(rm.getJobname());
		dao.upload(rm);
		dao.addApplicant(rm);	
		return "redirect:/joblist";
	}
		
	//to view table of job applicants in dashboard table
	@RequestMapping("/dashboard")
	public String getApplicantsList(Model model) {
		List<MainModel>list=dao.getApplicantsList();
		model.addAttribute("list", list);
		return "dashboard";
	}
	
	//deleting job applicant by Id
	@RequestMapping("delete/{id}")
	public String deleteById(@PathVariable int id,HttpSession session)
	{
		System.out.print(id);
		int status=dao.deleteById(id);
		session.setAttribute("sesdel", "success");
		return "redirect:/dashboard";
	}

}
