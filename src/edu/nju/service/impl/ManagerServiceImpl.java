package edu.nju.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.dao.ManagerDao;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.service.ManagerService;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	ManagerDao managerDao;
	@Override
	public String regStu(Student stu) {
		return managerDao.regStu(stu);
	}

	@Override
	public String regTch(Teacher tea) {
		return managerDao.regTch(tea);
	}

	@Override
	public String deleteStu(int id) {
		return managerDao.deleteStu(id);
	}

	@Override
	public String modify(int id, String uname, String pass, String num) {
		return managerDao.modify(id, uname, pass, num);
	}

	@Override
	public Student search(String num) {
		return managerDao.search(num);
	}

	@Override
	public String tmodify(int id, String uname, String pass, String num) {
		return managerDao.tmodify(id, uname, pass, num);
	}

	@Override
	public String deleteTea(int id) {
		return managerDao.deleteTea(id);
	}

}
