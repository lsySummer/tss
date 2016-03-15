package edu.nju.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.dao.TeacherDao;
import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.model.Cselect;
import edu.nju.model.Showok;
import edu.nju.model.Student;
import edu.nju.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService{
	@Autowired
	TeacherDao teacherDao;

	@Override
	public List<Course> getCoursebyterm(String teacher, String term) {
		return teacherDao.getCoursebyterm(teacher,term);
	}

	@Override
	public Course getCourse(int id) {
		return teacherDao.getCourse(id);
	}

	@Override
	public Student getStudent(String id) {
		return teacherDao.getStudent(id);
	}

	@Override
	public String addAssistant(String cid, String sname) {
		return teacherDao.addAssistant(cid,sname);
	}

	@Override
	public Course addCourseInfo(String cid, String courseInfo, String refer) {
		return teacherDao.addCourseInfo(cid, courseInfo, refer);
	}

	@Override
	public List<Cselect> getSelect(int id) {
		return teacherDao.getSelect(id);
	}

	@Override
	public String addSelect(String sid, String cid) {
		return teacherDao.addSelect(sid, cid);
	}

	@Override
	public boolean checkAssistant(String cid, String sid) {
		return teacherDao.checkAssistant(cid, sid);
	}

	@Override
	public List<Chowok> getHomework(int cid) {
		return teacherDao.getHomework(cid);
	}

	@Override
	public String addHomework(Chowok ch) {
		return teacherDao.addHomework(ch);
	}

	@Override
	public String addEgpath(int cid, int shid, String path) {
		return teacherDao.addEgpath(cid, shid, path);
	}

	@Override
	public List<Cselect> getselectList(int cid) {
		return teacherDao.getselectList(cid);
	}

	@Override
	public int addShowok(Chowok ch) {
		return teacherDao.addShowok(ch);
	}

	@Override
	public String insertShowok(String sid, int hid) {
		return teacherDao.insertShowok(sid, hid);
	}

	@Override
	public Showok getOneShowok(String sid, int hid) {
		Showok sh = teacherDao.getOneShowok(sid, hid);
		return sh;
	}

	@Override
	public String addFailReason(int prid,String failReason) {
		return teacherDao.addFailReason(prid,failReason);
	}

	@Override
	public String addReview(int prid, String review) {
		return teacherDao.addReview(prid, review);
	}
}
