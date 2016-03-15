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
public class RegisterAction extends BaseAction{

@Autowired
ManagerService managerService;

@Autowired
LoginService loginService;
public String execute() throws ServletException,IOException{
	String username =(String) request.getParameter("name");
	String password = (String) request.getParameter("pass");
	String num=(String)request.getParameter("num");
	String identity=(String) request.getParameter("select");
	if(identity.equals("0")){
		Student stu = new Student();
		stu.setNum(num);
		stu.setPassword(password);
		stu.setUsername(username);
		managerService.regStu(stu);
	}else{
		Teacher stu = new Teacher();
		stu.setNum(num);
		stu.setPassword(password);
		stu.setUsername(username);
		managerService.regTch(stu);
	}
	List<Student> stu = loginService.getStudent();
	request.setAttribute("stuList", stu);
	List<Teacher> tea = loginService.getTeacher();
	request.setAttribute("teaList", tea);
	request.setAttribute("addMessage", "添加成功！");
	return SUCCESS;
}

}
