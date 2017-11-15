package com.qdu.serviceimpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qdu.dao.CourseDao;
import com.qdu.pojo.Course;
import com.qdu.pojo.Student;
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
	@Override
	public List<Course> selectCourseByTeacher(String teacherMobile) {
		return courseDaoImpl.selectCourseByTeacher(teacherMobile);
	}
	@Override
	public Course selectCourseById(int courseId) {
		return courseDaoImpl.selectCourseById(courseId);
	}
	@Override
	public void updateCourse(String courseName, String courseType, int classCapacity, Date startTime, Date endTime,
			int currentYear, String schoolTem, int courseId) {
		courseDaoImpl.updateCourse(courseName, courseType, classCapacity, startTime, endTime, currentYear, schoolTem, courseId);
	}
	@Override
	public void deleteCourseById(int courseId) {
        courseDaoImpl.deleteCourseById(courseId);		
	}
	@Override
	public List<Student> selectStudentByMany(int courseId) {
		return courseDaoImpl.selectStudentByMany(courseId);
	}
	@Override
	public Course selectCourseIdById(int courseId) {
		return courseDaoImpl.selectCourseIdById(courseId);
	}
	


}
