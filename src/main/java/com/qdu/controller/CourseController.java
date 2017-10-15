package com.qdu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qdu.pojo.Course;
import com.qdu.pojo.Teacher;
import com.qdu.qr.testQR;
import com.qdu.service.CourseService;
import com.qdu.service.TeacherService;

@Controller
@RequestMapping(value = "/course")
public class CourseController {
	
	@Autowired CourseService courseServiceImpl;
	@Autowired TeacherService teacherServiceImpl;
	
	//教师插入课程
	@RequestMapping(value = "/insertCourse.do", method = RequestMethod.POST)
	public String insertCourse(Course course,ModelMap map,HttpServletRequest request) throws Exception{
		courseServiceImpl.insertCourse(course);
		String rono = request.getParameter("teacher.teacherMobile");
		Teacher teacher = teacherServiceImpl.selectTeacherByEmail(rono);
		String courseName = request.getParameter("courseName");
		String teacherName = teacher.getTeacherName();
		String current = request.getParameter("currentYear");
		String tem = request.getParameter("schoolTem");
		String text = "http://192.168.11.229:8080/ClassManageSys/qr.jsp?courseName=" + courseName.replaceAll("\\+", "%2B") + "&teacherName=" + teacherName + "&currentTime=" + current + "&tem=" + tem;
		testQR tQr = new testQR(text,courseName,teacherName);
		//获取二维码图片名称
		String qrImg = tQr.createQR(request);
		//获取刚刚插入的课程
		Course course2 = courseServiceImpl.selectIdFromCourse(courseName, teacher.getTeacherMobile());
		//以更新的方式插入二维码图片信息回数据库
		courseServiceImpl.updateQrImg(course2.getCourseId(),qrImg);
		System.out.println(qrImg);
		//返回教师页
		Teacher teacher2 = teacherServiceImpl.selectTeacherByEmail(rono);
		map.addAttribute("teacher", teacher2);		
		return "teacherPage";
	}
	

}
