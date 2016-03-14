package edu.nju.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.dao.BaseDao;
import edu.nju.dao.StudentDao;
import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.model.Cselect;
import edu.nju.model.Showok;
import edu.nju.model.Student;

@Repository
public class StudentDaoImpl implements StudentDao{
	@Autowired
	private BaseDao baseDao;

	@Override
	public List<Course> getCoursebyterm(String uname, String term) {
		String str = "from Student s where s.username='"+uname+"'";
		List<Student> list = baseDao.find(str);
		String sid = list.get(0).getNum();
		String str2 = "from Course s where s.term= '"+term+"'";
		List<Course> list2 = baseDao.find(str2);//某个学期的所有课程
		ArrayList<Course> arr = new ArrayList<Course>();
		for(int i = 0;i<list2.size();i++){
			int id = list2.get(i).getId();
			String str3 = "from Cselect s where s.cid= "+id+" and s.sid="+sid;//某学生本学期选课
			List<Cselect> list3 = baseDao.find(str3);
			String str4 = "from Course c where c.aname='"+uname+"'"+" and c.id="+id;//学生本学期担任助教的课
			List<Course> list4 = baseDao.find(str4);
			for(int j=0;j<list3.size();j++){
				Course c = (Course) baseDao.load(Course.class, list3.get(j).getCid());
				arr.add(c);
			}
			for(int j=0;j<list4.size();j++){
				Course c = (Course) baseDao.load(Course.class, list4.get(j).getId());
				arr.add(c);
			}
		}
		return arr;
	}

	@Override
	public List<Chowok> getChowokList(int cid) {
		String str = "from Chowok s where s.cid="+cid;
		List<Chowok> list = baseDao.find(str);
		return list;
	}

	@Override
	public String addShPath(String sid, int shid, String path) {
		String str = "from Showok s where s.sid='"+sid+"' and s.hid="+shid;
		List<Showok> list = baseDao.find(str);
		int id = list.get(0).getId();
		Showok c = (Showok)baseDao.load(Showok.class, id);
		c.setHpath(path);
		baseDao.update(c);
		return "success";
	}
	
	@Override
	public Student getStudent(String uname) {
		String str = "from Student s where s.username='"+uname+"'";
		List<Student> list = baseDao.find(str);
		return list.get(0);
	}

	@Override
	public List<Showok> getShowokList(String sid) {
		String str = "from Showok s where s.sid='"+sid+"'";
		List<Showok> list = baseDao.find(str);
		return list;
	}

	@Override
	public List<Cselect> getSelectSid(int cid) {
		String str = "from Cselect s where s.cid="+cid;
		List<Cselect> list = baseDao.find(str);
		return list;
	}

}
