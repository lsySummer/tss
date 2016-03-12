package edu.nju.service;

import java.util.List;

import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.model.Cselect;
import edu.nju.model.Student;

public interface TeacherService {
	public List<Course> getCoursebyterm(String teacher,String term);
	public Course getTeacher(int id);
	public Student getStudent(String id);
	public String addAssistant(String cid,String sname);
	public String addCourseInfo(String cid,String courseInfo,String refer);
	public List<Cselect> getSelect(int id);
	public String addSelect(String sid,String cid);
	public boolean checkAssistant(String cid,String sid);
	public List<Chowok> getHomework(int cid);
	public String addHomework(Chowok ch);
}
