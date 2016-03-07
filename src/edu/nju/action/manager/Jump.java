package edu.nju.action.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.service.LoginService;

@Controller
public class Jump  extends BaseAction{
	@Autowired
	private LoginService loginService; 
	
	public String execute() throws ServletException,IOException{
		List<Student> stu = loginService.getStudent();
		List<Teacher> tea = loginService.getTeacher();
		request.setAttribute("stuList", stu);
		request.setAttribute("teaList", tea);
		return SUCCESS;
	}
}
