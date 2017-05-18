package com.xmu.service;

import java.util.List;

import com.xmu.domain.Choice;
import com.xmu.domain.CourseInfo;

public interface SuperCourseService {
	/**
	 * 公共课选课列表
	 * @param currPage
	 * @return
	 */
	public List<CourseInfo> displayPublicCourse(String type) throws Exception;
	/**
	 * 选课操作方法
	 * @return
	 * @throws Exception
	 */
	public void selectCourse(Choice choice) throws Exception;
	/**
	 * 得到已经选的课程
	 * @param num
	 * @return
	 * @throws Exception
	 */
	public List<Choice> getAlreadSelect(String num) throws Exception;
	/**
	 * 已经选择的课程
	 * @param courseid
	 * @return
	 * @throws Exception
	 */
	public List<CourseInfo> displaySelectAlready(String courseid) throws Exception;
	/**
	 * 退选课程
	 * @param choice
	 * @throws Exception
	 */
	public void dropCourse(Choice choice) throws Exception;
	/**
	 * 资源分配方法
	 * @param num
	 * @param courseid
	 * @param resource
	 */
	public void resourceArrange(String num, String courseid,String resource) throws Exception;
	/**
	 * 获取排名
	 * @param courseid
	 * @throws Exception
	 */
	public List<Choice> getRanked(String courseid) throws Exception;
	/**
	 * 获得已选的人数
	 * @param listtemp
	 * @return
	 * @throws Exception
	 */
	public List<Integer> getTotalSelect(List<CourseInfo> listtemp) throws Exception;
	
	/**
	 * 获取所有的COURSEID
	 * @return
	 * @throws Exception
	 */
	public List<Integer> getCourseID() throws Exception;
}
