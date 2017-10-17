package com.qdu.pojo;

public class Student {
	private String studentRoNo;
	private String studentPassword;
	private String studentMobile;
	private String studentEmail;
	private String studentName;
	private String studentGender;
	private String studentPhoto;
	private Teacher teacher;
	private Course course;
	private Clazz clazz;
	private StudentInfo studentInfo;
	public String getStudentRoNo() {
		return studentRoNo;
	}
	public void setStudentRoNo(String studentRoNo) {
		this.studentRoNo = studentRoNo;
	}
	
	public String getStudentPassword() {
		return studentPassword;
	}
	public void setStudentPassword(String studentPassword) {
		this.studentPassword = studentPassword;
	}
	public String getStudentMobile() {
		return studentMobile;
	}
	public void setStudentMobile(String studentMobile) {
		this.studentMobile = studentMobile;
	}
	public String getStudentEmail() {
		return studentEmail;
	}
	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentGender() {
		return studentGender;
	}
	public void setStudentGender(String studentGender) {
		this.studentGender = studentGender;
	}
	
	public String getStudentPhoto() {
		return studentPhoto;
	}
	public void setStudentPhoto(String studentPhoto) {
		this.studentPhoto = studentPhoto;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	
	public StudentInfo getStudentInfo() {
		return studentInfo;
	}
	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}
	
	public Clazz getClazz() {
		return clazz;
	}
	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}
//	@Override
//	public String toString() {
//		return "Student [studentRoNo=" + studentRoNo + ", studentPassword=" + studentPassword + ", studentMobile="
//				+ studentMobile + ", studentEmail=" + studentEmail + ", studentName=" + studentName + ", studentGender="
//				+ studentGender + ", studentPhoto=" + studentPhoto + ", teacher=" + teacher + ", course=" + course
//				+ ", clazz=" + clazz + ", studentInfo=" + studentInfo + "]";
//	}
	
}
