package com.xmu.dao;

import com.xmu.domain.StudentInfo;

public interface SuperStudentInfoDao {
	/**
	 * 获取学生信息
	 * @param num
	 * @return
	 * @throws Exception 
	 */
	public StudentInfo acquireStudentInfo(String num) throws Exception;
	/**
	 * 存储STUDENTINFO
	 * @param studentInfo
	 * @throws Exception
	 */
	public void saveStudentInfo(StudentInfo studentInfo) throws Exception;
}
