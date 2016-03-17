package edu.nju.service;

import java.util.ArrayList;
import java.util.List;

import edu.nju.model.ChartModel;
import edu.nju.model.Chowok;
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
	public List<Term> getNowTerm();
	public List<Course> getCourse();
	public String getUserid(String username,int i);
	public Teacher getTuser(String username);
	public Student getSuser(String username);
	public Student updateSinfo(String id,String sex,String mail,String phone,String birth);
	public Teacher updateTinfo(String id,String sex,String mail,String phone,String birth);
	public Teacher insertPor(int id,String path);
	public Student sinsertPor(int id,String path);
	public List<Chowok> getChowokList(int cid);
	public Teacher getSeeTeacher(int cid);
	public Student getSeeStudent(int cid);
	public List<Course> getCourseByMonth(int y,int m);
	public int gethwNum(int cid,int month);
	public int getAveScore(int cid,int month);
	public float getPass(int cid,int month);
	public float getOntime(int cid,int month);
	public ArrayList<Integer> getSubmitNum(int cid,int month);
	public ChartModel getChartModel(int cid,int month);
}
