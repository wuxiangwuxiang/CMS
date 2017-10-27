package com.qdu.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qdu.aop.SystemLog;
import com.qdu.pojo.Clazz;
import com.qdu.pojo.Course;
import com.qdu.pojo.Teacher;
import com.qdu.qr.testQR;
import com.qdu.service.ClazzService;
import com.qdu.service.CourseService;
import com.qdu.service.StudentInfoService;
import com.qdu.service.TeacherService;

@Controller
@RequestMapping(value = "/course")
public class CourseController {

	@Autowired
	CourseService courseServiceImpl;
	@Autowired
	TeacherService teacherServiceImpl;
	@Autowired
	ClazzService clazzServiceImpl;
	@Autowired
	StudentInfoService studentInfoServiceImpl;

	// 教师添加课程
	@SystemLog(module="教师",methods="日志管理-添加课程")
	@RequestMapping(value = "/insertCourse.do")
	public @ResponseBody Map<String, Object> insertCourse(String teacherMobile,String courseName,String courseType,String classCapacity,
			@DateTimeFormat(pattern = "yyyy-MM-dd") Date startTime,@DateTimeFormat(pattern = "yyyy-MM-dd") Date endTime,String currentYear,String schoolTem, ModelMap map,
			HttpServletRequest request) throws Exception {
		System.out.println("插入开始");
		Course course = new Course();
		Teacher teacher = teacherServiceImpl.selectTeacherByEmail(teacherMobile);
		course.setTeacher(teacher);
		course.setCourseName(courseName);
		course.setCourseType(courseType);
		course.setClassCapacity(Integer.parseInt(classCapacity));
		course.setStartTime(startTime);
		course.setEndTime(endTime);
		course.setCurrentYear(Integer.parseInt(currentYear));
		course.setSchoolTem(schoolTem);
		System.out.println(courseName +">>><<<"+startTime);
		courseServiceImpl.insertCourse(course);
		String teacherName = teacher.getTeacherName();
		String current = currentYear;
		String tem =schoolTem;
		Course course2 = courseServiceImpl.selectIdFromCourse(courseName, teacherMobile);
		int courseId = course2.getCourseId();
		System.out.println("courseId: " + courseId);
		String text = "http://192.168.137.236:8080/ClassManageSys/qr.jsp?teacherMobile=" + teacherMobile + "&courseId="
				+ courseId + "&courseName=" + courseName.replaceAll("\\+", "%2B") + "&teacherName=" + teacherName
				+ "&currentTime=" + current + "&tem=" + tem;
		testQR tQr = new testQR(text, courseName, teacherName);
		// 获取二维码图片名称
		String qrImg = tQr.createQR(request);
		// 以更新的方式插入二维码图片信息回数据库
		courseServiceImpl.updateQrImg(course2.getCourseId(), qrImg);
		System.out.println(qrImg);
		Map<String, Object> userMap = new HashMap<String, Object>();
		userMap.put("message", "添加成功");
		return userMap;
	}
	//二维码扫描后
	@SystemLog(module="学生",methods="日志管理-扫描二维码")
	@RequestMapping(value = "/createQrNew.do")
	public String createQrNew(ModelMap map, HttpServletRequest request) {
		System.out.println("进入");
		String teacherMobile = request.getParameter("teacherMobile");
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		Teacher teacher = teacherServiceImpl.selectTeacherByEmail(teacherMobile);
		Course course = courseServiceImpl.selectCourseById(courseId);
		List<Clazz> clazzs = clazzServiceImpl.selectClazzByCourse(courseId);
		map.put("course", course);
		map.put("teacher", teacher);
		map.put("clazz", clazzs);
		return "qrStudent";
	}
    //查询课程通过id
	@SystemLog(module="教师",methods="日志管理-获取课程列表")
	@RequestMapping(value = "/forsearchClazz.do")
	public String forInsertClazz(int courseId, ModelMap map) {
		Course course = courseServiceImpl.selectCourseById(courseId);
		System.out.println(course.getCourseName());
		map.put("course", course);
		return "clazzInfo";
	}
    //修改课程信息准备
	@RequestMapping(value = "/forChangeCousrInfo.do")
	public String forChangeCousrInfo(int courseId, ModelMap map) {
		Course course = courseServiceImpl.selectCourseById(courseId);
		map.put("course", course);
		return "changeCourse";
	}
    //修改课程信息
	@SystemLog(module="教师",methods="日志管理-修改课程")
	@RequestMapping(value = "/changeCourse.do")
	public String changeCourse(Course course, ModelMap map, HttpServletRequest request) throws Exception {
		courseServiceImpl.updateCourse(course);
		String rono = request.getParameter("teacherMobile");
		Teacher teacher = teacherServiceImpl.selectTeacherByEmail(rono);
		String courseName = request.getParameter("courseName");
		String teacherName = teacher.getTeacherName();
		String current = request.getParameter("currentYear");
		String tem = request.getParameter("schoolTem");
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		String teacherMobile = teacher.getTeacherMobile();
		String text = "http://192.168.11.229:8080/ClassManageSys/qr.jsp?teacherMobile=" + teacherMobile + "&courseId="
				+ courseId + "&courseName=" + courseName.replaceAll("\\+", "%2B") + "&teacherName=" + teacherName
				+ "&currentTime=" + current + "&tem=" + tem;
		testQR tQr = new testQR(text, courseName, teacherName);
		String qrImg = tQr.createQR(request);
		courseServiceImpl.updateQrImg(courseId, qrImg);
		Teacher teacher2 = teacherServiceImpl.selectTeacherByEmail(rono);
		List<Course> courses = courseServiceImpl.selectCourseByTeacher(rono);
		map.addAttribute("courses", courses);
		map.addAttribute("teacher", teacher2);
		return "teacherPage";
	}
    //删除课程信息通过id
	@SystemLog(module="教师",methods="日志管理-删除课程")
	@RequestMapping(value = "/deleteCourseById.do")
	public @ResponseBody Map<String, Object> messageTarget(int courseId) {
		studentInfoServiceImpl.deleteStudentInfoByCourse(courseId);
		List<Clazz> clazzs = clazzServiceImpl.clazzListByClazzId(courseId);
		for (Clazz clazz : clazzs) {
			clazzServiceImpl.updateClazzByCourseId(clazz.getClazzId());
		}
		courseServiceImpl.deleteCourseById(courseId);
		Map<String, Object> userMap = new HashMap<String, Object>();
		userMap.put("messages", "删除成功");
		return userMap;
	}
}
