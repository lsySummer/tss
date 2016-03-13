package edu.nju.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.dao.StudentDao;
import edu.nju.model.Course;
import edu.nju.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	StudentDao studentDao;
	
	@Override
	public List<Course> getCoursebyterm(String username, String term) {
		return studentDao.getCoursebyterm(username, term);
	}

}
