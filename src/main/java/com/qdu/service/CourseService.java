package com.qdu.service;

import com.qdu.pojo.Course;

public interface CourseService {
	
	public Course selectIdFromCourse(String courseName, String teacherMobile);

	public void updateQrImg(int courseId,String qrImg);
	
	public void insertCourse(Course course);

}
