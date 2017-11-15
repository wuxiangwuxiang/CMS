package com.qdu.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qdu.dao.ClazzStuDao;
import com.qdu.pojo.ClazzStu;
import com.qdu.service.ClazzStuService;

@Transactional
@Service
public class ClazzStuServiceImpl implements ClazzStuService{
	
	@Autowired private ClazzStuDao clazzStuDaoImpl;

	@Override
	public List<ClazzStu> selectClazzStuById(int clazzId) {
		return clazzStuDaoImpl.selectClazzStuById(clazzId);
	}

	@Override
	public int deleteClazzStuByClazzId(int clazzId) {
		return clazzStuDaoImpl.deleteClazzStuByClazzId(clazzId);
	}

	@Override
	public ClazzStu selectClazzStuByDouble(int clazzId, String studentRoNo) {
		return clazzStuDaoImpl.selectClazzStuByDouble(clazzId, studentRoNo);
	}

	@Override
	public int insertClazzStu(int clazzId, String studentRoNo) {
		return clazzStuDaoImpl.insertClazzStu(clazzId, studentRoNo);
	}

	@Override
	public ClazzStu selectClazzStuByCourse(String studentRoNo, int courseId) {
	   return clazzStuDaoImpl.selectClazzStuByCourse(studentRoNo, courseId);
	}

}
