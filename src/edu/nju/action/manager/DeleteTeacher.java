package edu.nju.action.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.service.LoginService;
import edu.nju.service.ManagerService;
@Controller
public class DeleteTeacher extends BaseAction{
	@Autowired
	ManagerService managerService;
	
	@Autowired
	LoginService loginService;
	public String execute() throws ServletException,IOException{
		int id = Integer.parseInt(request.getParameter("tId"));
		managerService.deleteTea(id);
		List<Student> stu = loginService.getStudent();
		request.setAttribute("stuList", stu);
		List<Teacher> tea = loginService.getTeacher();
		request.setAttribute("teaList", tea);
		request.setAttribute("deleteMessage", "删除成功！");
		return SUCCESS;
	}
}
