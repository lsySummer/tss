package edu.nju.action.teacher;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Cselect;
import edu.nju.model.Student;
import edu.nju.service.TeacherService;

@Controller
public class AddSelect extends BaseAction{

	@Autowired
	TeacherService teacherService;
	private String cid;
	private String selectName;
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getSelectName() {
		return selectName;
	}
	public void setSelectName(String selectName) {
		this.selectName = selectName;
	}
	public String addSelect(){
		Student s = teacherService.getStudent(selectName);
		if(s==null){return "fail";}
		teacherService.addSelect(selectName,cid);
		List<Cselect> sidList = teacherService.getSelect(Integer.parseInt(cid));
		request.setAttribute("sidList", sidList);
		return SUCCESS;
	}
}
