﻿package edu.nju.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nju.dao.BaseDao;


@Repository
public class BaseDaoImpl implements BaseDao {
	/** * Autowired 自动装配 相当于get() set() */
	@Autowired
	protected SessionFactory sessionFactory;

	/** * gerCurrentSession 会自动关闭session，使用的是当前的session事务 * * @return */
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	

	/** * openSession 需要手动关闭session 意思是打开一个新的session * * @return */
	public Session getNewSession() {
		return sessionFactory.openSession();
	}

	public void flush() {
		getSession().flush();
	}

	public void clear() {
		getSession().clear();
	}

	/** * 根据 id 查询信息 * * @param id * @return */
	@SuppressWarnings("rawtypes")
	public Object load(Class c, int id) {
		Session session = getSession();
		return session.get(c, id);
	}

	/** * 获取所有信息 * * @param c * * @return */

	public List getAllList(Class c) {
		String hql = "from " + c.getName();
		Session session = getSession();
		return session.createQuery(hql).list();

	}

	/** * 获取总数量 * * @param c * @return */

	public Long getTotalCount(Class c) {
		Session session = getNewSession();
		String hql = "select count(*) from " + c.getName();
		Long count = (Long) session.createQuery(hql).uniqueResult();
		session.close();
		return count != null ? count.longValue() : 0;
	}

	/** * 保存 * * @param bean * */
	public void save(Object bean) {
		try {
			Session session = getNewSession();
			Transaction tx = session.beginTransaction();
			session.save(bean);
			session.flush();
			session.clear();
			tx.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** * 更新 * * @param bean * */
	public void update(Object bean) {
		Session session = getNewSession();
		session.update(bean);
		session.flush();
		session.clear();
		session.close();
	}

	/** * 删除 * * @param bean * */
	public void delete(Object bean) {

		Session session = getNewSession();
		session.delete(bean);
		session.flush();
		session.clear();
		session.close();
	}

	/** * 根据ID删除 * * @param c 类 * * @param id ID * */
	@SuppressWarnings({ "rawtypes" })
	public void delete(Class c, int id) {
		Session session = getNewSession();
		Transaction tx = session.beginTransaction();
		Object obj = session.get(c, id);
		session.delete(obj);
		flush();
		clear();
		tx.commit();
	}

	/** * 批量删除 * * @param c 类 * * @param ids ID 集合 * */
	@SuppressWarnings({ "rawtypes" })
	public void delete(Class c, String[] ids) {
		for (String id : ids) {
			Object obj = getSession().get(c, id);
			if (obj != null) {
				getSession().delete(obj);
			}
		}
	}
	
	// 根据HQL语句进行查询 
	@SuppressWarnings("unchecked") 
	public List find(String queryString) { 
		Session session = getNewSession();
		return session.createQuery(queryString).list();
	
	} 
	// 根据HQL语句进行查询 
	public List login(String queryString,String uname,String pass) { 
		Session session = getNewSession();
		return session.createQuery(queryString).setParameter(0, uname).setParameter(1, pass).list();
	} 

}
