package edu.nju.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.model.Login;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.service.LoginService;

@Controller
public class LoginAction extends BaseAction{
	
	@Autowired
	private LoginService loginService; 
	
	public String execute() throws ServletException,IOException{
		String username =(String) request.getParameter("username");
		String password = (String) request.getParameter("password");
		request.setAttribute("username", username);
		Login result = loginService.login(username,password);
		if(result.equals(Login.MANAGER)){
			List<Student> stu = loginService.getStudent();
			List<Teacher> tea = loginService.getTeacher();
			request.setAttribute("stuList", stu);
			request.setAttribute("teaList", tea);
		}
		return result.toString();
	}
}
