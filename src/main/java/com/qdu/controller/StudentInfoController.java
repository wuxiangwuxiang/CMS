package com.qdu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qdu.aop.SystemLog;
import com.qdu.pojo.Course;
import com.qdu.pojo.Message;
import com.qdu.pojo.Student;
import com.qdu.pojo.StudentInfo;
import com.qdu.pojo.Teacher;
import com.qdu.service.CourseService;
import com.qdu.service.MessageService;
import com.qdu.service.StudentInfoService;
import com.qdu.service.StudentService;
import com.qdu.service.TeacherService;
import com.qdu.util.MD5Util;

@Controller 
@RequestMapping(value = "/studentInfo")
public class StudentInfoController {

	@Autowired
	StudentInfoService studentInfoServiceImpl;
	@Autowired
	StudentService studentServiceImpl;
	@Autowired
	private TeacherService teacherServiceImpl;
	@Autowired 
	private MessageService messageServiceImpl;
	@Autowired
	private CourseService courseServiceImpl;

	// 添加学生——课程 中间表
	@SystemLog(module = "中间表", methods = "日志管理-添加中间表")
	@RequestMapping(value = "/insertStudentInfo.do")
	public String insertStudentInfo(StudentInfo studentInfo, HttpServletRequest request) {
		String studentRoNo = request.getParameter("studentRoNo");
		String password = request.getParameter("studentPassword");
		String courseId = request.getParameter("courseId");
		Student student = studentServiceImpl.selectStudentByNo(studentRoNo);
		if (student != null && MD5Util.md5(password, "juin").equals(student.getStudentPassword())) {
			System.out.println("芝麻开门");
			StudentInfo studentInfo2 = studentInfoServiceImpl.selectStudentInfoByMany(studentRoNo,
					Integer.parseInt(courseId));
			if (studentInfo2 == null) {
				studentInfoServiceImpl.insertStudentInfo(studentRoNo, Integer.parseInt(courseId));
			}
			System.out.println(222);
			int clazzId = Integer.parseInt(request.getParameter("clazzId"));
			if (clazzId != 0) {
				studentServiceImpl.updateStudentOfClazzId(studentRoNo, clazzId);
			}
			return "success";
		} else {
			return "failer";
		}

	}

	// 添加学生——课程 中间表 
	@SystemLog(module = "教师", methods = "日志管理-添加学生")
	@RequestMapping(value = "/insertStudentInfoByteacher.do")
	@ResponseBody
	public Map<String, Object> insertStudentInfoByteacher(String content,String teacherMobile, String studentRoNo,
			HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        int tem = 0;
        for(int i = 0; i < content.length(); i ++){
        	if(content.charAt(i) == 'c'){
        		tem = i;
        		break;
        	}
        }
        System.out.println("结束" + content.substring(0, tem));
        String aa = content.substring(0, tem);
        String bb = content.substring(tem+1);
        System.out.println(aa);
        System.out.println(bb);
        int courseId = Integer.parseInt(aa);
        int clazzId = Integer.parseInt(bb);
        System.out.println("CourseId>>>>>>>>: " + courseId);
        System.out.println("clazzId>>>>"+clazzId);
		StudentInfo studentInfo2 = studentInfoServiceImpl.selectStudentInfoByMany(studentRoNo,courseId);
		if (studentInfo2 == null) {
			studentInfoServiceImpl.insertStudentInfo(studentRoNo,courseId);
			if (clazzId != 0) {
				studentServiceImpl.updateStudentOfClazzId(studentRoNo, clazzId);
			}
			Teacher teacher = teacherServiceImpl.selectTeacherByEmail(teacherMobile);
			Student student = studentServiceImpl.selectStudentByNo(studentRoNo);
	        String time = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").format(new Date());
	        Message message =  new Message();
	        Course course = courseServiceImpl.selectCourseById(courseId);
			 message.setMessageSender(teacherMobile);
			 message.setMessageAccepter(studentRoNo);
			 message.setMessageTitle(teacher.getTeacherName() + "老师同意你加入课程< " + course.getCourseName() + 
					 ">(" + course.getCurrentYear() + "/" + course.getSchoolTem() + ")");
			 message.setSendTime(time);
			 message.setHaveRead("未读"); 
			 message.setMessageType("insertCourse");
			 message.setMessageContent(courseId+"");
			 messageServiceImpl.insertMessage(message);
			map.put("result", true);
		}else{
			map.put("result", false);
		} 
		return map;
	}
	

}
