package com.qdu.dao;

import java.util.List;

import com.qdu.pojo.Clazz;

public interface ClazzDao {
	 
	public void insertClazz(Clazz clazz);
	
	public Clazz selectClazzByAll(String clazzName,String teacherMobile,int currentYear);
	
	public void updateClazzOfCourseId(int clazzId,int courseId);
	
	public List<Clazz> selectClazzByCourse(int courseId);
}
