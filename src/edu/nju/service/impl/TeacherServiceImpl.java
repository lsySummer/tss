package edu.nju.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.dao.TeacherDao;
import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.model.Cselect;
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
	public Course getTeacher(int id) {
		return teacherDao.getTeacher(id);
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
	public String addCourseInfo(String cid, String courseInfo, String refer) {
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
}
