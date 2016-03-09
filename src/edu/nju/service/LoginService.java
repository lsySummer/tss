package edu.nju.service;

import java.util.List;

import edu.nju.model.Course;
import edu.nju.model.Login;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.model.Term;

public interface LoginService {
	public Login login(String username,String password);
	
	public List<Student> getStudent();
	
	public List<Teacher> getTeacher();
	
	public List<Term> getTerm();
	
	public List<Course> getCourse();
}
