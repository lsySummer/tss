package edu.nju.dao;

import edu.nju.model.Student;
import edu.nju.model.Teacher;

public interface ManagerDao {
	public String regStu(Student stu);
	public String regTch(Teacher tea);
	public String deleteStu(int id);
	public String deleteTea(int id);
	public String modify(int id,String uname,String pass,String num);
	public String tmodify(int id,String uname,String pass,String num);
	public Student search(String num);
}
