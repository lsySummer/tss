package edu.nju.action.manager;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.service.ManagerService;

@Controller
public class RegisterAction extends BaseAction{

@Autowired
ManagerService managerService;
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
		return managerService.regStu(stu);
	}else{
		Teacher stu = new Teacher();
		stu.setNum(num);
		stu.setPassword(password);
		stu.setUsername(username);
		return managerService.regTch(stu);
	}

}

}
