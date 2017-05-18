package com.xmu.dao;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.xmu.domain.CourseInfo;
@Transactional
@Repository
public class CourseDao extends HibernateDaoSupport implements SuperCourseDao{
	@Resource
    public void setMySessionFactory(SessionFactory sessionFactory){  
        super.setSessionFactory(sessionFactory);  
    }  
	
	public List<CourseInfo> displayPublicCourse(String type) throws Exception{
		String hql ="from CourseInfo where fromtype = ? ";
		List<CourseInfo> list= (List<CourseInfo>) this.getHibernateTemplate().find(hql,type);
		if (list.size()!=0 ) {
			return list;
		}
		else 
			return null;
	}
	public List<CourseInfo> displaySelectAlready(String courseid) throws Exception{
		String hql ="from CourseInfo where courseid = ?";
		List<CourseInfo> list= (List<CourseInfo>) this.getHibernateTemplate().find(hql,courseid);
		if (list.size()!=0 ) {
			return list;
		}
		else 
			return null;
	}

	public List<Integer> getCourseID() throws Exception{
		String hql ="from CourseInfo";
		List<CourseInfo> list= (List<CourseInfo>) this.getHibernateTemplate().find(hql);
		List<Integer> list2 = new LinkedList<Integer>();
		for (CourseInfo i :list){
			list2.add(Integer.parseInt(i.getCourseid()));
			list2.add(Integer.parseInt(i.getEnableornot()));
		}
		return list2;
	}
}
