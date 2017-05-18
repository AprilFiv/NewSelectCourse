package com.xmu.util;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Timer; 

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.xmu.dao.ChoiceDao;
import com.xmu.domain.Choice;
import com.xmu.service.CourseService;

@Component
public class MakeResult {
	
	@Resource
	private CourseService courseService;
	@Resource
	private ChoiceDao choiceDao;
	
	@Scheduled(cron="20 19 17 1 5 ?" )
	public void cc() throws Exception{
		List<Integer> list = courseService.getCourseID();
		for (int i =0;i<list.size();i=i+2){
			System.out.println(list.get(i).toString());
			System.out.println(list.get(i+1).toString());
			List<Choice> temp = courseService.getRanked(list.get(i).toString());
			System.out.println(temp);
			List<Choice> temp2 = new LinkedList<Choice>(); 
			List<Choice> temp3 = new LinkedList<Choice>(); 
			if (temp.size()<=list.get(i+1)){
				choiceDao.makeResult(list.get(i));
			}
			else{
			   int rc =temp.get(list.get(i+1)-1).getResource();
			   int back=0;//判断相等人数
			   int front=0;
			   for (int j=list.get(i+1);j<temp.size();j++){
				   if (temp.get(j).getResource()!=rc){
					   break;
				   }
				   else{
					   back++;
				   }
			   }
			   for (int j =list.get(i+1)-2;j>=0;j--){
				   System.out.println(list.get(i+1));
				   if (temp.get(j).getResource()!=rc){
					   break;
				   }
				   else{
					   front++;
				   }
			   }
			   for (int j=0;j<list.get(i+1)-1-front;i++){
				   choiceDao.makeResult2(temp.get(0).getCourseid(),temp.get(0).getStudent_num());
				   temp.remove(0);
			   }
			   for (int j=0;j<front+1+back;j++){
				   temp2.add(temp.get(j));
			   }
			   for (int j=front+1+back;j<temp.size();j++){
				   temp3.add(temp.get(j));
			   }
			   Collections.shuffle(temp2);
			   for (int j =0;j<1+front;j++){
				   choiceDao.makeResult2(temp2.get(0).getCourseid(),temp2.get(0).getStudent_num());
				   temp2.remove(0);
			   }
			   for (int j =0;j<temp2.size();j++){
				   choiceDao.makeResult3(temp2.get(j).getCourseid(),temp2.get(j).getStudent_num());
			   }
			   for (int j =0;j<temp3.size();j++){
				   choiceDao.makeResult3(temp3.get(j).getCourseid(),temp3.get(j).getStudent_num());
			   }
			}
		}
	}
}
