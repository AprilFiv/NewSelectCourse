package com.xmu.dao;

/**
 * StudentDao父接口
 *
 */
public interface SuperStudentDao {
	/**
	 * 学生登录DAO
	 * @param num
	 * @param pass
	 * @return
	 * @throws Exception 
	 */
	public boolean login(String num,String pass) throws Exception;

}
