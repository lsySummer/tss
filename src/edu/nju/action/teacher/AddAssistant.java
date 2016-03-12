package edu.nju.action.teacher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.service.TeacherService;
@Controller
public class AddAssistant extends BaseAction{
	@Autowired
	TeacherService teacherService;
	private String sname;
	private String cid;
	private String sid;
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	
	public String addAssis(){
		System.out.println(sid+"sid"+sname+"sname");
		if(!teacherService.checkAssistant(cid,sid)){return "fail";};
		teacherService.addAssistant(cid,sname);
		return SUCCESS;
	}

}
