package edu.nju.dao;

import java.util.List;

import edu.nju.model.Login;
import edu.nju.model.Student;
import edu.nju.model.Teacher;

public interface LoginDao {
	public Login login(String username, String password);

	public List<Student> getStudent();
	
	public List<Teacher> getTeacher();
}
