package edu.nju.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.dao.LoginDao;
import edu.nju.model.Login;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	LoginDao loginDao;
	
	@Override
	public Login login(String username, String password) {
		return loginDao.login(username, password);
	}

	@Override
	public List<Student> getStudent() {
		return loginDao.getStudent();
	}

	@Override
	public List<Teacher> getTeacher() {
		return loginDao.getTeacher();
	}

}
