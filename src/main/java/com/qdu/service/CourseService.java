package com.qdu.service;

import java.util.Date;
import java.util.List;

import com.qdu.pojo.Course;
import com.qdu.pojo.Student;

public interface CourseService {
	 
	public Course selectIdFromCourse(String courseName, String teacherMobile);

	public void updateQrImg(int courseId,String qrImg);
	
	public void insertCourse(Course course);
	
	public List<Course> selectCourseByTeacher(String teacherMobile);
	
	public Course selectCourseById(int courseId);
	
	public void updateCourse(String courseName, String courseType, int classCapacity, Date startTime, Date endTime,
			int currentYear, String schoolTem, int courseId);
	
	public void deleteCourseById(int courseId);
	
	public List<Student> selectStudentByMany(int courseId);
	
	public Course selectCourseIdById(int courseId);

}
