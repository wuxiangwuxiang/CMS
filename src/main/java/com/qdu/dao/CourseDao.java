package com.qdu.dao;

import com.qdu.pojo.Course;

public interface CourseDao {
	
	public Course selectIdFromCourse(String courseName,String teacherMobile);
	
	public void updateQrImg(int courseId,String qrImg);
	
	public void insertCourse(Course course);

}
