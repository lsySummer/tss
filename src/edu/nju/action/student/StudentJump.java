package edu.nju.action.student;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.model.Cselect;
import edu.nju.model.Showok;
import edu.nju.service.StudentService;

@Controller
public class StudentJump extends BaseAction{

	@Autowired
	StudentService studentService;
	public String execute(){
		setRequest();
		return SUCCESS;
	}
	
	public String jumpToHomework(){
		setRequest();
		String username = (String) session.get("username");
		String sid = studentService.getStudent(username).getNum();
		request.setAttribute("userId", sid);
		List<Showok> showokList = studentService.getShowokList(sid);
		request.setAttribute("showokList", showokList);
		Course c = (Course)session.get("course");
		List<Chowok> hlist = studentService.getChowokList(c.getId());
		request.setAttribute("hlist", hlist);
		session.put("hlist", hlist);
		int leftHw=0;
		Calendar cal=Calendar.getInstance();    
		int y=cal.get(Calendar.YEAR);    
		int m=cal.get(Calendar.MONTH)+1;    
		int d=cal.get(Calendar.DATE); 
		String year=y+"";
		String month=m+"";
		String date=d+"";
		if(m<10){
			month="0"+m;
		}
		if(d<10){
			date="0"+date;
		}
		String todayStr=year+" "+month+" "+date;
		for(int i=0;i<hlist.size();i++){
			String sddl = hlist.get(i).getSddl();
			System.out.println(sddl);
			if(sddl.compareTo(todayStr)>0){
				leftHw++;
			}
		}
		request.setAttribute("leftHw", leftHw);
		session.put("hlist", hlist);
		return SUCCESS;
	}
	
	public String jumpToComment(){
		setRequest();
		Course c = (Course)session.get("course");
		List<Chowok> hlist = studentService.getChowokList(c.getId());
		request.setAttribute("hlist", hlist);
		return SUCCESS;
	}
	
	public String jumpToInfo(){
		setRequest();
		return SUCCESS;
	}
	
	public String jumpScore(){
		setRequest();
		Course c = (Course)session.get("course");
		List<Chowok> hlist = studentService.getChowokList(c.getId());
		request.setAttribute("hlist", hlist);
		List<Cselect> selectSidList = studentService.getSelectSid(c.getId());
		request.setAttribute("selectSidList", selectSidList);
		return SUCCESS;
	}
	
	public String jumpDownload(){
		setRequest();
		return SUCCESS;
	}
	
	public void setRequest(){
		request.setAttribute("termList", session.get("termList"));
		request.setAttribute("carr", session.get("carr"));
		request.setAttribute("username", session.get("username"));
		request.setAttribute("course", session.get("course"));
	}
}
