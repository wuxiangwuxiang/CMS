package com.qdu.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qdu.pojo.Clazz;
import com.qdu.pojo.Course;
import com.qdu.pojo.Teacher;
import com.qdu.service.ClazzService;
import com.qdu.service.CourseService;

@Controller
@RequestMapping(value = "/clazz")
public class ClazzController {
 
	@Autowired private ClazzService clazzServiceImpl;
	@Autowired private CourseService courseServiceImpl;
	//插入班级准备
	@RequestMapping(value = "/forInsertClazz.do")
	public String forInsertClazz(int courseId,ModelMap map){
		return "clazzInfo";
	}
	//插入班级
	@RequestMapping(value = "/insertClazz.do")
	public String insertClazz(ModelMap map,Clazz clazz){
		clazzServiceImpl.insertClazz(clazz);
		return "clazzInfo";
	}
	//添加课程准备
	@RequestMapping(value = "/forAddClazz.do")
	public String forAddClazz(int courseId,ModelMap map){
		Course course = courseServiceImpl.selectCourseById(courseId);
		map.put("course", course);
		return "addClazz";
	}
	//添加课程
	@RequestMapping(value = "/addClazz.do")
	public String addClazz(Clazz clazz,ModelMap map,HttpServletRequest request){
		clazzServiceImpl.insertClazz(clazz);
		int courseId = Integer.parseInt(request.getParameter("course.courseId"));
		Course course = courseServiceImpl.selectCourseById(courseId);
		map.put("course", course);
		return "clazzInfo";
	}
	//修改班级信息
	@RequestMapping(value="/changeClazzByAjax.do")
	public @ResponseBody Map<String, Object>
	changeClazzByAjax(int clazzId,String clazzName){
		System.out.println("欢迎");
		System.out.println(clazzId);
		System.out.println(clazzName);
		Clazz clazz = clazzServiceImpl.selectClazzById(clazzId);
		Map<String, Object> map = new HashMap<>();
		if(clazz != null){
			clazz.setClazzName(clazzName);
			clazzServiceImpl.updateClazzByClazzId(clazzId, clazzName);
			map.put("message", "修改成功");
		}else {
			map.put("message", "修改失败，可能是学期发生了改变");
		}
		return map;
	}
}
