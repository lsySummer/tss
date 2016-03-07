package edu.nju.action.manager;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.service.ManagerService;
@Controller
public class ModifyTea   extends BaseAction{
	@Autowired
	ManagerService managerService;
	public String execute() throws ServletException,IOException{
		int id = Integer.parseInt(request.getParameter("tid"));
		String num = request.getParameter("tnum");
		String username = request.getParameter("tname");
		String password = request.getParameter("tpass");
		return managerService.tmodify(id, username, password, num);
	}
}
