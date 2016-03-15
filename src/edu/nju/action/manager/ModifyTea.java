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
public class ModifyTea   extends BaseAction{
	@Autowired
	ManagerService managerService;
	@Autowired
	LoginService loginService;
	public String execute() throws ServletException,IOException{
		int id = Integer.parseInt(request.getParameter("tid"));
		String num = request.getParameter("tnum");
		String username = request.getParameter("tname");
		String password = request.getParameter("tpass");
		managerService.tmodify(id, username, password, num);
		List<Student> stu = loginService.getStudent();
		request.setAttribute("stuList", stu);
		List<Teacher> tea = loginService.getTeacher();
		request.setAttribute("teaList", tea);
		request.setAttribute("modifyMessage", "修改成功！");
		return SUCCESS; 
	}
}
