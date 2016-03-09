package edu.nju.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.dao.BaseDao;
import edu.nju.dao.LoginDao;
import edu.nju.model.Course;
import edu.nju.model.Login;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.model.Term;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired  
	private BaseDao baseDao;

	
	@Override
	public Login login(String username, String password) {
		if(username.equals("0") && password.equals("0")){
			return Login.MANAGER;
		}
		if(username.equals("1")&&password.equals("1")){
			return Login.CHARGE;
		}
		String str = "from Student s where s.username=? and s.password=?";
		List result = baseDao.login(str,username,password);
		if(result.size()!=0){
			return Login.STUDENT;
		}
		str = "from Teacher s where s.username=? and s.password=?";
		result = baseDao.login(str,username,password);
		if(result.size()!=0){
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

}
