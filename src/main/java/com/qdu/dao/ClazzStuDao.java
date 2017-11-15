package com.qdu.dao;

import java.util.List;

import com.qdu.pojo.ClazzStu;

public interface ClazzStuDao {
	
	public int insertClazzStu(ClazzStu clazzStu);
	
	public List<ClazzStu> selectClazzStuById(int clazzId);
	
	public int deleteClazzStuByClazzId(int clazzId);
	
	public ClazzStu selectClazzStuByDouble(int clazzId,String studentRoNo);

}
