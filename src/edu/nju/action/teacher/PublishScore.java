package edu.nju.action.teacher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Course;
import edu.nju.service.TeacherService;

@Controller
public class PublishScore extends BaseAction{
	@Autowired
	TeacherService teacherService;
	private String review;
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String publishScore(){
		Course c = (Course) session.get("course");
		int cid = c.getId();
		String prid = (String)session.get("prid");
		teacherService.addReview(Integer.parseInt(prid),review);
		return SUCCESS;
	}
}
