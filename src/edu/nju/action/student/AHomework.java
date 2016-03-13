package edu.nju.action.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.service.StudentService;

@Controller
public class AHomework extends BaseAction{

	@Autowired
	StudentService studentService;
	
	public String execute(){
		return SUCCESS;
	}
}
