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
public class SearchStu extends BaseAction{
	@Autowired
	ManagerService managerService;
	@Autowired
	LoginService loginService;
	public String execute() throws ServletException,IOException{
		String selectBy = request.getParameter("selectBy");
		request.setAttribute("teaList", session.get("teaList"));
		if(selectBy.equals("0")){
			String num = request.getParameter("selectText");
			List<Student> list = managerService.search(num);
			request.setAttribute("stuList", list);
		}else{
			String name=request.getParameter("selectText");
			List<Student> list = managerService.searchByname(name);
			request.setAttribute("stuList", list);
		}
		return SUCCESS;
	}
}
