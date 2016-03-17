package edu.nju.action;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.model.Course;
import edu.nju.service.LoginService;

@Controller
public class SelectMonth extends BaseAction {

	@Autowired
	LoginService loginService;

	public String execute() {
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		String month = request.getParameter("sMonth");
		System.out.println("month" + month);
		request.setAttribute("monSelect", month);
		int m = Integer.parseInt(month);
		List<Course> cList = loginService.getCourseByMonth(y, m);
		request.setAttribute("cList", cList);
		List<String> cnameList = new ArrayList<String>();
		List<Integer> hwNumList = new ArrayList<Integer>();
		List<Integer> aveScoreList = new ArrayList<Integer>();
		List<Float> passList = new ArrayList<Float>();
		List<Float> onTimeList = new ArrayList<Float>();
		List<Integer> submitNum = new ArrayList<Integer>();
		for (int i = 0; i < cList.size(); i++) {
			Course c = cList.get(i);
			cnameList.add(c.getCname());
			int hwNum = loginService.gethwNum(c.getId(), m);
			hwNumList.add(hwNum);
			int averScore = loginService.getAveScore(c.getId(), m);// 平均分
			aveScoreList.add(averScore);
			float pass = loginService.getPass(c.getId(), m);// 通过率
			DecimalFormat fnum = new DecimalFormat("##0.00");
			String dd = fnum.format(pass);
			passList.add(Float.parseFloat(dd));
			float onTime = loginService.getOntime(c.getId(), m);// 准时提交率
			String onPer = fnum.format(onTime);
			System.out.println("float" + Float.parseFloat(onPer));
			onTimeList.add(Float.parseFloat(onPer));
		}
		request.setAttribute("cnameList", cnameList);
		request.setAttribute("hwNumList", hwNumList);
		request.setAttribute("aveScoreList", aveScoreList);
		request.setAttribute("passList", passList);
		request.setAttribute("onTimeList", onTimeList);
		return SUCCESS;
	}
}
