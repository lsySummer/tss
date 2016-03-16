package edu.nju.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.dao.LoginDao;
import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.model.Login;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.model.Term;
import edu.nju.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	LoginDao loginDao;
	
	@Override
	public Login login(String username, String password) {
		return loginDao.login(username, password);
	}

	@Override
	public List<Student> getStudent() {
		return loginDao.getStudent();
	}

	@Override
	public List<Teacher> getTeacher() {
		return loginDao.getTeacher();
	}

	@Override
	public List<Term> getTerm() {
		return loginDao.getTerm();
	}

	@Override
	public List<Course> getCourse() {
		return loginDao.getCourse();
	}

	@Override
	public String getUserid(String username, int i) {
		return loginDao.getUserid(username, i);
	}

	@Override
	public Teacher getTuser(String username) {
		return loginDao.getTuser(username);
	}

	@Override
	public Student getSuser(String username) {
		return loginDao.getSuser(username);
	}

	@Override
	public Student updateSinfo(String id, String sex, String mail, String phone, String birth) {
		return loginDao.updateSinfo(id, sex, mail, phone, birth);
	}

	@Override
	public Teacher updateTinfo(String id, String sex, String mail, String phone, String birth) {
		return loginDao.updateTinfo(id, sex, mail, phone, birth);
	}

	@Override
	public Teacher insertPor(int id,String path) {
		return loginDao.insertPor(id,path);
	}

	@Override
	public Student sinsertPor(int id, String path) {
		return loginDao.sinsertPor(id, path);
	}

	@Override
	public List<Chowok> getChowokList(int cid) {
		return loginDao.getChowokList(cid);
	}

	@Override
	public Teacher getSeeTeacher(int cid) {
		return loginDao.getSeeTeacher(cid);
	}

	@Override
	public Student getSeeStudent(int cid) {
		return loginDao.getSeeStudent(cid);
	}

	@Override
	public List<Term> getNowTerm() {
		return loginDao.getNowTerm();
	}

}
