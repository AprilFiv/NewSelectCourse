package com.xmu.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.xmu.domain.Choice;
import com.xmu.domain.StudentInfo;
@Transactional
@Repository
public class ChoiceDao extends HibernateDaoSupport implements SuperChoiceDao{
	@Resource
    public void setMySessionFactory(SessionFactory sessionFactory){  
        super.setSessionFactory(sessionFactory);  
    }  
	@Override
	public void selectCourse(Choice choice) throws Exception {
		this.getHibernateTemplate().save(choice);
	}
	@Override
	public List<Choice> getAlreadSelect(String num) throws Exception{
		String hql ="from Choice where student_num = ?";
		List<Choice> list= (List<Choice>) this.getHibernateTemplate().find(hql,num);
	
	    return list;
		
		
		
	}
	@Override
	public void dropCourse(Choice choice) throws Exception{
		this.getHibernateTemplate().delete(choice);
		
	}
	@Override
	public void resourceArrange(String num, String courseid, String resource) throws Exception {
		String hql ="from Choice where student_num = ? and courseid = ?";
		List<Choice> list= (List<Choice>) this.getHibernateTemplate().find(hql,num,courseid);
		Choice choice = list.get(0);
		choice.setResource(Integer.parseInt(resource));
		this.getHibernateTemplate().update(choice);
		
	}
	public List<Choice> getRanked(String courseid) throws Exception{
		String hql ="from Choice where courseid = ? order by resource desc";
		List<Choice> list=  new ArrayList<Choice>();
			list =	(List<Choice>)this.getHibernateTemplate().find(hql,courseid);
		return list;
	}
	
	public void makeResult(Integer courseid){
		String hql = "update Choice set checked= ?  where courseid = ?  ";
		this.getHibernateTemplate().bulkUpdate(hql, "checked",courseid.toString());
	
	}
	public void makeResult2(String courseid, String student_num) {
		String hql ="from Choice where student_num = ? and courseid = ?";
		List<Choice> list= (List<Choice>) this.getHibernateTemplate().find(hql,student_num,courseid);
		Choice choice = list.get(0);
		choice.setChecked("checked");
		this.getHibernateTemplate().update(choice);
		
	}
	public void makeResult3(String courseid, String student_num) {
		String hql ="from Choice where student_num = ? and courseid = ?";
		List<Choice> list= (List<Choice>) this.getHibernateTemplate().find(hql,student_num,courseid);
		Choice choice = list.get(0);
		choice.setChecked("lost");
		this.getHibernateTemplate().update(choice);
		
	}
	
}
