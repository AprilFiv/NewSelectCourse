package com.xmu.action;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.convention.annotation.ExceptionMappings;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.xmu.dao.ChoiceDao;
import com.xmu.domain.Choice;
import com.xmu.domain.CourseInfo;
import com.xmu.domain.StudentInfo;
import com.xmu.service.CourseService;
import com.xmu.service.StudentService;
import com.xmu.util.constant;

@Controller  
@ParentPackage("json-default")
@Scope("prototype")
@Namespace("")  
@ExceptionMappings( { 
	@ExceptionMapping(exception = "java.lange.RuntimeException", result = "ERROR")
}) 
public class CourseAction extends SuperAction {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String student_num;
	private String courseid;
	private String resource;
	private String originre;
	private String timestart;
	
	public String getTimestart() {
		return timestart;
	}

	public void setTimestart(String timestart) {
		this.timestart = timestart;
	}



	List<Choice> rank;
	
	
	public List<Choice> getRank() {
		return rank;
	}

	public void setRank(List<Choice> rank) {
		this.rank = rank;
	}

	public String getOriginre() {
		return originre;
	}

	public void setOriginre(String originre) {
		this.originre = originre;
	}

	public String getResource() {
		return resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

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
	 @Resource
	 private StudentService studentService;
	 @Action(value="select",results={@Result(type="json",name="selectSuccess",params={"root","1"}),
			   @Result(name=ERROR,location="/error.jsp")
	   })
	 public String selectCourse(){
		 try {
			 
			 Choice choice = new Choice(courseid,student_num,0,"pre");
			 System.out.println("11111111111111111111111111111111");
			courseService.selectCourse(choice);
			StudentInfo si = (StudentInfo) request.getSession().getAttribute("studentinfo");
			si.setSelected(si.getSelected()+timestart+" ");
			System.out.println(timestart);
			request.getSession().setAttribute("studentinfo", si);
			studentService.saveStudentInfo(si);
			getAlreadySelect();
			return "selectSuccess";
			 
		} catch (Exception e) {
			
			e.printStackTrace();
			return ERROR;
		}
	 }
	 @Action(value="drop",results={@Result(type="json",name="dropSuccess",params={"root","1"}),
			   @Result(name=ERROR,location="/error.jsp")
	   })
	 public String dropCourse(){
		 try{
		 Choice choice = new Choice(courseid,student_num,Integer.parseInt(resource));
		 System.out.println("11111111111111111111111111111111");
		StudentInfo si = (StudentInfo) request.getSession().getAttribute("studentinfo");
		
		
		  int temp = si.getSelected().indexOf(timestart);
		  String s1 = si.getSelected().substring(1, temp);
		  String s2 = si.getSelected().substring(temp+timestart.length());
		  si.setSelected(s1+s2);
		  request.getSession().setAttribute("studentinfo", si);
		 studentService.saveStudentInfo(si);
		courseService.dropCourse(choice);
		getAlreadySelect();
		 return "dropSuccess";
		 } catch (Exception e) {
			// TODO: handle exception
			 return ERROR;
		}
	 }
	 
	 @Action(value="arrange",results={@Result(type="json",name="arrangeSuccess",params={"root","1"}),
			  @Result(type="json",name="arrangeFailed",params={"root","2"}),
			   @Result(name=ERROR,location="/error.jsp")
	   })
	 public String resourceArrange(){
		 try {
			 System.out.println(resource);
			 
			 if(resource.trim().matches("^[0-9]{1,5}$")){
			int total = (Integer) request.getSession().getAttribute("totalpoint");
			int restpoint;
			long rest = (System.currentTimeMillis()-constant.setTime)/60/1000;
			if (rest<0)
			   restpoint = constant.setPoint-total;
			else {
				restpoint = (int) (constant.setPoint-total-rest);
			}
			if ((Integer.parseInt(resource)-Integer.parseInt(originre))>restpoint){
				return "arrangeFailed";
			}
			courseService.resourceArrange(student_num,courseid,resource);
			getAlreadySelect();
			
			return "arrangeSuccess";
			 }
			 else{
				 return ERROR;
			 }
		} catch (Exception e) {
			
			e.printStackTrace();
			return ERROR;
		}
	 }
	 @Action(value="rank",results={@Result(type="json",name="getSuccess",params={"root","rank"}),
			   @Result(name=ERROR,location="/error.jsp")
	   })
	 public String getRanked(){
		 try {
			 rank=null;
			rank= courseService.getRanked(courseid);
			return "getSuccess";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
		 
	 }
	 public void getAlreadySelect() throws Exception{
			
			String student_num = ((StudentInfo) request.getSession().getAttribute("studentinfo")).getStudent_num();
			List<Choice> list = courseService.getAlreadSelect(student_num);
			if (list!=null){
				List<CourseInfo> courselist = new ArrayList<CourseInfo>();
				int totalpoint = 0 ;
				for (Choice i : list){
					List<CourseInfo> temp = (courseService.displaySelectAlready(i.getCourseid()));
					totalpoint += i.getResource();
					 if ( temp!=null){
						 courselist.addAll(temp);
					 }
				}
			
				request.getSession().setAttribute("selected",courselist);
				request.getSession().setAttribute("selectedra", list);
				request.getSession().setAttribute("totalpoint",totalpoint);
			
			}
		
	}
	 
	
	
}	
