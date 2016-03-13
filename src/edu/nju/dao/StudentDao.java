package edu.nju.dao;

import java.util.List;

import edu.nju.model.Course;

public interface StudentDao {
	public List<Course> getCoursebyterm(String username,String term);
}
