package com.qdu.dao;

import com.qdu.pojo.StudentInfo;

public interface StudentInfoDao {
	
	public void insertStudentInfo(String studentRoNo,int courseId);
	
	public void deleteStudentInfoByCourse(int courseId);
	
	public StudentInfo selectStudentInfoByMany(String studentRoNo,int courseId);
	
	public void updateStudentInfoAboutSignIn(int studentInfoId,int signIn);

}
