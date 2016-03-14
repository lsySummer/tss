package edu.nju.action.teacher;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Course;
import edu.nju.model.Cselect;
import edu.nju.model.Showok;
import edu.nju.service.TeacherService;

@Controller
public class CheckHw extends BaseAction{
	@Autowired
	TeacherService teacherService;
	public String checkHw(){
		request.setAttribute("username", session.get("username"));
		request.setAttribute("tuser", session.get("tuser"));
		String prid = request.getParameter("prid");
		request.setAttribute("prid", prid);
		session.put("prid", prid);
		Course c = (Course) session.get("course");
		int cid = c.getId();
		request.setAttribute("course", c);
		List<Cselect> selectList = teacherService.getselectList(cid);
		request.setAttribute("selectList", selectList);
		ArrayList<Showok> shList = new ArrayList<Showok>();
		for(int i=0;i<selectList.size();i++){
			String sid = selectList.get(i).getSid();
			Showok sh = teacherService.getOneShowok(sid,Integer.parseInt(prid));
			shList.add(sh);
		}
		request.setAttribute("shList", shList);
		return SUCCESS;
	}
}
