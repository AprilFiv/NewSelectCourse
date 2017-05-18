package com.xmu.service;

import com.xmu.domain.StudentInfo;

/**
 * StudentService父接口
 */
public interface SuperStudentService {
	/**
	 * 学生登录SERVICE
	 * @param num
	 * @param pass
	 * @return
	 */
	public boolean login(String num,String pass) throws Exception;
	/**
	 * 获得学生信息
	 * @param num
	 * @return
	 */
	public StudentInfo acquireStudentInfo(String num) throws Exception;
	/**
	 * 保存STUDENTINFO
	 * @param studentInfo
	 * @throws Exception
	 */
	public void saveStudentInfo(StudentInfo studentInfo) throws Exception;
}
