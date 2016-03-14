package edu.nju.action.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.service.StudentService;

@Controller
public class GiveScore extends BaseAction{

	@Autowired
	StudentService studentService;
	public String giveScore(){
		return SUCCESS;
	}
}
