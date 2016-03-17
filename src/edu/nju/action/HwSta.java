package edu.nju.action;

import org.springframework.stereotype.Controller;

import edu.nju.service.LoginService;

@Controller
public class HwSta extends BaseAction{

	LoginService loginService;
	public String execute(){
		return SUCCESS;
	}
}
