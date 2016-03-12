package edu.nju.action.teacher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Course;
import edu.nju.service.TeacherService;

@Controller
public class CheckHw extends BaseAction{
	@Autowired
	TeacherService teacherService;
	public String checkHw(){
		String shid = request.getParameter("shid");
		request.setAttribute("shid", shid);
		Course c = (Course) session.get("course");
		request.setAttribute("course", c);
		return SUCCESS;
	}
}
