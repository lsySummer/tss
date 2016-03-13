package edu.nju.service;

import java.util.List;

import edu.nju.model.Course;

public interface StudentService {
	
	public List<Course> getCoursebyterm(String username,String term);

}
