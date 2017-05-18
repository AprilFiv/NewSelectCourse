package com.xmu.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.xmu.domain.Choice;
import com.xmu.domain.CourseInfo;
import com.xmu.domain.StudentInfo;
import com.xmu.service.CourseService;
import com.xmu.util.Pager;
@Controller  
@ParentPackage("struts-default")
@Namespace("")  

public class DisplayCourseAction extends SuperAction{
   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String type ; 
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	private Integer pageSize = 10;
   private Integer currPage = 1;
   
   public Integer getCurrPage() {
	   return currPage;
   }
   public void setCurrPage(Integer currPage) {
	   this.currPage = currPage;
   }
   private Pager<CourseInfo> pager=null ;
   private List<CourseInfo> list  ;
   @Resource
   private CourseService courseService;
   @Action(value="displaypubliccourse",results={@Result(name="displaySuccess",location="/jsp/majorSelect_public.jsp"),
		   @Result(name=ERROR,location="/error.jsp")
   })
   public String displayPublicCourse(){
	   try{
		   if (list==null){
			   list = courseService.displayPublicCourse("5");
		   }
		   List<CourseInfo> listtemp = new ArrayList<CourseInfo>();
		   for (int i =0;i<pageSize;i++){
			   if (((currPage-1)*pageSize+i)<=list.size()-1)
			   listtemp.add(list.get((currPage-1)*pageSize+i));
		   }
		   List<Integer> totalselect = courseService.getTotalSelect(listtemp);
		   ActionContext.getContext().getValueStack().set("totalselect",totalselect);
		   
		   pager = new Pager<CourseInfo>(currPage,pageSize,list.size(),list.size()/10+1,listtemp);
		   ActionContext.getContext().getValueStack().push(pager);
		   
		   return "displaySuccess";
	   } catch(Exception e){
		   e.printStackTrace();
		   return ERROR;
	   }
	    
   }
   @Action(value="displaynoschoolcourse",results={@Result(name="displaySuccess",location="/jsp/majorSelect_noschool.jsp"),
		   @Result(name=ERROR,location="/error.jsp")
   })
   public String displayNoSchoolCourse(){
	   try{
		   if (list==null){
			   list = courseService.displayPublicCourse("4");
		   }
		   List<CourseInfo> listtemp = new ArrayList<CourseInfo>();
		   for (int i =0;i<pageSize;i++){
			   if (((currPage-1)*pageSize+i)<=list.size()-1)
			   listtemp.add(list.get((currPage-1)*pageSize+i));
		   }
		   List<Integer> totalselect = courseService.getTotalSelect(listtemp);
		   ActionContext.getContext().getValueStack().set("totalselect",totalselect);
		   
		   pager = new Pager<CourseInfo>(currPage,pageSize,list.size(),list.size()/10+1,listtemp);
		   ActionContext.getContext().getValueStack().push(pager);
		   
		   return "displaySuccess";
	   } catch(Exception e){
		   e.printStackTrace();
		   return ERROR;
	   }
	    
   }
   @Action(value="displaynocollegecourse",results={@Result(name="displaySuccess",location="/jsp/majorSelect_nocollege.jsp"),
		   @Result(name=ERROR,location="/error.jsp")
   })
   public String displayNoCollegeCourse(){
	   try{
		   if (list==null){
			   list = courseService.displayPublicCourse("3");
		   }
		   List<CourseInfo> listtemp = new ArrayList<CourseInfo>();
		   for (int i =0;i<pageSize;i++){
			   if (((currPage-1)*pageSize+i)<=list.size()-1)
			   listtemp.add(list.get((currPage-1)*pageSize+i));
		   }
		   List<Integer> totalselect = courseService.getTotalSelect(listtemp);
		   ActionContext.getContext().getValueStack().set("totalselect",totalselect);
		   
		   pager = new Pager<CourseInfo>(currPage,pageSize,list.size(),list.size()/10+1,listtemp);
		   ActionContext.getContext().getValueStack().push(pager);
		   
		   return "displaySuccess";
	   } catch(Exception e){
		   e.printStackTrace();
		   return ERROR;
	   }
	    
   }
   @Action(value="displayyesschoolcourse",results={@Result(name="displaySuccess",location="/jsp/majorSelect_yesschool.jsp"),
		   @Result(name=ERROR,location="/error.jsp")
   })
   public String displayYesSchoolCourse(){
	   try{
		   if (list==null){
			   list = courseService.displayPublicCourse("2");
		   }
		   List<CourseInfo> listtemp = new ArrayList<CourseInfo>();
		   for (int i =0;i<pageSize;i++){
			   if (((currPage-1)*pageSize+i)<=list.size()-1)
			   listtemp.add(list.get((currPage-1)*pageSize+i));
		   }
		   List<Integer> totalselect = courseService.getTotalSelect(listtemp);
		   ActionContext.getContext().getValueStack().set("totalselect",totalselect);
		   
		   pager = new Pager<CourseInfo>(currPage,pageSize,list.size(),list.size()/10+1,listtemp);
		   ActionContext.getContext().getValueStack().push(pager);
		   
		   return "displaySuccess";
	   } catch(Exception e){
		   e.printStackTrace();
		   return ERROR;
	   }
	    
   }
   @Action(value="displayyescollegecourse",results={@Result(name="displaySuccess",location="/jsp/majorSelect_yescollege.jsp"),
		   @Result(name=ERROR,location="/error.jsp")
   })
   public String displayYesCollegeCourse(){
	   try{
		   if (list==null){
			   list = courseService.displayPublicCourse("1");
		   }
		   List<CourseInfo> listtemp = new ArrayList<CourseInfo>();
		   for (int i =0;i<pageSize;i++){
			   if (((currPage-1)*pageSize+i)<=list.size()-1)
			   listtemp.add(list.get((currPage-1)*pageSize+i));
		   }
		   List<Integer> totalselect = courseService.getTotalSelect(listtemp);
		   ActionContext.getContext().getValueStack().set("totalselect",totalselect);
		   
		   pager = new Pager<CourseInfo>(currPage,pageSize,list.size(),list.size()/10+1,listtemp);
		   ActionContext.getContext().getValueStack().push(pager);
		   
		   return "displaySuccess";
	   } catch(Exception e){
		   e.printStackTrace();
		   return ERROR;
	   }
	    
   }
}
