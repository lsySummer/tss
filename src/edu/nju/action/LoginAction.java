package edu.nju.action;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.model.Course;
import edu.nju.model.Login;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.model.Term;
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
			request.setAttribute("stuList", stu);
			session.put("stuList", stu);
			List<Teacher> tea = loginService.getTeacher();
			ArrayList<String> tname = new ArrayList<String>();
			for(int i=0;i<tea.size();i++){
				tname.add(tea.get(i).getUsername());
			}
			session.put("tname", tname);
			request.setAttribute("tname", tname);
			request.setAttribute("teaList", tea);
			session.put("teaList", tea);
			List<Term> term = loginService.getTerm();
			session.put("termList", term);
			request.setAttribute("termList",term);
			List<Course> cList = loginService.getCourse();
			session.put("courseList", cList);
			request.setAttribute("termSelect", "0");
			request.setAttribute("courseList", cList);
		}
		return result.toString();
	}
}
