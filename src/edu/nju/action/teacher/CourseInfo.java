package edu.nju.action.teacher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Student;
import edu.nju.service.TeacherService;
@Controller
public class CourseInfo extends BaseAction{
	@Autowired
	TeacherService teacherService;
	private String username;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAsid() {
		return asid;
	}
	public void setAsid(String asid) {
		this.asid = asid;
	}
	private String asid;
	public String searchAssis(){
		Student s = teacherService.getStudent(asid);
		username = s.getUsername();
		return SUCCESS;
	}
	
}
