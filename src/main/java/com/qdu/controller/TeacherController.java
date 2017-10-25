package com.qdu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qdu.pojo.Course;
import com.qdu.pojo.Student;
import com.qdu.pojo.Teacher;
import com.qdu.service.ClazzService;
import com.qdu.service.CourseService;
import com.qdu.service.TeacherService;

@Controller
@RequestMapping(value="/teacher")
public class TeacherController {
    //注解注入服务，应用 Spring IOC功能
	@Autowired private TeacherService teacherServiceImpl;
	@Autowired private CourseService courseServiceImpl;
	@Autowired private ClazzService clazzServiceImpl;
	
	//教师登录准备
	@RequestMapping(value = "/forTeacherLogin.do")
	public String forTeacherLogin() {
		return "teacherLogin";
	}
	//教师注册准备
	@RequestMapping(value = "/forTeacherRegister.do")
	public String forTeacherRegister() {
		return "addTeacher";
	}
	//教师登录
	@RequestMapping(value="/teacherLogin.do")
	public String teacherLogin(HttpServletRequest request,ModelMap map){
		String id = request.getParameter("teacherId");
		String password = request.getParameter("password");
		Teacher teacher = teacherServiceImpl.selectTeacherByEmail(id);
		if(teacher != null){
		if(id.equals(teacher.getTeacherMobile()) && password.equals(teacher.getTeacherPassword())){
			map.addAttribute("teacher",teacher);
			List<Course> courses  = courseServiceImpl.selectCourseByTeacher(teacher.getTeacherMobile());
			map.addAttribute("courses", courses);
			// session的id存一下
			request.getSession().setAttribute("studentId", id);
			return "teacherPage";
		}else
			return "failer";
		}
		return "failer";
	}
	//ajax验证是否手机号已经注册过
	@RequestMapping(value = "/confirmExitsTeacher.do")
	public @ResponseBody Map<String, Object> confirmExitsTeacher(String teacherMobile) {
		System.out.println(teacherMobile);
		Map<String, Object> map = new HashMap<>();
	    Teacher teacher = teacherServiceImpl.selectTeacherByEmail(teacherMobile);
		if(teacher == null){
			System.out.println("老师不存在");
			map.put("result", true);
		}else {
			map.put("result", false);
		}
		return map;
	}
	//教师注册
	@RequestMapping(value = "/insertTeacher.do")
	public String insertTeacher(Teacher teacher, ModelMap map, HttpServletRequest request) {
		teacherServiceImpl.insertTeacher(teacher);
		String teacherMobile = request.getParameter("teacherMobile");
		Teacher teacher2 = teacherServiceImpl.selectTeacherByEmail(teacherMobile);
		map.addAttribute("teacher", teacher2);
		return "teacherPage";
	}
	
	
}
