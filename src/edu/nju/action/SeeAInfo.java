package edu.nju.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.service.LoginService;

@Controller
public class SeeAInfo extends BaseAction{

	@Autowired
	LoginService loginService;
	public String execute(){
		int cid = Integer.parseInt(request.getParameter("hiddenCourseId"));
		Student t = loginService.getSeeStudent(cid);
		request.setAttribute("seeUser", t);
		return SUCCESS;
	}
}
