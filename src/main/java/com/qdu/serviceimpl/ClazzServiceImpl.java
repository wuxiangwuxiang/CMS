package com.qdu.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qdu.dao.ClazzDao;
import com.qdu.daoimpl.CourseDaoImpl;
import com.qdu.pojo.Clazz;
import com.qdu.pojo.Student;
import com.qdu.service.ClazzService;

@Transactional
@Service
public class ClazzServiceImpl implements ClazzService{

	@Autowired 
	private ClazzDao clazzDaoImpl;
	@Override
	public int insertClazz(Clazz clazz) {
		return clazzDaoImpl.insertClazz(clazz);
	}
	@Override
	public Clazz selectClazzByAll(String clazzName, String teacherMobile, int currentYear) {
		return clazzDaoImpl.selectClazzByAll(clazzName, teacherMobile, currentYear);
	}
	@Override
	public void updateClazzOfCourseId(int clazzId, int courseId) {
		clazzDaoImpl.updateClazzOfCourseId(clazzId, courseId);
	}
	@Override
	public List<Clazz> selectClazzByCourse(int courseId) {
		return clazzDaoImpl.selectClazzByCourse(courseId);
	}
	@Override
	public List<Clazz> clazzListByClazzId(int courseId) {
		return clazzDaoImpl.selectClazzByCourse(courseId);
	}
	@Override
	public void updateClazzByCourseId(int clazzId) {
		clazzDaoImpl.updateClazzByCourseId(clazzId);
	}
	@Override
	public void updateClazzByClazzId(int clazzId,String clazzName) {
		clazzDaoImpl.updateClazzByClazzId(clazzId, clazzName);
	}
	@Override
	public Clazz selectClazzById(int clazzId) {
		return clazzDaoImpl.selectClazzById(clazzId);
	}
	@Override
	public int deleteClazzById(int clazzId) {
		return clazzDaoImpl.deleteClazzById(clazzId);
	}
	@Override
	public int selectCountOfStudentByClazz(int clazzId) {
		return clazzDaoImpl.selectCountOfStudentByClazz(clazzId);
	}
	@Override
	public List<Clazz> selectClazzNameByCourse(int courseId) {
		return clazzDaoImpl.selectClazzNameByCourse(courseId);
	}

}
