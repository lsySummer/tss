package edu.nju.action.teacher;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.service.TeacherService;

@Controller
public class JumpTeacher extends BaseAction{
	@Autowired
	TeacherService teacherService;
	public String execute() throws ServletException,IOException{
		request.setAttribute("tuser", session.get("tuser"));
		request.setAttribute("termList", session.get("termList"));
		request.setAttribute("carr", session.get("carr"));
		request.setAttribute("username", session.get("username"));
		return SUCCESS;
	}
}
