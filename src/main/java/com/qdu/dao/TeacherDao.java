package com.qdu.dao;

import com.qdu.pojo.Teacher;

public interface TeacherDao {
	
    public Teacher selectTeacherByEmail(String teacherMobile);
	
	public void insertTeacher(Teacher teacher);

}
