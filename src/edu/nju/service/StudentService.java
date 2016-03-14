package edu.nju.service;

import java.util.List;

import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.model.Cselect;
import edu.nju.model.Showok;
import edu.nju.model.Student;

public interface StudentService {
	public List<Course> getCoursebyterm(String username,String term);
	public List<Chowok> getChowokList(int cid);
	public String addShPath(String sid,int shid,String path);
	public Student getStudent(String uname) ;
	public List<Showok> getShowokList(String sid);
	public List<Cselect> getSelectSid(int cid);
}
