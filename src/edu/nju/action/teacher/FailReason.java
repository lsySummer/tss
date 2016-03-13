package edu.nju.action.teacher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Course;
import edu.nju.service.TeacherService;

@Controller
public class FailReason extends BaseAction{
	@Autowired
	TeacherService teacherService;
	String failReason;
	public String getFailReason() {
		return failReason;
	}
	public void setFailReason(String failReason) {
		this.failReason = failReason;
	}
	public String failReason(){
		Course c = (Course) session.get("course");
		int cid = c.getId();
		String prid = (String)session.get("prid");
		teacherService.addFailReason(Integer.parseInt(prid),failReason);
		return SUCCESS;
	}
}
