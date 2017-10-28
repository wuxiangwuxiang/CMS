package com.qdu.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qdu.dao.CourseDao;
import com.qdu.pojo.Course;
import com.qdu.pojo.Student;

@Repository
public class CourseDaoImpl implements CourseDao {

	@Autowired
	private SqlSessionFactory SqlSessionFactory;

	@Override
	public void insertCourse(Course course) {
		String statement = "com.qdu.mapping.CourseMapping.insertCourse";
		SqlSessionFactory.openSession().insert(statement, course);
	}

	@Override
	public Course selectIdFromCourse(String courseName, String teacherMobile) {
		String statement = "com.qdu.mapping.CourseMapping.selectIdFromCourse";
        Map<String,Object> map = new HashMap<>();
        map.put("courseName", courseName);
        map.put("teacherMobile",teacherMobile);
        return SqlSessionFactory.openSession().selectOne(statement, map);
	}

	@Override 
	public void updateQrImg(int courseId,String qrImg) {
		Map<String,Object> map = new HashMap<>();
		String statement = "com.qdu.mapping.CourseMapping.updateQrImg";
		map.put("courseId", courseId);
		map.put("qrImg", qrImg);
		SqlSessionFactory.openSession().update(statement, map);
	}

	@Override
	public List<Course> selectCourseByTeacher(String teacherMobile) {
		String statement = "com.qdu.mapping.CourseMapping.selectCourseList";
		return SqlSessionFactory.openSession().selectList(statement, teacherMobile);
	}

	@Override
	public Course selectCourseById(int courseId) {
		String statement = "com.qdu.mapping.CourseMapping.selectCourseById";
		return SqlSessionFactory.openSession().selectOne(statement, courseId);
	}

	@Override
	public void updateCourse(Course course) {
		String statement = "com.qdu.mapping.CourseMapping.updateCourse";
		SqlSessionFactory.openSession().update(statement, course);
	}

	@Override
	public void deleteCourseById(int courseId) {
		String statement = "com.qdu.mapping.CourseMapping.deleteCourseById";
		SqlSessionFactory.openSession().delete(statement, courseId);
	}

	@Override
	public List<Student> selectStudentByMany(int courseId) {
		String statement = "com.qdu.mapping.StudentMapping.selectStudentByMany";
		return SqlSessionFactory.openSession().selectList(statement, courseId);
	}

}
