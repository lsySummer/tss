package edu.nju.service;

import java.util.List;

import edu.nju.model.Login;
import edu.nju.model.Student;
import edu.nju.model.Teacher;

public interface LoginService {
	public Login login(String username,String password);
	
	public List<Student> getStudent();
	
	public List<Teacher> getTeacher();
}
