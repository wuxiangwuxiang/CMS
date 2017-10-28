package com.qdu.service;

import com.qdu.pojo.StudentInfo;

public interface StudentInfoService {

	public void insertStudentInfo(String studentRoNo,int courseId);
	
	public void deleteStudentInfoByCourse(int courseId);
	
	public StudentInfo selectStudentInfoByMany(String studentRoNo, int courseId);
	
	public void updateStudentInfoAboutSignIn(int studentInfoId, int signIn);
	
}
