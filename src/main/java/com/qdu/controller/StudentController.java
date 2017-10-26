package com.qdu.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.qdu.aop.SystemLog;
import com.qdu.pojo.Student;
import com.qdu.service.StudentService;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	@Autowired
	private StudentService studentServiceImpl;

	// 学生登录准备
//	@RequestMapping(value = "/forStudentLogin.do")
//	public String selectStudentByNo() {
//		return "studentLogin";
//	}

	// 学生登录
	@RequestMapping(value = "/studentLogin.do")
	@SystemLog(module="学生登录",methods="日志管理-登录")
	public String studentLogin(HttpServletRequest request, ModelMap map) {
		String studentRoNo = request.getParameter("studentRoNo");
		String password = request.getParameter("studentPassword");
		System.out.println("正经登陆");
		Student student = studentServiceImpl.selectStudentByNo(studentRoNo);
		if(student != null){
			if(password.equals(student.getStudentPassword())){
				map.addAttribute("student", student);
				// session的id存一下
				request.getSession().setAttribute("UserId", null);
				request.getSession().setAttribute("UserId", studentRoNo);
				return "index";
			}
		}
		return "failer";
	}

	// 学生等待审核
	@RequestMapping(value = "/waitForRegister.do")
	public String waitForRegister() {
		return "waitForRegister";
	}
	//ajax验证学号是否已经存在
	@SystemLog(module="学生验证账号合法性",methods="日志管理-账号")
	@RequestMapping(value = "/confirmExitsStudent.do")
	public @ResponseBody Map<String, Object> confirmExitsStudent(HttpServletRequest request,String studentRoNo) {
		System.out.println("ajax探测用户学号是否存在"+studentRoNo);
		Map<String, Object> map = new HashMap<>();
		Student student = studentServiceImpl.selectStudentByNo(studentRoNo);
		if(student == null){
			System.out.println("用户不存在");
			map.put("result", true);
		}else {
			map.put("result", false);
		}
		//request.getSession().setAttribute("UserId", null);
		request.getSession().setAttribute("UserId", studentRoNo);
		return map;
	}
	
	//通过clazz找student
	@RequestMapping(value = "/selectStudentByClazzId.do",method = RequestMethod.POST)
	public String selectStudentByClazzId(int clazzId,ModelMap map){
		System.out.println(clazzId);
		List<Student> students = studentServiceImpl.selectStudentByClazzId(clazzId);
		map.put("student", students);
		return "studentInfo";
	}

	// 查找临时表学生信息
	@RequestMapping(value = "/selectStudentTemById.do")
	public String selectStudentTemById(ModelMap map, HttpServletRequest request) {
		String rono = request.getParameter("studentRoNo");
		Student student = studentServiceImpl.selectStudentByNo(rono);
		if (student != null) {
			map.addAttribute("student", student);
			return "showInfo";
		} else
			return "failer";
	}

	// 跳转到新建学生页面
	@RequestMapping(value = "/addStudent.do")
	public String addStudent(ModelMap map) {
		return "addStudent";
	}

	// 学生注册
	@RequestMapping(value = "/insertStudent.do", method = RequestMethod.POST)
	@SystemLog(module="学生注册",methods="日志管理-注册")
	public String insertTemporary(HttpServletRequest request, @RequestParam("file") MultipartFile file, ModelMap map,
			Student student) {
		String path = request.getSession().getServletContext().getRealPath("/") + "studentPhoto";
		System.out.println(path);
		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		// 保存 
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		studentServiceImpl.insertStudentByNo(student);
		System.out.println("学生注册成功");
		
		map.put("student", student);
		System.out.println(student.getStudentGender());
		request.getSession().setAttribute("UserId", null);
		request.getSession().setAttribute("UserId", student.getStudentRoNo());
		return "waitForRegister";
	}
	
	    //注册后跳转到首页
	    @SystemLog(module="跳转页面",methods="日志管理-注册成功跳转到首页")
		@RequestMapping(value="/exchangeStudent.do")
		public String exchangeStudent(String studentRoNo,ModelMap map){
			Student student = studentServiceImpl.selectStudentByNo(studentRoNo);
			map.put("student", student);
			return "index";
		}

}
