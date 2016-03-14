package edu.nju.dao;

import java.util.List;

import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.model.Cselect;
import edu.nju.model.Showok;
import edu.nju.model.Student;

public interface StudentDao {
	public List<Course> getCoursebyterm(String username,String term);
	public List<Chowok> getChowokList(int cid);
	public String addShPath(String sid,int shid,String path);
	public Student getStudent(String username);
	public Showok getShowokList(String sid,int hid);
	public List<Cselect> getSelectSid(int cid);
	public String sendToTeacher(int chid,String sid,String score,String review);
	public int getChid(int cid,int hid);
	public List<Showok> getAssistantShowok(int chid);
	public Chowok getAsChowok(int prid);
}
