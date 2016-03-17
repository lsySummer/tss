package edu.nju.dao.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.dao.BaseDao;
import edu.nju.dao.LoginDao;
import edu.nju.model.ChartModel;
import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.model.Login;
import edu.nju.model.Showok;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.model.Term;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	private BaseDao baseDao;

	@Override
	public Login login(String username, String password) {
		if (username.equals("0") && password.equals("0")) {
			return Login.MANAGER;
		}
		if (username.equals("1") && password.equals("1")) {
			return Login.CHARGE;
		}
		String str = "from Student s where s.username=? and s.password=?";
		List result = baseDao.login(str, username, password);
		if (result.size() != 0) {
			return Login.STUDENT;
		}
		str = "from Teacher s where s.username=? and s.password=?";
		result = baseDao.login(str, username, password);
		if (result.size() != 0) {
			return Login.TEACHER;
		}
		return Login.FAIL;
	}

	@Override
	public List<Student> getStudent() {
		return baseDao.getAllList(Student.class);
	}

	@Override
	public List<Teacher> getTeacher() {
		return baseDao.getAllList(Teacher.class);
	}

	@Override
	public List<Term> getTerm() {
		return baseDao.getAllList(Term.class);
	}

	@Override
	public List<Course> getCourse() {
		return baseDao.getAllList(Course.class);
	}

	@Override
	public String getUserid(String username, int i) {
		if (i == 0) {// teacher
			String str = "from Teacher s where s.username='" + username + "'";
			List<Teacher> list = baseDao.find(str);
			return list.get(0).getNum();
		} else {// student
			String str = "from Student s where s.username='" + username + "'";
			List<Student> list = baseDao.find(str);
			return list.get(0).getNum();
		}
	}

	@Override
	public Teacher getTuser(String username) {
		String str = "from Teacher s where s.username='" + username + "'";
		List<Teacher> list = baseDao.find(str);
		return list.get(0);
	}

	@Override
	public Student getSuser(String username) {
		String str = "from Student s where s.username='" + username + "'";
		List<Student> list = baseDao.find(str);
		return list.get(0);
	}

	@Override
	public Student updateSinfo(String id, String sex, String mail, String phone, String birth) {
		Student s = (Student) baseDao.load(Student.class, Integer.parseInt(id));
		s.setMail(mail);
		s.setSex(sex);
		s.setPhone(phone);
		s.setBirth(birth);
		baseDao.update(s);
		return s;
	}

	@Override
	public Teacher updateTinfo(String id, String sex, String mail, String phone, String birth) {
		Teacher s = (Teacher) baseDao.load(Teacher.class, Integer.parseInt(id));
		s.setMail(mail);
		s.setSex(sex);
		s.setPhone(phone);
		s.setBirth(birth);
		baseDao.update(s);
		return s;
	}

	@Override
	public Teacher insertPor(int id, String path) {
		Teacher t = (Teacher) baseDao.load(Teacher.class, id);
		t.setHpath(path);
		baseDao.update(t);
		return t;
	}

	@Override
	public Student sinsertPor(int id, String path) {
		Student t = (Student) baseDao.load(Student.class, id);
		t.setHpath(path);
		baseDao.update(t);
		return t;
	}

	@Override
	public List<Chowok> getChowokList(int cid) {
		String str = "from Chowok s where s.cid=" + cid;
		List<Chowok> list = baseDao.find(str);
		return list;
	}

	@Override
	public Teacher getSeeTeacher(int cid) {
		Course c = (Course) baseDao.load(Course.class, cid);
		String tname = c.getTname();
		String str = "from Teacher s where s.username='" + tname + "'";
		List<Teacher> list = baseDao.find(str);
		return list.get(0);
	}

	@Override
	public Student getSeeStudent(int cid) {
		Course c = (Course) baseDao.load(Course.class, cid);
		String aname = c.getAname();
		String str = "from Student s where s.username='" + aname + "'";
		List<Student> list = baseDao.find(str);
		return list.get(0);
	}

	@Override
	public List<Term> getNowTerm() {
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		String signal = "";
		if (m >= 8 && m <= 12) {
			signal = y + " " + "Autumn";
		} else if (m < 8 && m >= 2) {
			signal = y + " " + "Spring";
		} else {
			signal = (y - 1) + "Autumn";
		}
		System.out.println(signal);
		List<Term> tList = baseDao.getAllList(Term.class);
		List<Term> nowList = new ArrayList<Term>();
		boolean s = false;
		for (int i = 0; i < tList.size(); i++) {
			String term = tList.get(i).getCterm();
			if (term.equals(signal) || s) {
				nowList.add(tList.get(i));
				s = true;
			}
		}
		return nowList;
	}

	@Override
	public List<Course> getCourseByMonth(int y,int m) {
	
		List<Course> cList = getCourse();
		List<Course> result = new ArrayList<Course>();
		for (int i = 0; i < cList.size(); i++) {
			Course c = cList.get(i);
			String startdate=c.getStartDate();
			String s[]=startdate.split(" ");
			String smonth=s[1];
			String syear=s[0];
			String enddate=c.getEndDate();
			s=enddate.split(" ");
			String emonth=s[1];
			if(Integer.parseInt(syear)==y&&m>=Integer.parseInt(smonth)&&m<=Integer.parseInt(emonth)){
				result.add(c);
				System.out.println(c.getCname());
			}
		}
		return result;
	}

	public String todayDate() {
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		int d = cal.get(Calendar.DATE);
		String year = y + "";
		String month = m + "";
		String date = d + "";
		if (m < 10) {
			month = "0" + m;
		}
		if (d < 10) {
			date = "0" + date;
		}
		String todayStr = year + " " + month + " " + date;
		return todayStr;
	}

	@Override
	public int gethwNum(int cid,int month) {
		String str = "from Chowok s where s.cid=" + cid+" and s.month="+month;
		List<Chowok> list = baseDao.find(str);
		return list.size();
	}

	@Override
	public int getAveScore(int cid,int month) {
		String str = "from Chowok s where s.cid=" + cid+" and s.month="+month;
		List<Chowok> list = baseDao.find(str);
		List<Integer> hidList=new ArrayList<Integer>();
		List<Integer> scoreList=new ArrayList<Integer>(); 
		int average=0;
		int sum=0;
		if(list.size()==0){return 0;}
		for(int i=0;i<list.size();i++){
			int hid=list.get(i).getId();
			hidList.add(hid);
			String str1 = "from Showok s where s.hid=" + hid;
			List<Showok> list1 = baseDao.find(str1);
			for(int j=0;j<list1.size();j++){
//				if(list1.get(j).getHpath()==""){
//				}else{
					int score = list1.get(j).getpScore();
					scoreList.add(score);
//				}
			}
		}
		for(int i=0;i<scoreList.size();i++){
			sum=sum+scoreList.get(i);
		}
		average=sum/scoreList.size();
		return average;
	}

	@Override
	public float getPass(int cid,int month) {
		String str = "from Chowok s where s.cid=" + cid+" and s.month="+month;
		List<Chowok> list = baseDao.find(str);
		if(list.size()==0){return 0;}
		int fTime=0;
		for(int i=0;i<list.size();i++){
			int failTime=list.get(i).getFailTime();
			fTime=fTime+failTime;
		}
		float f=(float)fTime/(list.size()+fTime);
		return (1-f)*100;
	}

	@Override
	public float getOntime(int cid,int month) {
		String str = "from Chowok s where s.cid=" + cid+" and s.month="+month;
		List<Chowok> list = baseDao.find(str);
		int onTime = 0;
		if(list.size()==0){return 0;}
		for(int i=0;i<list.size();i++){
			int ifOntime=list.get(i).getIfOntime();
			if(ifOntime==1){
				onTime++;
			}
		}
		float per = (float)onTime/list.size();
		return per*100;
	}

	@Override
	public ArrayList<Integer> getSubmitNum(int cid, int month) {
		String str = "from Chowok s where s.cid=" + cid+" and s.month="+month;
		List<Chowok> list = baseDao.find(str);
		ArrayList<Integer> result=new ArrayList<Integer>();
		for(int i=0;i<list.size();i++){
			int num=0;
			int id=list.get(i).getId();
			String str2 = "from Showok s where s.hid=" + id;
			List<Showok> slist = baseDao.find(str2);
			for(int j=0;j<slist.size();j++){
				int s = slist.get(j).getState();
				if(s==1){
					num++;
				}
			}
			result.add(num);
		}
		return result;
	}

	@Override
	public ChartModel getChartModel(int cid, int month) {
		String str = "from Chowok s where s.cid=" + cid+" and s.month="+month;
		List<Chowok> list = baseDao.find(str);
		int l1=0,l2=0,l3=0,l4=0,l5=0;
		ChartModel cm=new ChartModel();
		for(int i=0;i<list.size();i++){
			Chowok ch = list.get(i);
			int id=ch.getId();
			String str1 = "from Showok s where s.hid=" + id;
			List<Showok> list1 = baseDao.find(str1);
			for(int j=0;j<list1.size();j++){
				int score=list1.get(j).getpScore();
				if(score<60){
					l1++;
				}else if(score>=60&&score<=69){
					l2++;
				}else if(score>=70&&score<=79){
					l3++;
				}else if(score>=80&&score<=89){
					l4++;
				}else if(score>=90){
					l5++;
				}
			}
		}
		System.out.println("hhh"+l1+" "+l2+" "+l3+" "+l4+" "+l5);
		cm.setL1(l1);
		cm.setL2(l2);
		cm.setL3(l3);
		cm.setL4(l4);
		cm.setL5(l5);
		return cm;
	}

}
