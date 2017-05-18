package com.xmu.dao;

import java.util.List;

import com.xmu.domain.Choice;

public interface SuperChoiceDao {
	/**
	 * 选课
	 * @param choice
	 * @throws Exception
	 */
	public void selectCourse(Choice choice) throws Exception;
	/**
	 * 取得已经选的课程
	 * @param num
	 * @return
	 * @throws Exception
	 */
	public List<Choice> getAlreadSelect(String num) throws Exception;
	/**
	 * 退选
	 * @param choice
	 * @throws Exception
	 */
	public void dropCourse(Choice choice) throws Exception;
	/**
	 * 分配资源
	 * @param choice
	 * @throws Exception
	 */
	
	public void resourceArrange(String num, String courseid, String resource) throws Exception;
	/**
	 * 获取排名
	 * @param courseid
	 * @return
	 * @throws Exception
	 */
	public List<Choice> getRanked(String courseid) throws Exception;
}
