package edu.nju.action.manager;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Student;
import edu.nju.service.ManagerService;

@Controller
public class SearchStu extends BaseAction{
	@Autowired
	ManagerService managerService;
	public String execute() throws ServletException,IOException{
		String num = request.getParameter("search");
		Student stu =managerService.search(num);
		return SUCCESS;
	}
}
