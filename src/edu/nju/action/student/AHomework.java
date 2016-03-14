package edu.nju.action.student;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.service.StudentService;
import edu.nju.service.TeacherService;

@Controller
public class AHomework extends BaseAction {

	@Autowired
	StudentService studentService;

	@Autowired
	TeacherService teacherService;

	public String execute() {
		int id = Integer.parseInt(request.getParameter("hiddenCourseId"));
		Course c = teacherService.getCourse(id);
		request.setAttribute("course", c);
		session.put("course", c);
		request.setAttribute("username", session.get("username"));
		List<Chowok> aschList = studentService.getChowokList(c.getId());
		request.setAttribute("aschList", aschList);
		String path = ServletActionContext.getRequest().getRealPath("/homework");
		File file = new File(path);
		String[] fileName = file.list();
		ArrayList<String> arr = new ArrayList<String>();
		System.out.println(fileName.length);
		for(int i=0;i<fileName.length;i++){
			String names[] = fileName[i].split("_");
			String fname = names[0];
			if(fname.equals(c.getId()+"")){
				arr.add(fileName[i]);
				System.out.println(fileName[i]);
			}
		}
		request.setAttribute("fileName", arr);
		request.setAttribute("suser", session.get("suser"));
		session.put("fileName", arr);
		return SUCCESS;
	}
}
