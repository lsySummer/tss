package edu.nju.dao;

import java.sql.Date;
import java.util.List;

import edu.nju.model.Course;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.model.Term;

public interface ManagerDao {
	public String regStu(Student stu);
	public String regTch(Teacher tea);
	public String deleteStu(int id);
	public String deleteTea(int id);
	public String modify(int id,String uname,String pass,String num);
	public String tmodify(int id,String uname,String pass,String num);
	public List<Student> search(String num);
	public  List<Student> searchByname(String name);
	public String addTerm(Term term);
	public String addCourse(Course c);
	public String deleteCourse(int id);
	public String modifyCourse(int id,String cname, String tname, String startDate, String endData);
	public List<Course> getCourse(String term);
}
