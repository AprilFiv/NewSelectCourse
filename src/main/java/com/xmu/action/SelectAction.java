package com.xmu.action;


import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.convention.annotation.ExceptionMappings;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.xmu.domain.Choice;
import com.xmu.service.CourseService;

@Controller  
@ParentPackage("json-default")
@Scope("prototype")
@Namespace("")  
@ExceptionMappings( { 
	@ExceptionMapping(exception = "java.lange.RuntimeException", result = "ERROR")
}) 
public class SelectAction extends SuperAction {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String student_num;
	private String courseid;
	
	
	public String getStudent_num() {
		return student_num;
	}

	public void setStudent_num(String student_num) {
		this.student_num = student_num;
	}

	public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}

	
	
	 @Resource
	 private CourseService courseService;
	 @Action(value="select",results={@Result(type="json",name="selectSuccess",params={"root","1"}),
			   @Result(name=ERROR,location="/error.jsp")
	   })
	 public String selectCourse(){
		 try {
			 Choice choice = new Choice(courseid,student_num);
			 System.out.println("11111111111111111111111111111111");
			courseService.selectCourse(choice);
			return "selectSuccess";
		} catch (Exception e) {
			
			e.printStackTrace();
			return ERROR;
		}
	 }
}	
