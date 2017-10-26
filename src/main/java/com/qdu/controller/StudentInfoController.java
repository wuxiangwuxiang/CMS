package com.qdu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qdu.aop.SystemLog;
import com.qdu.pojo.Student;
import com.qdu.pojo.StudentInfo;
import com.qdu.service.StudentInfoService;
import com.qdu.service.StudentService;

@Controller
@RequestMapping(value = "/studentInfo")
public class StudentInfoController {
	
	@Autowired StudentInfoService studentInfoServiceImpl;
	@Autowired StudentService studentServiceImpl;
	
	//添加学生——课程    中间表
	@SystemLog(module="添加学生——课程    中间表",methods="日志管理-中间表")
	@RequestMapping(value = "/insertStudentInfo.do")
	public String insertStudentInfo(StudentInfo studentInfo,HttpServletRequest request){
		String studentRoNo = request.getParameter("studentRoNo");
		String password = request.getParameter("studentPassword");
		String courseId = request.getParameter("courseId");
		Student student = studentServiceImpl.selectStudentByNo(studentRoNo);
		if(student!=null && password.equals(student.getStudentPassword())){
			System.out.println("芝麻开门");
			studentInfoServiceImpl.insertStudentInfo(studentRoNo,Integer.parseInt(courseId));
			int clazzId = Integer.parseInt(request.getParameter("clazzId"));
			if(clazzId != 0){
			studentServiceImpl.updateStudentOfClazzId(studentRoNo, clazzId);
			}
			return "success";
		}else {
			return "failer";
		}
		
	}

}
