package com.xmu.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

@Transactional
@Repository
public class StudentDao extends HibernateDaoSupport implements SuperStudentDao{
	
	@Resource
    public void setMySessionFactory(SessionFactory sessionFactory){  
        super.setSessionFactory(sessionFactory);  
    }  
	public boolean login(String num,String pass)throws Exception{
		String hql ="from Student where student_num = ? and student_pass = ?";
		List<?> list= this.getHibernateTemplate().find(hql,num,pass);
		if (list.size()!=0 && list.get(0)!=null){
			return true;
		}
		return false;
	}

}
