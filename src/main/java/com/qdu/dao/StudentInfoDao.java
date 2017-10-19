package com.qdu.dao;

public interface StudentInfoDao {
	
	public void insertStudentInfo(String studentRoNo,int courseId);
	
	public void deleteStudentInfoByCourse(int courseId);

}
