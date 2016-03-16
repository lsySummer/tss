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
public class LoginAction extends BaseAction{
	
	@Autowired
	private LoginService loginService; 
	
	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private StudentService studentService;
	
	public String execute() throws ServletException,IOException{
		String username =(String) request.getParameter("username");
		session.put("username", username);
		String password = (String) request.getParameter("password");
		request.setAttribute("username", username);
		Login result = loginService.login(username,password);
		if(result.equals(Login.MANAGER)){
			List<Student> stu = loginService.getStudent();
			request.setAttribute("stuList", stu);
			session.put("stuList", stu);
			List<Teacher> tea = loginService.getTeacher();
			ArrayList<String> tname = new ArrayList<String>();
			for(int i=0;i<tea.size();i++){
				tname.add(tea.get(i).getUsername());
			}
			session.put("tname", tname);
			request.setAttribute("tname", tname);
			request.setAttribute("teaList", tea);
			session.put("teaList", tea);
			List<Term> term = loginService.getTerm();
			session.put("termList", term);
			request.setAttribute("termList",term);
			List<Course> cList = loginService.getCourse();
			session.put("courseList", cList);
			request.setAttribute("termSelect", "0");
			request.setAttribute("courseList", cList);
		}else if(result.equals(Login.TEACHER)){
			ArrayList<List<Course>> carr=new ArrayList<List<Course>>();
			List<Term> termList = loginService.getNowTerm();
			request.setAttribute("termList",termList);
			session.put("termList", termList);
			Teacher s =loginService.getTuser(username);
			String id = loginService.getUserid(username,0);
			session.put("userid", id);
			request.setAttribute("tuser", s);
			session.put("tuser", s);
			for(int i=0;i<termList.size();i++){
				String term = termList.get(i).getCterm();
				List<Course> clist=teacherService.getCoursebyterm(username, term);
				carr.add(clist);
			}
			request.setAttribute("carr", carr);
			session.put("carr", carr);
 		}else if(result.equals(Login.FAIL)){
 			request.setAttribute("error", "用户名或密码错误");
 		}else if(result.equals(Login.STUDENT)){
 			ArrayList<List<Course>> carr=new ArrayList<List<Course>>();
			List<Term> termList = loginService.getNowTerm();
			request.setAttribute("termList",termList);
			Student s =loginService.getSuser(username);
			session.put("suser", s);
			String id = loginService.getUserid(username,1);
			request.setAttribute("suser", s);
			session.put("userid", id);
			session.put("termList", termList);
			for(int i=0;i<termList.size();i++){
				String term = termList.get(i).getCterm();
				List<Course> clist=studentService.getCoursebyterm(username, term);
				carr.add(clist);
			}
			request.setAttribute("carr", carr);
			session.put("carr", carr);
 		}
		return result.toString();
	}
}
