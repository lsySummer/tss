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
public class ToCourse extends BaseAction{
	@Autowired
	TeacherService teacherService;
	public String execute() throws ServletException,IOException{
		request.setAttribute("tuser", session.get("tuser"));
		int id = Integer.parseInt(request.getParameter("hiddenCourseId"));
		Course c = teacherService.getCourse(id);
		request.setAttribute("course", c);
		session.put("course", c);
		List<Cselect> sidList = teacherService.getSelect(id);
		request.setAttribute("sidList", sidList);
		request.setAttribute("username", session.get("username"));
		return SUCCESS;
	}
}
