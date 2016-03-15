package edu.nju.action.teacher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Course;
import edu.nju.service.TeacherService;

@Controller
public class SaveInfo extends BaseAction {
	@Autowired
	TeacherService teacherService;
	private String courseInfo;
	private String refer;
	private String cid;
	
	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCourseInfo() {
		return courseInfo;
	}

	public void setCourseInfo(String courseInfo) {
		this.courseInfo = courseInfo;
	}

	public String getRefer() {
		return refer;
	}

	public void setRefer(String refer) {
		this.refer = refer;
	}

	public String saveInfo(){
		Course c =teacherService.addCourseInfo(cid,courseInfo,refer);
		session.put("course", c);
		return SUCCESS;
	}
}
