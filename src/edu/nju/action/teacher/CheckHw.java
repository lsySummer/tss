package edu.nju.action.teacher;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Course;
import edu.nju.model.Cselect;
import edu.nju.service.TeacherService;

@Controller
public class CheckHw extends BaseAction{
	@Autowired
	TeacherService teacherService;
	public String checkHw(){
		String prid = request.getParameter("prid");
		request.setAttribute("prid", prid);
		Course c = (Course) session.get("course");
		int cid = c.getId();
		request.setAttribute("course", c);
		List<Cselect> selectList = teacherService.getselectList(cid);
		request.setAttribute("selectList", selectList);
		return SUCCESS;
	}
}
