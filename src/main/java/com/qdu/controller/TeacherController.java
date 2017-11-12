package com.qdu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qdu.aop.SystemLog;
import com.qdu.pojo.Course;
import com.qdu.pojo.Message;
import com.qdu.pojo.Student;
import com.qdu.pojo.Teacher;
import com.qdu.service.ClazzService;
import com.qdu.service.CourseService;
import com.qdu.service.MessageService;
import com.qdu.service.StudentService;
import com.qdu.service.TeacherService;
import com.qdu.serviceimpl.StudentServiceImpl;
import com.qdu.util.JavaEmailSender;
import com.qdu.util.MD5Util;
import com.qdu.util.Page;

@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {
	// 注解注入服务，应用 Spring IOC功能
	@Autowired
	private TeacherService teacherServiceImpl;
	@Autowired
	private CourseService courseServiceImpl;
	@Autowired
	private ClazzService clazzServiceImpl;
	@Autowired 
	private MessageService messageServiceImpl;
	@Autowired
	private StudentService studentServiceImpl;

	// 教师登录准备
	@RequestMapping(value = "/forTeacherLogin.do")
	public String forTeacherLogin() {
		return "teacherLogin";
	}

	// 教师注册准备
	@RequestMapping(value = "/forTeacherRegister.do")
	public String forTeacherRegister() {
		return "addTeacher";
	}
 
	// 教师登录
	@SystemLog(module = "教师", methods = "日志管理-登录")
	@RequestMapping(value = "/teacherLogin.do")
	public String teacherLogin(HttpServletRequest request,String pageNow,String id,String password, ModelMap map) {
		if(id == null){
			id = request.getParameter("teacherId");
		}
		if(password == null){
			id = password = request.getParameter("password");
		}
		Teacher teacher = teacherServiceImpl.selectTeacherByEmail(id);
		if (teacher != null) {
			if (id.equals(teacher.getTeacherMobile())) {
				if(MD5Util.md5(password, "teacher").equals(teacher.getTeacherPassword()) || password.equals(teacher.getTeacherPassword())){
				Page page = null;
				 int totalCount = messageServiceImpl.selectMessageTotalCount(teacher.getTeacherMobile());
				 String repageNow = request.getParameter("repageNow");
				 if(repageNow != null){
					 pageNow = repageNow;
				 }
				 page = new Page(totalCount, Integer.parseInt(pageNow));
				map.addAttribute("teacher", teacher);
				List<Course> courses = courseServiceImpl.selectCourseByTeacher(teacher.getTeacherMobile());
				map.addAttribute("courses", courses);
				int messageCount = messageServiceImpl.selectMessageCount(teacher.getTeacherMobile());
				map.put("messageCount", messageCount);
				List<Message> messages = messageServiceImpl.selectUnreadMessage(teacher.getTeacherMobile(),page.getStartPos());
				map.put("message", messages);
				map.put("page", page);
				// session的id存一下
				request.getSession().setAttribute("UserId", id);
				return "teacherPage";
			} else
				return "failer";
		}
	}
		return "failer";
	}

	// 教师头一次登录
	@SystemLog(module = "教师", methods = "日志管理-跳转首页")
	@RequestMapping(value = "/teacherFirstLogin.do")
	public String teacherFirstLogin(HttpServletRequest request,String pageNow, ModelMap map, String teacherMobile) {
		Teacher teacher = teacherServiceImpl.selectTeacherByEmail(teacherMobile);
		Page page = null;
		String repageNow = request.getParameter("repageNow");
		 if(repageNow != null){
			 pageNow = repageNow;
		 }else{
			pageNow = 1+"";
		}
		 int totalCount = messageServiceImpl.selectMessageTotalCount(teacher.getTeacherMobile());
		 page = new Page(totalCount, Integer.parseInt(pageNow));
		 map.put("page", page);
		 
		map.addAttribute("teacher", teacher);
		List<Course> courses = courseServiceImpl.selectCourseByTeacher(teacher.getTeacherMobile());
		map.addAttribute("courses", courses);
		int messageCount = messageServiceImpl.selectMessageCount(teacherMobile);
		map.put("messageCount", messageCount);
		List<Message> messages = messageServiceImpl.selectUnreadMessage(teacherMobile,page.getStartPos());
		map.put("message", messages);
		return "teacherPage";
	}

	// ajax验证是否手机号已经注册过
	@SystemLog(module = "教师", methods = "日志管理-验证账号")
	@RequestMapping(value = "/confirmExitsTeacher.do")
	public @ResponseBody Map<String, Object> confirmExitsTeacher(HttpServletRequest request, String teacherMobile) {
		System.out.println(teacherMobile);
		request.getSession().setAttribute("UserId", null);
		request.getSession().setAttribute("UserId", teacherMobile);
		Map<String, Object> map = new HashMap<>();
		Teacher teacher = teacherServiceImpl.selectTeacherByEmail(teacherMobile);
		if (teacher == null) {
			System.out.println("老师不存在");
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}

	// ajax验证密码
	@SystemLog(module = "教师", methods = "日志管理-登录密码验证")
	@RequestMapping(value = "/confirmTeacherPassWord.do")
	@ResponseBody
	public Map<String, Object> confirmTeacherPassWord(String password, String teacherMobile) {
		Teacher teacher = teacherServiceImpl.selectTeacherByEmail(teacherMobile);
		Map<String, Object> map = new HashMap<>();
		if (teacher != null && MD5Util.md5(password, "teacher").equals(teacher.getTeacherPassword())) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}

	// 教师注册
	@SystemLog(module = "教师", methods = "日志管理-注册")
	@RequestMapping(value = "/insertTeacher.do")
	public String insertTeacher(Teacher teacher, ModelMap map, HttpServletRequest request) {
		request.getSession().setAttribute("UserId", teacher.getTeacherMobile());
		String password = request.getParameter("teacherPassword");
		teacher.setTeacherPassword(MD5Util.md5(password, "teacher"));
		teacherServiceImpl.insertTeacher(teacher);
		String teacherMobile = request.getParameter("teacherMobile");
		Teacher teacher2 = teacherServiceImpl.selectTeacherByEmail(teacherMobile);
		List<Course> courses = courseServiceImpl.selectCourseByTeacher(teacher.getTeacherMobile());
		map.addAttribute("courses", courses);
		map.addAttribute("teacher", teacher2);
		return "waitForTeacherRegister";
	}

	// 老师更改密码
	@SystemLog(module = "教师", methods = "日志管理-密码更改")
	@RequestMapping(value = "/updateTeacherPassWord.do")
	public String updateTeacherPassWord(String teacherMobile, String teacherPassword, ModelMap map) {
		teacherServiceImpl.updateTeacherPassWord(teacherMobile, MD5Util.md5(teacherPassword, "teacher"));
		List<Course> courses = courseServiceImpl.selectCourseByTeacher(teacherMobile);
		Teacher teacher = teacherServiceImpl.selectTeacherByEmail(teacherMobile);
		map.addAttribute("courses", courses);
		map.addAttribute("teacher", teacher);
		return "waitForTeacherRegister";
	}

	// 教师找回密码
	@SystemLog(module = "教师", methods = "日志管理-找回密码(跳转)")
	@RequestMapping(value = "/getTeacherPasswordBack.do")
	public String getTeacherPasswordBack() {
		return "teacherGetPasswordBack";
	}

	// 教师变更邮箱
	@SystemLog(module = "教师", methods = "日志管理-变更邮箱")
	@RequestMapping(value = "/changeTeaMail.do")
	@ResponseBody
	public Map<String, Object> changeTeaMail(String teacherEmail, String teacherMobile) {
		teacherServiceImpl.changeTeaMail(teacherMobile, teacherEmail);
		Map<String, Object> map = new HashMap<>();
		map.put("result", true);
		return map;
	}

	// ajax试探教师信息
	@SystemLog(module = "教师", methods = "日志管理-找回密码(验证)")
	@RequestMapping(value = "/forTeacherReGetPass.do")
	@ResponseBody
	public Map<String, Object> forTeacherReGetPass(String mobile, String name, String mail) throws Exception {
		Map<String, Object> map = new HashMap<>();
		Teacher teacher = teacherServiceImpl.selecctTeacherByThree(mobile, name, mail);
		if (teacher != null) {
			Random random = new Random();
			char a1 = (char) (random.nextInt(24) + 97);
			char a2 = (char) (random.nextInt(14) + 97);
			int x = random.nextInt(9000) + 1000;
			String cc = a1 + "" + x + a2;
			System.out.println(cc);
			teacherServiceImpl.updateTeacherPassWord(mobile, MD5Util.md5(cc, "teacher"));
			String EMAIL = mail;
			String TITLE = teacher.getTeacherName() + ",找回密码";// 标题
			String CONTENT = "临时密码为:" + "   " + "[" + cc + "]" + "\n" + "为了安全，请尽快使用此密码登录后修改密码"; // 内容
			JavaEmailSender.sendEmail(EMAIL, TITLE, CONTENT);
			map.put("result", true);
		} else {
			map.put("result", "查无此人");
		}
		return map;
	}

	// 查看具体消息
	@SystemLog(module = "教师", methods = "日志管理-查看消息")
	@RequestMapping(value = "/getMessageByAjax.do")
	@ResponseBody
	public Map<String, Object> getMessageByAjax(int messageId) {
		Map<String, Object> map = new HashMap<>();
		messageServiceImpl.uodateMesageHaveread(messageId);
		Message message = messageServiceImpl.selectMessageById(messageId);
		Student student = studentServiceImpl.selectStudentByNo(message.getMessageSender());
		if (student != null) {
			map.put("student", student);
		}
		map.put("mmm", message);
		return map;
	}

	// ajax获取消息数量
	@RequestMapping(value = "/gggetMessageCount.do")
	@ResponseBody
	public Map<String, Object> gggetMessageCount(String teacherMobile) {
		Map<String, Object> map = new HashMap<>();
		int messages = messageServiceImpl.selectMessageCount(teacherMobile);
		map.put("message", messages);
		return map;
	}
	

}
