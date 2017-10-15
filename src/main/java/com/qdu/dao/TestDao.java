package com.qdu.dao;

import com.qdu.pojo.Teacher;
import com.qdu.pojo.Test;

public interface TestDao{
	public Test getTestById(int id);
	
	public Teacher selectTeacherByEmail(String teacherMobile);
	
	public void insertTeacher(Teacher teacher);
	

}
