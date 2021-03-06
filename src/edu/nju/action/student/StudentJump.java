package edu.nju.action.student;

import java.util.ArrayList;
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
		Course c = (Course)session.get("course");
		ArrayList<Showok> showokList = new ArrayList<Showok>();
		List<Chowok> hlist = studentService.getChowokList(c.getId());//根据课程id获得其所有作业
		for(int i=0;i<hlist.size();i++){
			int hid = hlist.get(i).getId();
			Showok showok= studentService.getShowokList(sid,hid);//根据学生id和作业id获得作业
			showokList.add(showok);
		}
		request.setAttribute("showokList", showokList);
		request.setAttribute("hlist", hlist);
		session.put("hlist", hlist);
		int leftHw=0;
		String todayStr=todayDate();
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
	
	public String todayDate(){
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
		return todayStr;
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
		session.put("selectSidList", selectSidList);
		int leftHw=0;
		int leftAs = 0;
		String todayStr=todayDate();
		for(int i=0;i<hlist.size();i++){
			String sddl = hlist.get(i).getSddl();
			String addl = hlist.get(i).getAddl();
			System.out.println(sddl);
			if(sddl.compareTo(todayStr)>0){
				leftHw++;
			}
			if(addl.compareTo(todayStr)>0){
				leftAs++;
			}
		}
		request.setAttribute("leftHw", leftHw);
		request.setAttribute("leftAs", leftAs);
		return SUCCESS;
	}
	
	public String jumpDownload(){
		setRequest();
		request.setAttribute("fileName", session.get("fileName"));
		return SUCCESS;
	}
	
	public void setRequest(){
		request.setAttribute("suser", session.get("suser"));
		request.setAttribute("termList", session.get("termList"));
		request.setAttribute("carr", session.get("carr"));
		request.setAttribute("username", session.get("username"));
		request.setAttribute("course", session.get("course"));
	}
}
