package edu.nju.action.manager;

import java.io.IOException;

import javax.servlet.ServletException;

import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;

@Controller
public class JumpTeaching  extends BaseAction{
	
	public String execute() throws ServletException,IOException{
	
		return SUCCESS;
	}
}
