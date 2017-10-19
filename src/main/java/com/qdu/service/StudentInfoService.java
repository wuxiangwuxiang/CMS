package com.qdu.service;


public interface StudentInfoService {

	public void insertStudentInfo(String studentRoNo,int courseId);
	
	public void deleteStudentInfoByCourse(int courseId);
	
}
