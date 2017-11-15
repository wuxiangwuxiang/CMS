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
	public int insertClazzStu(ClazzStu clazzStu) {
		return clazzStuDaoImpl.insertClazzStu(clazzStu);
	}

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

}
