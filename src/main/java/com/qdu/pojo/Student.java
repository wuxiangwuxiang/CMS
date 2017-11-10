package com.qdu.pojo;

import java.io.Serializable;
 
public class Student implements Serializable{
	private String studentRoNo;
	private String studentPassword;
	private String studentMobile;
	private String studentEmail;
	private String studentName;
	private String studentGender;
	private String studentPhoto;
	private String college; 
	private String special;
	private int intoSchoolYear;
	private String schoolRecord;
	private String birthDay;
	private String freeStyle;
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
	

	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getSpecial() {
		return special;
	}
	public void setSpecial(String special) {
		this.special = special;
	}
	public int getIntoSchoolYear() {
		return intoSchoolYear;
	}
	public void setIntoSchoolYear(int intoSchoolYear) {
		this.intoSchoolYear = intoSchoolYear;
	}
	public String getSchoolRecord() {
		return schoolRecord;
	}
	public void setSchoolRecord(String schoolRecord) {
		this.schoolRecord = schoolRecord;
	}
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	public String getFreeStyle() {
		return freeStyle;
	}
	public void setFreeStyle(String freeStyle) {
		this.freeStyle = freeStyle;
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
	
}
