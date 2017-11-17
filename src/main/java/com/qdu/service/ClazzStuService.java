package com.qdu.service;

import java.util.List;

import com.qdu.pojo.ClazzStu;

public interface ClazzStuService {
	
	public int insertClazzStu(int clazzId, String studentRoNo);
	
	public List<ClazzStu> selectClazzStuById(int clazzId);
	
	public int deleteClazzStuByClazzId(int clazzId);
	
	public ClazzStu selectClazzStuByDouble(int clazzId, String studentRoNo);
	
	public ClazzStu selectClazzStuByCourse(String studentRoNo, int courseId);
	
	public List<ClazzStu> selectClazzStuListByCourse(int courseId);

}
