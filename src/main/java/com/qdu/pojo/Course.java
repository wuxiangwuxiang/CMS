package com.qdu.pojo;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;

public class Course implements Serializable{
	private int courseId;
	private String courseName;
	private String courseType;
	private int classCapacity;
	private String startTime;
	private String endTime;
	private int currentYear;
	private String schoolTem;
	private String qrImg;
	private List<Clazz> clazz;
	private Teacher teacher;
	private List<StudentInfo> studentInfo;
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseType() {
		return courseType;
	}
	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}
	public int getClassCapacity() {
		return classCapacity;
	}
	public void setClassCapacity(int classCapacity) {
		this.classCapacity = classCapacity;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public int getCurrentYear() {
		return currentYear;
	}
	public void setCurrentYear(int currentYear) {
		this.currentYear = currentYear;
	}
	public String getSchoolTem() {
		return schoolTem;
	}
	public void setSchoolTem(String schoolTem) {
		this.schoolTem = schoolTem;
	}
	public String getQrImg() {
		return qrImg;
	}
	public void setQrImg(String qrImg) {
		this.qrImg = qrImg;
	}
	public List<Clazz> getClazz() {
		return clazz;
	}
	public void setClazz(List<Clazz> clazz) {
		this.clazz = clazz;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public List<StudentInfo> getStudentInfo() {
		return studentInfo;
	}
	public void setStudentInfo(List<StudentInfo> studentInfo) {
		this.studentInfo = studentInfo;
	}


	
}
