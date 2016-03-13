package edu.nju.action.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.service.StudentService;

@Controller
public class StudentJump extends BaseAction{

	@Autowired
	StudentService studentService;
	public String execute(){
		setRequest();
		return SUCCESS;
	}
	
	public String jumpToHomework(){
		setRequest();
		return SUCCESS;
	}
	
	public String jumpToComment(){
		setRequest();
		return SUCCESS;
	}
	
	public String jumpToInfo(){
		setRequest();
		return SUCCESS;
	}
	
	public void setRequest(){
		request.setAttribute("termList", session.get("termList"));
		request.setAttribute("carr", session.get("carr"));
		request.setAttribute("username", session.get("username"));
		request.setAttribute("course", session.get("course"));
	}
}
