package com.qdu.service;

import com.qdu.pojo.Teacher;

public interface TeacherService {
	
public void insertTeacher(Teacher teacher);
		
	public Teacher selectTeacherByEmail(String teacherMobile);
	
	public void updateTeacherPassWord(String teacherMobile,String teacherPassword);
 
}
