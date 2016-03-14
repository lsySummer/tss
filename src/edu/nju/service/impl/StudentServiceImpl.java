package edu.nju.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.dao.StudentDao;
import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.model.Cselect;
import edu.nju.model.Showok;
import edu.nju.model.Student;
import edu.nju.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	StudentDao studentDao;
	
	@Override
	public List<Course> getCoursebyterm(String username, String term) {
		return studentDao.getCoursebyterm(username, term);
	}

	@Override
	public List<Chowok> getChowokList(int cid) {
		return studentDao.getChowokList(cid);
	}

	@Override
	public String addShPath(String sid, int shid, String path) {
		return studentDao.addShPath(sid, shid, path);
	}

	@Override
	public Student getStudent(String uname) {
		return studentDao.getStudent(uname);
	}

	@Override
	public Showok getShowokList(String sid,int hid) {
		return studentDao.getShowokList(sid,hid);
	}

	@Override
	public List<Cselect> getSelectSid(int cid) {
		return studentDao.getSelectSid(cid);
	}

	@Override
	public String sendToTeacher(int chid,String sid, String score, String review) {
		return studentDao.sendToTeacher(chid,sid, score, review);
	}

	@Override
	public int getChid(int cid, int hid) {
		return studentDao.getChid(cid, hid);
	}

	@Override
	public List<Showok> getAssistantShowok(int chid) {
		return studentDao.getAssistantShowok(chid);
	}

	@Override
	public Chowok getAsChowok(int prid) {
		return studentDao.getAsChowok(prid);
	}

}
