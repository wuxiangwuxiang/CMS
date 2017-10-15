package com.qdu.pojo;

import java.util.List;

//学生考勤信息类
public class StudentInfo {

	private int studentInfoId;
	private List<Student> students;
	private List<Course> courses;
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
	public List<Course> getCourses() {
		return courses;
	}
	public void setCourses(List<Course> courses) {
		this.courses = courses;
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
	@Override
	public String toString() {
		return "StudentInfo [studentInfoId=" + studentInfoId + ", students=" + students + ", courses=" + courses
				+ ", comeLate=" + comeLate + ", leaveEarlier=" + leaveEarlier + ", absenteeism=" + absenteeism + "]";
	}
	
	
}
