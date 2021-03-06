package edu.nju.action.teacher;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Course;
import edu.nju.model.Cselect;
import edu.nju.service.TeacherService;

@Controller
public class JumpToCourse extends BaseAction{

	@Autowired
	TeacherService teacherService;
	public String execute() throws ServletException,IOException{
		request.setAttribute("tuser", session.get("tuser"));
		request.setAttribute("username", session.get("username"));
		Course c = (Course)session.get("course");
		Course c1 = teacherService.getCourse(c.getId());
		request.setAttribute("course", c1);
		session.put("course", c1);
		List<Cselect> sidList = teacherService.getSelect(c.getId());
		request.setAttribute("sidList", sidList);
		return SUCCESS;
	}
}
