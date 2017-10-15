package com.qdu.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qdu.dao.CourseDao;
import com.qdu.pojo.Course;
import com.qdu.service.CourseService;

@Transactional
@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	private CourseDao courseDaoImpl;
	@Override
	public void insertCourse(Course course) {
		courseDaoImpl.insertCourse(course);
	}
	@Override
	public Course selectIdFromCourse(String courseName, String teacherMobile) {
		return courseDaoImpl.selectIdFromCourse(courseName, teacherMobile);
	}
	@Override
	public void updateQrImg(int courseId,String qrImg) {
		courseDaoImpl.updateQrImg(courseId, qrImg);
	}

}
