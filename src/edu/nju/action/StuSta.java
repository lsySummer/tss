package edu.nju.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.model.ChartModel;
import edu.nju.model.Course;
import edu.nju.service.LoginService;

@Controller
public class StuSta extends BaseAction{
	@Autowired
	LoginService loginService;
	public String execute(){
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		List<String> cnameList = (List<String>) session.get("cnameList");
		List<Course> cList = (List<Course>) session.get("cList");
		List<ArrayList<Integer>> submit=new ArrayList<ArrayList<Integer>>();
		List<ChartModel> chartList = new ArrayList<ChartModel>();
		for(int i=0;i<cList.size();i++){
			int cid = cList.get(i).getId();
			ArrayList<Integer> subNum = loginService.getSubmitNum(cid,m);
			submit.add(subNum);
			ChartModel model = loginService.getChartModel(cid,m);
			chartList.add(model);
		}
		request.setAttribute("cnameList", cnameList);
		request.setAttribute("submit", submit);
		request.setAttribute("chartList", chartList);
		return SUCCESS;
	}
}
