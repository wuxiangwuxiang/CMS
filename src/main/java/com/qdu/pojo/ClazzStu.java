package com.qdu.pojo;

import java.io.Serializable;

public class ClazzStu implements Serializable{
	private int ClazzStuId;
	private Student student;
	private Clazz clazz;
	
	public int getClazzStuId() {
		return ClazzStuId;
	}
	public void setClazzStuId(int clazzStuId) {
		ClazzStuId = clazzStuId;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public Clazz getClazz() {
		return clazz;
	}
	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}
	
	

}
