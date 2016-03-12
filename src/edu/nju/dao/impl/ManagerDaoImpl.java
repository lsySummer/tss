package edu.nju.dao.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.dao.BaseDao;
import edu.nju.dao.ManagerDao;
import edu.nju.model.Course;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.model.Term;

@Repository
public class ManagerDaoImpl implements ManagerDao {

	@Autowired
	private BaseDao baseDao;

	@Override
	public String regStu(Student stu) {
		String snum = stu.getNum();
		String sqlStr = "from Student s where s.num=" + snum;
		List list = baseDao.find(sqlStr);
		if (list.size() != 0) {
			System.out.println("find");
			return "FAIL";
		} else {
			baseDao.save(stu);
			return "SUCCESS";
		}

	}

	@Override
	public String regTch(Teacher tea) {
		baseDao.save(tea);
		return "SUCCESS";
	}

	@Override
	public String deleteStu(int id) {
		baseDao.delete(Student.class, id);
		return "success";
	}

	@Override
	public String modify(int id, String uname, String pass, String num) {
		Student s = (Student) baseDao.load(Student.class, id);
		s.setNum(num);
		s.setPassword(pass);
		s.setUsername(uname);
		baseDao.update(s);
		return "success";
	}


	@Override
	public String tmodify(int id, String uname, String pass, String num) {
		Teacher s = (Teacher) baseDao.load(Teacher.class, id);
		s.setNum(num);
		s.setPassword(pass);
		s.setUsername(uname);
		baseDao.update(s);
		return "success";
	}

	@Override
	public String deleteTea(int id) {
		baseDao.delete(Teacher.class, id);
		return "success";
	}

	@Override
	public List<Student> search(String num) {
		String str = "from Student s where s.num like \'%" + num + "%\'";
		List<Student> list = baseDao.find(str);
		return list;
	}

	@Override
	public List<Student> searchByname(String name) {
		String str = "from Student s where s.name like \'%" + name + "%\'";
		List<Student> list = baseDao.find(str);
		return list;
	}

	@Override
	public String addTerm(Term term) {
		baseDao.save(term);
		return "success";
	}

	@Override
	public String addCourse(Course c) {
		baseDao.save(c);
		return "success";
	}

	@Override
	public String deleteCourse(int id) {
		baseDao.delete(Course.class,id);
		return "success";
	}

	@Override
	public String modifyCourse(int id,String cname, String tname, String startDate, String endData) {
		Course s = (Course) baseDao.load(Course.class, id);
		s.setCname(cname);
		s.setTname(tname);
		s.setStartDate(startDate);
		s.setEndDate(endData);
		baseDao.update(s);
		return "success";
	}

	@Override
	public List<Course> getCourse(String term) {
		String str = "from Course s where s.term=\'"+term+"\'";
		List<Course> list = baseDao.find(str);
		return list;
	}

}
