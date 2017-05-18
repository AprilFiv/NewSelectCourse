package com.xmu.dao;

import java.util.List;

import com.xmu.domain.CourseInfo;

public interface SuperCourseDao {
	/**
	 * 公共课选课列表
	 * @param currPage
	 * @return
	 * @throws Exception
	 */
	public List<CourseInfo> displayPublicCourse(String type) throws Exception;
	
	/**
	 * 获取已经选择的课程
	 * @param courseid
	 * @return
	 * @throws Exception
	 */
	public List<CourseInfo> displaySelectAlready(String courseid) throws Exception;
	
	/**
	 * 获取所有的COURSEID
	 * @return
	 * @throws Exception
	 */
	public List<Integer> getCourseID() throws Exception;	
	
}
