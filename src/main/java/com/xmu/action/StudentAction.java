package com.xmu.action;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;

import com.opensymphony.xwork2.ActionContext;
import com.xmu.domain.Choice;
import com.xmu.domain.CourseInfo;
import com.xmu.domain.StudentInfo;
import com.xmu.service.CourseService;
import com.xmu.service.StudentService;
import org.apache.struts2.convention.annotation.*;   
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;  
/**
 * 学生操作ACTION
 */
@Controller  
@ParentPackage("json-default")
@Scope("prototype")
@Namespace("")  
@ExceptionMappings( { 
	@ExceptionMapping(exception = "java.lange.RuntimeException", result = "ERROR")
}) 
public class StudentAction extends SuperAction{

	/**
	 * 学生操作ACTION
	 * @param student_num 学号
	 * @param student_pass 密码
	 */
	private static final long serialVersionUID = 1L;
	
	private String student_num;
	private String student_pass;
	private String checkcode;
	private String rememberme;
	public String getStudent_num() {
		return student_num;
	}
	public void setStudent_num(String student_num) {
		this.student_num = student_num;
	}
	public String getStudent_pass() {
		return student_pass;
	}
	public void setStudent_pass(String student_pass) {
		this.student_pass = student_pass;
	}
	
	public String getCheckcode() {
		return checkcode;
	}
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	public String getRememberme() {
		return rememberme;
	}
	public void setRememberme(String rememberme) {
		this.rememberme = rememberme;
	}

	@Resource  
	private StudentService studentService;
	
	@Resource
	private CourseService courseService;
	/**
	 * 登录ACTION
	 * @return
	 */
	@Action(value="/login",results={@Result(type = "json",name="loginSuccess",params={"root","1"}),
			@Result(type = "json",name="checkcodeWrong",params={"root","2"}),
			@Result(type = "json",name="loginFailed",params={"root","3"}),
			@Result(name=ERROR,location="/error.jsp")
			})  
	public String login(){
		
		try {
			if (!checkcode.equals(((String)request.getSession().getAttribute("checkcode")))){
				return "checkcodeWrong";
			}
			else{
			boolean flag = studentService.login(student_num,student_pass);
			if (flag){
				getStudentInfo(student_num);
				getAlreadySelect();
				if ("true".equals(rememberme)){
					Cookie cookie1 = new Cookie("student_num", student_num);
					Cookie cookie2 = new Cookie("student_pass", student_pass);
					cookie1.setMaxAge(86400);
					cookie2.setMaxAge(86400);
					response.addCookie(cookie1);
					response.addCookie(cookie2);
			
				}
				else {
					Cookie[] cookies = request.getCookies();
					if (cookies != null ) {
						for (Cookie c : cookies) {
							if ("student_num".equals(c.getName()) || "student_pass".equals(c.getName())) {
								c.setMaxAge(0);
								response.addCookie(c);
							}
						}
					}
				}
				return "loginSuccess";
			}
			else {
				return "loginFailed";
			}
			}
		}catch (Exception e) {
			e.printStackTrace();
			return ERROR;
			// TODO: handle exception
		}
	}
	/**
	 * 退出系统ACTION
	 * @return
	 */
	@Action(value="/out",results={@Result(name="outSuccess",location="/index.jsp"),
			@Result(name=ERROR,location="/error.jsp")
			})  
	public String out(){
		try{
			request.getSession().removeAttribute("studentinfo");
			Cookie[] cookies = request.getCookies();
			if (cookies != null ) {
				for (Cookie c : cookies) {
					if ("student_num".equals(c.getName()) || "student_pass".equals(c.getName())) {
						c.setMaxAge(0);
						response.addCookie(c);
					}
				}
			}
			return "outSuccess";
		}catch (Exception e ){
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
	 public void getStudentInfo(String student_num) throws Exception{
	 	StudentInfo studentInfo = new StudentInfo();
		studentInfo = studentService.acquireStudentInfo(student_num);
		request.getSession().setAttribute("studentinfo", studentInfo);
	 }
}
