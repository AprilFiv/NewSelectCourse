package com.xmu.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 *
 */
@Entity
@Table(name="student")
public class Student {
	@Id
	@Column(name="student_num" ,length = 14)
	private String student_num;
	@Column(name="student_pass" ,length = 15)
	private String student_pass;
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
	
}
