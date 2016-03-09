package edu.nju.action.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Course;
import edu.nju.model.Teacher;
import edu.nju.service.LoginService;

@Controller
public class JumpTeaching  extends BaseAction{
	@Autowired
	private LoginService loginService; 
	
	public String execute() throws ServletException,IOException{
		request.setAttribute("termList", session.get("termList"));
		request.setAttribute("tname", session.get("tname"));
		List list = (List) request.getAttribute("tname");
		request.setAttribute("courseList", session.get("courseList"));
		List<Teacher> tea = loginService.getTeacher();
		request.setAttribute("teaList", tea);
		List<Course> cList = loginService.getCourse();
		session.put("courseList", cList);
		request.setAttribute("courseList", cList);
		request.setAttribute("termSelect", "0");
		return SUCCESS;
	}
}
