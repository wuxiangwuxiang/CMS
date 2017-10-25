package com.qdu.pojo;

import java.io.Serializable;
import java.util.List;

//学生考勤信息类
public class StudentInfo implements Serializable{
 
	private int studentInfoId;
	private List<Student> students;
	private List<Course> course;
	private int comeLate;
	private int leaveEarlier;
	private int absenteeism;
	public int getStudentInfoId() {
		return studentInfoId;
	}
	public void setStudentInfoId(int studentInfoId) {
		this.studentInfoId = studentInfoId;
	}
	public List<Student> getStudents() {
		return students;
	}
	public void setStudents(List<Student> students) {
		this.students = students;
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
	public List<Course> getCourse() {
		return course;
	}
	public void setCourse(List<Course> course) {
		this.course = course;
	}
	@Override
	public String toString() {
		return "StudentInfo [studentInfoId=" + studentInfoId + ", students=" + students + ", course=" + course
				+ ", comeLate=" + comeLate + ", leaveEarlier=" + leaveEarlier + ", absenteeism=" + absenteeism + "]";
	}

	
}
