package edu.nju.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.model.Course;
import edu.nju.model.Login;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.model.Term;
import edu.nju.service.LoginService;
import edu.nju.service.StudentService;
import edu.nju.service.TeacherService;

@Controller
public class InfoAction extends BaseAction{
	
	@Autowired
	private LoginService loginService; 
	
	private String sex;
	private String mail;
	private String phone;
	private String birth;
	private String id;
	

	public String saveInfo(){
		sex = request.getParameter("sex");
		mail = request.getParameter("mail");
		phone = request.getParameter("phone");
		birth = request.getParameter("birth");
		id = request.getParameter("id");
		Student s =loginService.updateSinfo(id,sex,mail,phone,birth);
		request.setAttribute("tipMessage", "已保存！");
		session.put("suser", s);
		return SUCCESS;
	}
	
	public String tsaveInfo(){
		sex = request.getParameter("sex");
		mail = request.getParameter("mail");
		phone = request.getParameter("phone");
		birth = request.getParameter("birth");
		id = request.getParameter("id");
		Teacher t = loginService.updateTinfo(id,sex,mail,phone,birth);
		request.setAttribute("tipMessage", "已保存！");
		session.put("tuser", t);
		return SUCCESS;
	}
}
