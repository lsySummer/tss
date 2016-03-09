package edu.nju.action.manager;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.sql.Date;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Course;
import edu.nju.service.LoginService;
import edu.nju.service.ManagerService;

@Controller
public class AddCourse extends BaseAction{

	@Autowired
	ManagerService managerService;
	
	@Autowired
	private LoginService loginService; 
	public String execute() throws ServletException,IOException{
		String cid = request.getParameter("cid");
		String cname = request.getParameter("cname");
		String term = request.getParameter("term");
		String tname = request.getParameter("teacher");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		Course c = new Course();
		c.setCid(cid);
		c.setCname(cname);
		c.setTerm(term);
		c.setStartDate(beginDate);
		c.setEndDate(endDate);
		c.settname(tname);
		managerService.addCourse(c);
		request.setAttribute("courseMessage", "添加成功！"); 
		request.setAttribute("termList", session.get("termList"));
		List<Course> cList = loginService.getCourse();
		request.setAttribute("courseList", cList);
		request.setAttribute("tname", session.get("tname"));
		request.setAttribute("teaList", session.get("teaList"));
		
		return SUCCESS;
	}
	
	public String deleteCourse(){
		int id = Integer.parseInt(request.getParameter("courseId"));
		request.setAttribute("termList", session.get("termList"));
		request.setAttribute("teaList", session.get("teaList"));
		request.setAttribute("tname", session.get("tname"));
		managerService.deleteCourse(id);
		request.setAttribute("deleteMessage", "删除成功！"); 
		List<Course> cList = loginService.getCourse();
		request.setAttribute("courseList", cList);
		return SUCCESS;
	}
	
	public String modifyCourse(){
		int id = Integer.parseInt(request.getParameter("mid"));
		String cname = request.getParameter("mcname");
		String tname = request.getParameter("mteacher");
		String beginDate = request.getParameter("mbeginDate");
		String endDate = request.getParameter("mendDate");
		managerService.modifyCourse(id,cname, tname, beginDate, endDate);
		request.setAttribute("modifyMessage", "修改成功！"); 
		request.setAttribute("termList", session.get("termList"));
		List<Course> cList = loginService.getCourse();
		request.setAttribute("courseList", cList);
		request.setAttribute("tname", session.get("tname"));
		request.setAttribute("teaList", session.get("teaList"));
		
		return SUCCESS;
	}
	
	public String byTerm(){
		String term=request.getParameter("termSelect");
		List<Course> courseList = null;
		if(term.equals("0")){
			courseList= loginService.getCourse();
		}else{
		courseList = managerService.getCourse(term);
		}
		request.setAttribute("termSelect", term);
		request.setAttribute("courseList", courseList);
		request.setAttribute("termList", session.get("termList"));
		request.setAttribute("tname", session.get("tname"));
		request.setAttribute("teaList", session.get("teaList"));
		return SUCCESS;
	}
}
