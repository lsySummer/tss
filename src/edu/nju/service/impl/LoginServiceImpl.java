package edu.nju.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.dao.LoginDao;
import edu.nju.model.ChartModel;
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

	@Override
	public List<Course> getCourseByMonth(int y,int m) {
		return loginDao.getCourseByMonth(y,m);
	}

	@Override
	public int gethwNum(int cid,int month) {
		return loginDao.gethwNum(cid,month);
	}

	@Override
	public int getAveScore(int cid,int month) {
		return loginDao.getAveScore(cid,month);
	}

	@Override
	public float getPass(int cid,int month) {
		return loginDao.getPass(cid,month);
	}

	@Override
	public float getOntime(int cid,int month) {
		return loginDao.getOntime(cid,month);
	}

	@Override
	public ArrayList<Integer> getSubmitNum(int cid, int month) {
		return loginDao.getSubmitNum(cid, month);
	}

	@Override
	public ChartModel getChartModel(int cid, int month) {
		return loginDao.getChartModel(cid, month);
	}

}
