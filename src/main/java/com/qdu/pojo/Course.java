package com.qdu.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;

public class Course {
	private int courseId;
	private String courseName;
	private String courseType;
	private int classCapacity;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endTime;
	private int currentYear;
	private String schoolTem;
	private String qrImg;
	private List<Student> student;
	private List<Clazz> clazz;
	private Teacher teacher;
	private List<StudentInfo> studentInfo;

	
	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getQrImg() {
		return qrImg;
	}

	public void setQrImg(String qrImg) {
		this.qrImg = qrImg;
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String curent = sdf.format(startTime);
		return curent;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String curent = sdf.format(endTime);
		return curent;
	}

	public void setEndTime(Date endTime) {
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

	public List<Student> getStudent() {
		return student;
	}

	public void setStudent(List<Student> student) {
		this.student = student;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
		System.out.println(teacher.getTeacherMobile());
	}

	public List<StudentInfo> getStudentInfo() {
		return studentInfo;
	}

	public void setStudentInfo(List<StudentInfo> studentInfo) {
		this.studentInfo = studentInfo;
	}

	
	public List<Clazz> getClazzs() {
		return clazz;
	}

	public void setClazzs(List<Clazz> clazzs) {
		this.clazz = clazzs;
	}

	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", courseName=" + courseName + ", courseType=" + courseType
				+ ", classCapacity=" + classCapacity + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", currentYear=" + currentYear + ", schoolTem=" + schoolTem + ", qrImg=" + qrImg + ", student="
				+ student + ", clazz=" + clazz + ", teacher=" + teacher + ", studentInfo=" + studentInfo + "]";
	}

	

}
