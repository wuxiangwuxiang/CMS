package com.qdu.dao;

import java.util.List;

import com.qdu.pojo.Course;

public interface CourseDao {
	
	public Course selectIdFromCourse(String courseName,String teacherMobile);
	
	public void updateQrImg(int courseId,String qrImg);
	 
	public void insertCourse(Course course);
	
	public List<Course> selectCourseByTeacher(String teacherMobile);
	
	public Course selectCourseById(int courseId);

}
