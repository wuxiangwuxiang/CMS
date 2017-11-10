package com.qdu.pojo;

import java.io.Serializable;
import java.util.List;

//学生考勤信息类
public class StudentInfo implements Serializable{
 
	private int studentInfoId;
	private Student student;
	private Course course;
	private int signIn; 
	private int comeLate;
	private int leaveEarlier;
	private int absenteeism;
	public int getStudentInfoId() {
		return studentInfoId;
	}
	public void setStudentInfoId(int studentInfoId) {
		this.studentInfoId = studentInfoId;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public int getSignIn() {
		return signIn;
	}
	public void setSignIn(int signIn) {
		this.signIn = signIn;
	}
	public int getComeLate() {
		return comeLate;
	}
	public void setComeLate(int comeLate) {
		this.comeLate = comeLate;
	}
	public int getLeaveEarlier() {
		return leaveEarlier;
	}
	public void setLeaveEarlier(int leaveEarlier) {
		this.leaveEarlier = leaveEarlier;
	}
	public int getAbsenteeism() {
		return absenteeism;
	}
	public void setAbsenteeism(int absenteeism) {
		this.absenteeism = absenteeism;
	}

	
}
