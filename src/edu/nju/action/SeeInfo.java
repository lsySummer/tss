package edu.nju.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.model.Teacher;
import edu.nju.service.LoginService;

@Controller
public class SeeInfo extends BaseAction{

	@Autowired
	LoginService loginService;
	public String execute(){
		int cid = Integer.parseInt(request.getParameter("hiddenCourseId"));
		Teacher t = loginService.getSeeTeacher(cid);
		session.put("tuser", t);
		System.out.println("cid"+cid);
		return SUCCESS;
	}
}
