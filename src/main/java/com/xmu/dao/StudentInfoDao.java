package com.xmu.dao;

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
public class StudentInfoDao extends HibernateDaoSupport implements SuperStudentInfoDao {

	@Resource
    public void setMySessionFactory(SessionFactory sessionFactory){  
        super.setSessionFactory(sessionFactory);  
    }  
	@Override
	public StudentInfo acquireStudentInfo(String num) throws Exception{
		String hql = "from StudentInfo where student_num = ?";
		List<?> list= this.getHibernateTemplate().find(hql,num);
		if (list.size()!=0 && list.get(0)!=null){
			return (StudentInfo)list.get(0);
		}
		else return null;
		
	}
	public void saveStudentInfo(StudentInfo studentInfo) throws Exception{
		String hql ="from StudentInfo  where student_num = ? ";
		List<StudentInfo> list= (List<StudentInfo>) this.getHibernateTemplate().find(hql,studentInfo.getStudent_num());
		
		 list.get(0).setSelected(studentInfo.getSelected());
		this.getHibernateTemplate().update( list.get(0));
	}
}
