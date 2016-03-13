package edu.nju.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.dao.BaseDao;
import edu.nju.dao.TeacherDao;
import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.model.Cselect;
import edu.nju.model.Showok;
import edu.nju.model.Student;

@Repository
public class TeacherDaoImpl implements TeacherDao{
	@Autowired
	private BaseDao baseDao;

	@Override
	public List<Course> getCoursebyterm(String teacher, String term) {
		String str = "from Course s where s.term=\'"+term+"\' and s.tname=\'"+teacher+"\'";
		List<Course> list = baseDao.find(str);
		return list;
	}

	@Override
	public Course getTeacher(int id) {
		Course c = (Course) baseDao.load(Course.class, id);
		return c;
	}

	@Override
	public Student getStudent(String id) {
		String str = "from Student s where s.num= "+id;
		List<Student> list = baseDao.find(str);
		return list.get(0);
	}

	@Override
	public String addAssistant(String cid, String sname) {
		Course c = (Course)baseDao.load(Course.class, Integer.parseInt(cid));
		c.setAname(sname);
		baseDao.update(c);
		return "success";
	}

	@Override
	public String addCourseInfo(String cid, String courseInfo, String refer) {
		Course c = (Course)baseDao.load(Course.class, Integer.parseInt(cid));
		c.setInfo(courseInfo);
		c.setBook(refer);
		baseDao.update(c);
		return null;
	}

	@Override
	public List<Cselect> getSelect(int id) {
		String str = "from Cselect s where s.cid= "+id;
		List<Cselect> list = baseDao.find(str);
		return list;
	}

	@Override
	public String addSelect(String sid, String cid) {
		Cselect c = new Cselect();
		c.setSid(sid);
		c.setCid(Integer.parseInt(cid));
		baseDao.save(c);
		return "success";
	}

	@Override
	public boolean checkAssistant(String cid, String sid) {
		String str = "from Cselect s where s.cid= "+cid+" and s.sid="+sid;
		List<Cselect> list = baseDao.find(str);
		if(list.size()>0){return false;}
		return true;
	}

	@Override
	public List<Chowok> getHomework(int cid) {
		String str = "from Chowok s where s.cid= "+cid;
		List<Chowok> list = baseDao.find(str);
		return list;
	}

	@Override
	public String addHomework(Chowok ch) {
		baseDao.save(ch);
		return "success";
	}
	
	@Override
	public int addShowok(Chowok ch){
		int cid = ch.getCid();
		int hid = ch.getHid();
		String str = "from Chowok s where s.cid= "+cid+" and s.hid="+hid;
		List<Chowok> list = baseDao.find(str);
		int id = list.get(0).getId();
		return id;
	}

	@Override
	public String addEgpath(int cid, int shid, String path) {
		String str = "from Chowok s where s.cid= "+cid+" and s.hid="+shid;
		List<Chowok> list = baseDao.find(str);
		int id = list.get(0).getId();
		Chowok c = (Chowok)baseDao.load(Chowok.class, id);
		c.setEgfilepath(path);
		baseDao.update(c);
		return "success";
	}

	@Override
	public List<Cselect> getselectList(int cid) {
		String str = "from Cselect s where s.cid= "+cid;
		List<Cselect> list = baseDao.find(str);
		return list;
	}

	@Override
	public String insertShowok(String sid, int hid) {
		Showok sh = new Showok();
		sh.setSid(sid);
		sh.setHid(hid);
		baseDao.save(sh);
		return null;
	}

	@Override
	public Showok getOneShowok(String sid, int hid) {
		String str = "from Showok s where s.sid="+sid+" and s.hid="+hid;
		List<Showok> list = baseDao.find(str);
		return list.get(0);
	}

	@Override
	public String addFailReason(int prid,String failReason) {
		Chowok sh = (Chowok)baseDao.load(Chowok.class, prid);
		sh.setFailReason(failReason);
		int failTime = sh.getFailTime();
		failTime++;
		sh.setFailTime(failTime);
		baseDao.update(sh);
		return null;
	}

	@Override
	public String addReview(int prid, String review) {
		Chowok sh = (Chowok)baseDao.load(Chowok.class, prid);
		sh.setComment(review);
		baseDao.update(sh);
		int pid = sh.getId();
		String str = "from Showok s where s.hid="+pid;
		List<Showok> list = baseDao.find(str);
		for(int i=0;i<list.size();i++){
			Showok showok = list.get(i);
			showok.setpScore(showok.getScore());
			baseDao.update(showok);
		}
		return null;
	}
}
