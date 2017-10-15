package com.qdu.pojo;

import java.util.List;

public class Teacher {
	private String teacherMobile;
	private String teacherEmail;
	private String teacherPassword;
	private String teacherName;
	private String teacherGender;
	private String teacherSubject;
	private List<Student> student;
	private List<Course> course;
	private List<Clazz> clazz;
	public String getTeacherMobile() {
		return teacherMobile;
	}
	public void setTeacherMobile(String teacherMobile) {
		this.teacherMobile = teacherMobile;
	}
	public String getTeacherEmail() {
		return teacherEmail;
	}
	public void setTeacherEmail(String teacherEmail) {
		this.teacherEmail = teacherEmail;
	}
	
	public String getTeacherPassword() {
		return teacherPassword;
	}
	public void setTeacherPassword(String teacherPassword) {
		this.teacherPassword = teacherPassword;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public String getTeacherGender() {
		return teacherGender;
	}
	public void setTeacherGender(String teacherGender) {
		this.teacherGender = teacherGender;
	}
	public String getTeacherSubject() {
		return teacherSubject;
	}
	public void setTeacherSubject(String teacherSubject) {
		this.teacherSubject = teacherSubject;
	}
	public List<Student> getStudent() {
		return student;
	}
	public void setStudent(List<Student> student) {
		this.student = student;
	}
	
	public List<Course> getCourse() {
		return course;
	}
	public void setCourse(List<Course> course) {
		this.course = course;
	}
	public List<Clazz> getClazzs() {
		return clazz;
	}
	public void setClazzs(List<Clazz> clazzs) {
		this.clazz = clazzs;
	}
	@Override
	public String toString() {
		return "Teacher [teacherMobile=" + teacherMobile + ", teacherEmail=" + teacherEmail + ", teacherPassword="
				+ teacherPassword + ", teacherName=" + teacherName + ", teacherGender=" + teacherGender
				+ ", teacherSubject=" + teacherSubject + ", student=" + student + ", course=" + course + ", clazzs="
				+ clazz + "]";
	}
	
	
}
