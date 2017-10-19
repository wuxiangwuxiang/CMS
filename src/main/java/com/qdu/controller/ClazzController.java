package com.qdu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.qdu.pojo.Clazz;
import com.qdu.pojo.Course;
import com.qdu.service.ClazzService;
import com.qdu.service.CourseService;

@Controller
@RequestMapping(value = "/clazz")
public class ClazzController {
 
	@Autowired private ClazzService clazzServiceImpl;
	@Autowired private CourseService courseServiceImpl;
	
	@RequestMapping(value = "/forInsertClazz.do")
	public String forInsertClazz(int courseId,ModelMap map){
		return "clazzInfo";
	}
	
	@RequestMapping(value = "/insertClazz.do")
	public String insertClazz(ModelMap map,Clazz clazz){
		clazzServiceImpl.insertClazz(clazz);
		return "clazzInfo";
	}
	@RequestMapping(value = "/forAddClazz.do")
	public String forAddClazz(int courseId,ModelMap map){
		Course course = courseServiceImpl.selectCourseById(courseId);
		map.put("course", course);
		return "addClazz";
	}
	@RequestMapping(value = "/addClazz.do")
	public String addClazz(Clazz clazz,ModelMap map,HttpServletRequest request){
		clazzServiceImpl.insertClazz(clazz);
		int courseId = Integer.parseInt(request.getParameter("course.courseId"));
		Course course = courseServiceImpl.selectCourseById(courseId);
		map.put("course", course);
		return "clazzInfo";
	}
}
