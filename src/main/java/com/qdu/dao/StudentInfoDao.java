package com.qdu.dao;

import java.util.List;

import com.qdu.pojo.Student;
import com.qdu.pojo.StudentInfo;

public interface StudentInfoDao {
	
	public void insertStudentInfo(String studentRoNo,int courseId);
	
	public void deleteStudentInfoByCourse(int courseId);
	
	public StudentInfo selectStudentInfoByMany(String studentRoNo,int courseId);
	
	public void updateStudentInfoAboutSignIn(int studentInfoId,int signIn);
	
	public List<StudentInfo> selectInfoList(int courseId);
	
    public void updateStudentInfoAboutAbs(int studentInfoId,int absenteeism);
    
    public List<StudentInfo> selectInfoFromInfoAndStudent(int courseId);
    
    public List<StudentInfo> selectCourseByStudentRono(String studentRoNo);

}
