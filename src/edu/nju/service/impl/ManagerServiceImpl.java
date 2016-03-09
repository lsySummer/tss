package edu.nju.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.dao.ManagerDao;
import edu.nju.model.Course;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.model.Term;
import edu.nju.service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	ManagerDao managerDao;
	@Override
	public String regStu(Student stu) {
		return managerDao.regStu(stu);
	}

	@Override
	public String regTch(Teacher tea) {
		return managerDao.regTch(tea);
	}

	@Override
	public String deleteStu(int id) {
		return managerDao.deleteStu(id);
	}

	@Override
	public String modify(int id, String uname, String pass, String num) {
		return managerDao.modify(id, uname, pass, num);
	}


	@Override
	public String tmodify(int id, String uname, String pass, String num) {
		return managerDao.tmodify(id, uname, pass, num);
	}

	@Override
	public String deleteTea(int id) {
		return managerDao.deleteTea(id);
	}

	@Override
	public List<Student> search(String num) {
		return managerDao.search(num);
	}

	@Override
	public  List<Student> searchByname(String name) {
		return managerDao.searchByname(name);
	}

	@Override
	public String addTerm(Term term) {
		return managerDao.addTerm(term);
	}

	@Override
	public String addCourse(Course c) {
		return managerDao.addCourse(c);
	}

	@Override
	public String deleteCourse(int id) {
		return managerDao.deleteCourse(id);
	}

	@Override
	public String modifyCourse(int id,String cname, String tname, String startDate, String endData) {
		return managerDao.modifyCourse(id,cname,tname,startDate,endData);
	}

	@Override
	public List<Course> getCourse(String term) {
		return managerDao.getCourse(term);
	}

}
