package edu.nju.action.teacher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Chowok;
import edu.nju.service.TeacherService;

@Controller
public class AddHomework extends BaseAction {
	@Autowired
	TeacherService teacherService;
	
	private String acid;
	private String ahid;
	private String ascore;
	private String adif;
	private String asddl;
	private String aaddl;
	private String aformat;
	private String ainfo;
	

	public String addHomework(){
		ahid=request.getParameter("ahid");
		acid = request.getParameter("acid");
		ascore=request.getParameter("ascore");
		adif = request.getParameter("adif");
		asddl=request.getParameter("asddl");
		aaddl = request.getParameter("aaddl");
		aformat=request.getParameter("aformat");
		ainfo = request.getParameter("ainfo");
		System.out.println("ainfo"+ainfo);
		Chowok ch = new Chowok();
		ch.setAddl(aaddl);
		ch.setSddl(asddl);
		ch.setCid(Integer.parseInt(acid));
		ch.setInfo(ainfo);
		ch.setDif(Integer.parseInt(adif));
		ch.setScore(Integer.parseInt(ascore));
		ch.setFormat(aformat);
		ch.setHid(Integer.parseInt(ahid));
		teacherService.addHomework(ch);
		return SUCCESS;
	}
}
