package edu.nju.action.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Term;
import edu.nju.service.LoginService;
import edu.nju.service.ManagerService;

@Controller
public class AddTerm extends BaseAction{

	@Autowired
	ManagerService managerService;
	@Autowired
	private LoginService loginService; 
	
	public String execute() throws ServletException,IOException{
		String term = request.getParameter("addt");
		Term t = new Term();
		t.setCterm(term);
		managerService.addTerm(t);
		this.addActionMessage("提交成功！");
		request.setAttribute("tipMessage", "添加成功！"); 
		List<Term> termList = loginService.getTerm();
		session.replace("termList", termList);
		request.setAttribute("termList",termList);
		request.setAttribute("teaList", session.get("teaList"));
		request.setAttribute("courseList", session.get("courseList"));
		request.setAttribute("tname", session.get("tname"));
		return SUCCESS;
	}
}
