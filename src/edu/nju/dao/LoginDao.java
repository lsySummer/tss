package edu.nju.dao;

import java.util.List;

import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.model.Login;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.model.Term;

public interface LoginDao {
	public Login login(String username, String password);

	public List<Student> getStudent();

	public List<Teacher> getTeacher();

	public List<Term> getTerm();

	public List<Course> getCourse();

	public String getUserid(String username, int i);

	public Teacher getTuser(String username);

	public Student getSuser(String username);
	public Student updateSinfo(String id,String sex,String mail,String phone,String birth);
	public Teacher updateTinfo(String id,String sex,String mail,String phone,String birth);
	public Teacher insertPor(int id,String path);
	public Student sinsertPor(int id,String path);
	public List<Chowok> getChowokList(int cid);
}
