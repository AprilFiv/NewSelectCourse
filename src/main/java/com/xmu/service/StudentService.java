package com.xmu.service;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xmu.dao.StudentDao;
import com.xmu.dao.StudentInfoDao;
import com.xmu.domain.StudentInfo;

@Service
public class StudentService implements SuperStudentService {
    @Resource  
	private StudentDao studentDao;
	@Override
	public boolean login(String num,String pass) throws Exception{
		boolean flag;
		flag = studentDao.login(num,pass);
		return flag;
	}
	@Resource
	private StudentInfoDao studentInfoDao;
	@Override
	public StudentInfo acquireStudentInfo(String num) throws Exception{
		return studentInfoDao.acquireStudentInfo(num);
	}
	public void saveStudentInfo(StudentInfo studentInfo) throws Exception{
		studentInfoDao.saveStudentInfo(studentInfo);
	}
	
}
