package com.xmu.domain;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="choice")
public class Choice implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="courseid")
	private String courseid;
	@Id
	@Column(name="student_num")
	private String student_num;
	@Column
	private Integer resource;
	@Column
	private String checked;
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public String getStudent_num() {
		return student_num;
	}
	public void setStudent_num(String student_num) {
		this.student_num = student_num;
	}
	
	
	
	public Choice(String courseid, String student_num, Integer resource) {
		super();
		this.courseid = courseid;
		this.student_num = student_num;
		this.resource = resource;
	}
	public Choice(String courseid, String student_num, Integer resource,
			String checked) {
		super();
		this.courseid = courseid;
		this.student_num = student_num;
		this.resource = resource;
		this.checked = checked;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public Integer getResource() {
		return resource;
	}
	public void setResource(Integer resource) {
		this.resource = resource;
	}
	public Choice() {
		super();
	}
	
	
}
