package com.xmu.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xmu.dao.ChoiceDao;
import com.xmu.dao.CourseDao;
import com.xmu.domain.Choice;
import com.xmu.domain.CourseInfo;
@Service
public class CourseService implements SuperCourseService {
	
	@Resource
	private CourseDao courseDao;
	
	@Resource
	private ChoiceDao choiceDao;
	
	public List<CourseInfo> displayPublicCourse(String type) throws Exception{
		return courseDao.displayPublicCourse(type);
	}
	public void selectCourse(Choice choice) throws Exception{
		choiceDao.selectCourse(choice);
	}
	public List<Choice> getAlreadSelect(String num) throws Exception{
		return choiceDao.getAlreadSelect(num);
	}
	public List<CourseInfo> displaySelectAlready(String courseid) throws Exception{
		return courseDao.displaySelectAlready(courseid);
	}
	public void dropCourse(Choice choice) throws Exception{
		choiceDao.dropCourse(choice);
	}
	public void resourceArrange(String num, String courseid,String resource) throws Exception{
		choiceDao.resourceArrange(num,courseid,resource);
	}
	public List<Choice> getRanked(String courseid) throws Exception{
		return choiceDao.getRanked(courseid);
	}
	public List<Integer> getTotalSelect(List<CourseInfo> listtemp) throws Exception{
		List<Integer> list = new ArrayList<Integer>();
		for (int i =0;i<listtemp.size();i++){
			list.add(choiceDao.getRanked(listtemp.get(i).getCourseid()).size());
			
		}
		return list;
	}
	public List<Integer> getCourseID() throws Exception{
		return courseDao.getCourseID();
	}
}
