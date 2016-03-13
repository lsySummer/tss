package edu.nju.action.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Course;
import edu.nju.service.StudentService;
import edu.nju.service.TeacherService;

@Controller
public class SHomework extends BaseAction{

	@Autowired
	StudentService studentService;
	
	@Autowired
	TeacherService teacherService;
	
	public String execute(){
		int id = Integer.parseInt(request.getParameter("hiddenCourseId"));
		Course c = teacherService.getCourse(id);
		request.setAttribute("course", c);
		session.put("course", c);
		request.setAttribute("username", session.get("username"));
		return SUCCESS;
	}
}
