package com.qdu.service;

import com.qdu.pojo.Teacher;
import com.qdu.pojo.Test;

public interface TestService {

	public Test selectTestById(int id);
	
	public void insertTeacher(Teacher teacher);
	 
	public Teacher selectTeacherByEmail(String teacherMobile);
	
}
