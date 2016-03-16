package edu.nju.dao.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.dao.BaseDao;
import edu.nju.dao.LoginDao;
import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.model.Login;
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
	public Teacher insertPor(int id,String path) {
		Teacher t = (Teacher)baseDao.load(Teacher.class, id);
		t.setHpath(path);
		baseDao.update(t);
		return t;
	}

	@Override
	public Student sinsertPor(int id, String path) {
		Student t = (Student)baseDao.load(Student.class, id);
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
		String tname=c.getTname();
		String str = "from Teacher s where s.username='" + tname+"'";
		List<Teacher> list = baseDao.find(str);
		return list.get(0);
	}

	@Override
	public Student getSeeStudent(int cid) {
		Course c = (Course) baseDao.load(Course.class, cid);
		String aname=c.getAname();
		String str = "from Student s where s.username='" + aname+"'";
		List<Student> list = baseDao.find(str);
		return list.get(0);
	}

	@Override
	public List<Term> getNowTerm() {
		Calendar cal=Calendar.getInstance();    
		int y=cal.get(Calendar.YEAR);    
		int m=cal.get(Calendar.MONTH)+1;    
		String signal="";
		if(m>=8&&m<=12){
			signal=y+" "+"Autumn";
		}else if(m<8&&m>=2){
			signal=y+" "+"Spring";
		}else{
			signal=(y-1)+"Autumn";
		}
		System.out.println(signal);
		List<Term> tList = baseDao.getAllList(Term.class);
		List<Term> nowList = new ArrayList<Term>();
		boolean s = false;
		for(int i=0;i<tList.size();i++){
			String term=tList.get(i).getCterm();
			if(term.equals(signal)||s){
				nowList.add(tList.get(i));
				s=true;
			}
		}
		return nowList;
	}
	

}
