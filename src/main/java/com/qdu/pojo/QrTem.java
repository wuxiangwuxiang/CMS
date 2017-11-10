package com.qdu.pojo;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class QrTem implements Serializable{
	
	private int qrTemId;
	private int courseId;
	private String studentRoNo;
	private String qrTime;
	
	
	public int getQrTemId() {
		return qrTemId;
	}
	public void setQrTemId(int qrTemId) {
		this.qrTemId = qrTemId;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getStudentRoNo() {
		return studentRoNo;
	}
	public void setStudentRoNo(String studentRoNo) {
		this.studentRoNo = studentRoNo;
	}
	public String getQrTime() {
		return qrTime;
	}
	public void setQrTime(String qrTime) {
		this.qrTime = qrTime;
	}
	
	

}
