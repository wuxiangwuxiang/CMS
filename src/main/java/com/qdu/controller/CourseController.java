package com.qdu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@Autowired CourseService courseServiceImpl;
	@Autowired TeacherService teacherServiceImpl;
	@Autowired ClazzService clazzServiceImpl;
	@Autowired StudentInfoService studentInfoServiceImpl;

	// 教师插入课程
	@RequestMapping(value = "/insertCourse.do", method = RequestMethod.POST)
	public String insertCourse(Course course, Clazz clazz, ModelMap map, HttpServletRequest request) throws Exception {
		courseServiceImpl.insertCourse(course);
		String rono = request.getParameter("teacher.teacherMobile");
		Teacher teacher = teacherServiceImpl.selectTeacherByEmail(rono);
		String courseName = request.getParameter("courseName");
		String teacherName = teacher.getTeacherName();
		String current = request.getParameter("currentYear");
		String tem = request.getParameter("schoolTem");
		Course course2 = courseServiceImpl.selectIdFromCourse(courseName, teacher.getTeacherMobile());
		int courseId = course2.getCourseId();
		String teacherMobile = teacher.getTeacherMobile();
		System.out.println("$%$%$$%" + teacherMobile);
		System.out.println("courseId: " + courseId);
		String text = "http://192.168.11.229:8080/ClassManageSys/qr.jsp?teacherMobile=" + teacherMobile + "&courseId="
				+ courseId + "&courseName=" + courseName.replaceAll("\\+", "%2B") + "&teacherName=" + teacherName
				+ "&currentTime=" + current + "&tem=" + tem;
		testQR tQr = new testQR(text, courseName, teacherName);
		// 获取二维码图片名称
		String qrImg = tQr.createQR(request);
		// 获取刚刚插入的课程
		// 更新班级信息
		// String clazzName = request.getParameter("clazzName");
		// Clazz clazz2 = clazzServiceImpl.selectClazzByAll(clazzName,
		// teacher.getTeacherMobile(), Integer.parseInt(current));
		// clazzServiceImpl.updateClazzOfCourseId(clazz2.getClazzId(),
		// course2.getCourseId());
		// 以更新的方式插入二维码图片信息回数据库
		courseServiceImpl.updateQrImg(course2.getCourseId(), qrImg);
		System.out.println(qrImg);
		// 返回教师页
		Teacher teacher2 = teacherServiceImpl.selectTeacherByEmail(rono);
		List<Course> courses = courseServiceImpl.selectCourseByTeacher(teacher2.getTeacherMobile());
		map.addAttribute("courses", courses);
		map.addAttribute("teacher", teacher2);
		return "teacherPage";
	}

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

	@RequestMapping(value = "/forsearchClazz.do")
	public String forInsertClazz(int courseId, ModelMap map) {
		Course course = courseServiceImpl.selectCourseById(courseId);
		System.out.println(course.getCourseName());
		map.put("course", course);
		return "clazzInfo";
	}

	@RequestMapping(value = "/forChangeCousrInfo.do")
	public String forChangeCousrInfo(int courseId, ModelMap map) {
		Course course = courseServiceImpl.selectCourseById(courseId);
		map.put("course", course);
		return "changeCourse";
	}

	@RequestMapping(value = "/changeCourse.do")
	public String changeCourse(Course course, ModelMap map,HttpServletRequest request) throws Exception {
		System.out.println(request.getParameter("courseId"));
		courseServiceImpl.updateCourse(course);
		String rono = request.getParameter("teacherMobile");
		System.out.println("rono:" + rono);
		Teacher teacher = teacherServiceImpl.selectTeacherByEmail(rono);
		String courseName = request.getParameter("courseName");
		String teacherName = teacher.getTeacherName();
		System.out.println("老师：" + teacherName);
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
	
//	@RequestMapping(value = "/deleteCourseById.do")
//	public String deleteCourseById(int courseId,ModelMap map){
//		Course course = courseServiceImpl.selectCourseById(courseId);
//		studentInfoServiceImpl.deleteStudentInfoByCourse(courseId);
//		List<Clazz> clazzs = clazzServiceImpl.clazzListByClazzId(courseId);
//		for(Clazz clazz : clazzs){
//			clazzServiceImpl.updateClazzByCourseId(clazz.getClazzId());
//		}
//		courseServiceImpl.deleteCourseById(courseId);
//		Teacher teacher = course.getTeacher();
//		List<Course> courses  = courseServiceImpl.selectCourseByTeacher(teacher.getTeacherMobile());
//		map.addAttribute("courses", courses);
//		map.put("teacher", teacher);
//		return "teacherPage";
//	}
	@RequestMapping(value = "/deleteCourseById.do")
    public @ResponseBody Map<String, Object> messageTarget(int courseId) {
		studentInfoServiceImpl.deleteStudentInfoByCourse(courseId);
		List<Clazz> clazzs = clazzServiceImpl.clazzListByClazzId(courseId);
		for(Clazz clazz : clazzs){
			clazzServiceImpl.updateClazzByCourseId(clazz.getClazzId());
		}
		courseServiceImpl.deleteCourseById(courseId);
        Map<String, Object> userMap = new HashMap<String, Object>();
        userMap.put("messages", "删除成功");
        System.out.println("删除成功啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊");
        return userMap;
    }
}
