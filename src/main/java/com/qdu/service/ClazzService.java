package com.qdu.service;

import java.util.List;

import com.qdu.pojo.Clazz;

public interface ClazzService {
 
	public void insertClazz(Clazz clazz);
	
	public Clazz selectClazzByAll(String clazzName, String teacherMobile, int currentYear);
	
	public void updateClazzOfCourseId(int clazzId, int courseId);
	
	public List<Clazz> selectClazzByCourse(int courseId);
	}
