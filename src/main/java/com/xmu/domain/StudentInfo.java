package com.xmu.domain;

import javax.persistence.*;

@Entity
@Table(name="studentinfo")
public class StudentInfo {
	@Id
	@Column
	private String student_num;
	@Column
	private String area;
	@Column
	private String grade;
	@Column
	private String college;
	@Column
	private String selected;
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getSelected() {
		return selected;
	}
	public void setSelected(String selected) {
		this.selected = selected;
	}
	public String getStudent_num() {
		return student_num;
	}
	public void setStudent_num(String student_num) {
		this.student_num = student_num;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
    
	
}
