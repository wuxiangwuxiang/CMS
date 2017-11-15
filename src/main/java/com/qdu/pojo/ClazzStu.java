package com.qdu.pojo;

import java.io.Serializable;

public class ClazzStu implements Serializable{
	private int ClazzStuId;
	private String studentRoNo;
	private int clazzId;
	
	public int getClazzStuId() {
		return ClazzStuId;
	}
	public void setClazzStuId(int clazzStuId) {
		ClazzStuId = clazzStuId;
	}
	public String getStudentRoNo() {
		return studentRoNo;
	}
	public void setStudentRoNo(String studentRoNo) {
		this.studentRoNo = studentRoNo;
	}
	public int getClazzId() {
		return clazzId;
	}
	public void setClazzId(int clazzId) {
		this.clazzId = clazzId;
	}
	
	

}
