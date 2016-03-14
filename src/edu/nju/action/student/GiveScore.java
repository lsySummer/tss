package edu.nju.action.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Chowok;
import edu.nju.model.Showok;
import edu.nju.service.StudentService;

@Controller
public class GiveScore extends BaseAction{

	@Autowired
	StudentService studentService;
	public String giveScore(){
		String prid = request.getParameter("prid");
		List<Showok> asList = studentService.getAssistantShowok(Integer.parseInt(prid));
		request.setAttribute("asList", asList);
		session.put("asList", asList);
		session.put("asPrid", prid);
		Chowok ch = studentService.getAsChowok(Integer.parseInt(prid));
		request.setAttribute("asChowok", ch);
		session.put("asChowok", ch);
		setRequest();
		return SUCCESS;
	}
	
	public String sendScore(){
		setRequest();
		List<Showok> asList = (List<Showok>) session.get("asList");
		String prid = (String)session.get("asPrid");
		for(int i=0;i<asList.size();i++){
			String sid = asList.get(i).getSid();
			String sname = "score"+i;
			String rname="review"+i;
			String score = request.getParameter(sname);
			String review = request.getParameter(rname);
			studentService.sendToTeacher(Integer.parseInt(prid),sid,score,review);
			System.out.println(sid+" "+"score"+score+"review"+review);
		}
		asList = studentService.getAssistantShowok(Integer.parseInt(prid));
		Chowok ch = studentService.getAsChowok(Integer.parseInt(prid));
		request.setAttribute("asChowok", ch);
		request.setAttribute("asList", asList);
		request.setAttribute("tipMessage", "已发送！"); 
		return SUCCESS;
	}
	
	public void setRequest(){
		request.setAttribute("termList", session.get("termList"));
		request.setAttribute("carr", session.get("carr"));
		request.setAttribute("username", session.get("username"));
		request.setAttribute("course", session.get("course"));
	}
}
