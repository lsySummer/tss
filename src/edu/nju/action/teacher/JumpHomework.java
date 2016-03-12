package edu.nju.action.teacher;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.service.TeacherService;

@Controller
public class JumpHomework extends BaseAction{
	@Autowired
	TeacherService teacherService;
	public String execute() throws ServletException,IOException{
		Course c = (Course) session.get("course");
		request.setAttribute("course", c);
		List<Chowok> hlist = teacherService.getHomework(c.getId());
		request.setAttribute("hlist", hlist);
		return SUCCESS;
	}
}
