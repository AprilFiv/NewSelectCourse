package com.xmu.domain;

import javax.persistence.*;

@Entity
@Table(name="courseinfo")
public class CourseInfo {
	@Id
	@Column(name = "courseid")
	private String courseid;
	@Column
	private String coursetype;
	@Column
	private String courseidentity;
	@Column
	private String coursename;
	@Column
	private String classnum;
	@Column
	private String department;
	@Column
	private String credit;
	/**
	 * 周一12:a 34:b 56:c 78::d 910:e 11:f 
	 * 周二12:g 34:h 56:i 78::j 910:k 11:l 
	 * 周三12:m 34:n 56:o 78::p 910:q 11:r 
	 * 周四12:s 34:t 56:u 78::v 910:w 11:x 
	 * 周五12:y 34:z 56:A 78::B 910:C 11:D 
	 */
	@Column
	private String timestart;
	@Column
	private String position;
	@Column
	private String teachername;
	@Column
	private String enableornot;
	@Column
	private String area;
	@Column
	private String college;
	@Column
	private String fromtype;
	@Column
	private String grade;
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getFromtype() {
		return fromtype;
	}
	public void setFromtype(String fromtype) {
		this.fromtype = fromtype;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public String getCoursetype() {
		return coursetype;
	}
	public void setCoursetype(String coursetype) {
		this.coursetype = coursetype;
	}
	public String getCourseidentity() {
		return courseidentity;
	}
	public void setCourseidentity(String courseidentity) {
		this.courseidentity = courseidentity;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getClassnum() {
		return classnum;
	}
	public void setClassnum(String classnum) {
		this.classnum = classnum;
	}
	
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getTeachername() {
		return teachername;
	}
	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getTimestart() {
		return timestart;
	}
	public void setTimestart(String timestart) {
		this.timestart = timestart;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	
	public String getEnableornot() {
		return enableornot;
	}
	public void setEnableornot(String enableornot) {
		this.enableornot = enableornot;
	}

	
}
