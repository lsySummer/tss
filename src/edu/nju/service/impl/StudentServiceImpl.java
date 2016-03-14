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
	public List<Showok> getShowokList(String sid) {
		return studentDao.getShowokList(sid);
	}

	@Override
	public List<Cselect> getSelectSid(int cid) {
		return studentDao.getSelectSid(cid);
	}

}
