package com.qdu.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.qdu.aop.SystemLog;
import com.qdu.pojo.Course;
import com.qdu.pojo.FilePackage;
import com.qdu.pojo.LogEntity;
import com.qdu.pojo.Message;
import com.qdu.pojo.Student;
import com.qdu.pojo.Teacher;
import com.qdu.service.ClazzService;
import com.qdu.service.CourseService;
import com.qdu.service.FilePackageService;
import com.qdu.service.LogEntityService;
import com.qdu.service.MessageService;
import com.qdu.service.StudentService;
import com.qdu.service.TeacherService;
import com.qdu.serviceimpl.StudentServiceImpl;
import com.qdu.util.JavaEmailSender;
import com.qdu.util.MD5Util;
import com.qdu.util.Page;
import com.qdu.util.ResponseUtil;

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
	@Autowired
	private FilePackageService filePackageServiceImpl;
	@Autowired
	private LogEntityService logEntityServiceImpl;

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
	@SystemLog(module = "教师", methods = "日志管理-登录/刷新")
	@RequestMapping(value = "/teacherLogin.do")
	public String teacherLogin(HttpServletRequest request, String pageNow, String id, String password, ModelMap map) {
		if (id == null) {
			id = request.getParameter("teacherId");
		}
		if (password == null) {
			id = password = request.getParameter("password");
		}
		Teacher teacher = teacherServiceImpl.selectTeacherByEmail(id);
		if (teacher != null) {
			if (id.equals(teacher.getTeacherMobile())) {
				if (MD5Util.md5(password, "teacher").equals(teacher.getTeacherPassword())
						|| password.equals(teacher.getTeacherPassword())) {
					Page page = null;
					int totalCount = messageServiceImpl.selectMessageTotalCount(teacher.getTeacherMobile());
					String repageNow = request.getParameter("repageNow");
					if (repageNow != null) {
						pageNow = repageNow;
					}
					page = new Page(totalCount, Integer.parseInt(pageNow));
					map.addAttribute("teacher", teacher);
					List<Course> courses = courseServiceImpl.selectCourseByTeacher(teacher.getTeacherMobile());
					map.addAttribute("courses", courses);
					int messageCount = messageServiceImpl.selectMessageCount(teacher.getTeacherMobile());
					map.put("messageCount", messageCount);
					List<LogEntity> logEntities = logEntityServiceImpl.selectStudentLog(id);
					map.put("logEntity", logEntities);
					map.put("page", page);
					List<FilePackage> filePackages = filePackageServiceImpl.selectFileByUserId(teacher.getTeacherMobile());
					map.put("filePackages", filePackages);
					// session的id存一下
					request.getSession().setAttribute("UserId", id);
					return "teacherPage";
				} else
					return "failer";
			}
		}
		return "failer";
	}

	// 教师注销登录
	@SystemLog(module = "教师", methods = "日志管理-注销")
	@RequestMapping(value = "/exitLogin.do")
	@ResponseBody
	public void exitLogin(String teacherMobile, HttpServletRequest request) {
		// session的id存一下
		request.getSession().setAttribute("UserId", teacherMobile);
		// 数据库记录注销
	}

	// 教师头一次登录
	@SystemLog(module = "教师", methods = "日志管理-跳转首页")
	@RequestMapping(value = "/teacherFirstLogin.do")
	public String teacherFirstLogin(HttpServletRequest request, String pageNow, ModelMap map, String teacherMobile) {
		Teacher teacher = teacherServiceImpl.selectTeacherByEmail(teacherMobile);
		Page page = null;
		String repageNow = request.getParameter("repageNow");
		if (repageNow != null) {
			pageNow = repageNow;
		} else {
			pageNow = 1 + "";
		}
		int totalCount = messageServiceImpl.selectMessageTotalCount(teacher.getTeacherMobile());
		page = new Page(totalCount, Integer.parseInt(pageNow));
		map.put("page", page);

		map.addAttribute("teacher", teacher);
		List<Course> courses = courseServiceImpl.selectCourseByTeacher(teacher.getTeacherMobile());
		map.addAttribute("courses", courses);
		int messageCount = messageServiceImpl.selectMessageCount(teacherMobile);
		map.put("messageCount", messageCount);
//		List<Message> messages = messageServiceImpl.selectUnreadMessage(teacherMobile, page.getStartPos());
//		map.put("message", messages);
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

	// ajax更新寄教师信息
	@SystemLog(module = "教师", methods = "日志管理-完善信息")
	@RequestMapping(value = "/updateStudentInfoByAjax.do")
	@ResponseBody
	public Map<String, Object> updateStudentInfoByAjax(String teacherMobile, String college, String special,
			String schoolRecord, @DateTimeFormat(pattern = "yyyy-MM-dd") Date birthDay, String freeStyle) {
		Map<String, Object> map = new HashMap<>();
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		Teacher teacher = teacherServiceImpl.selectTeacherByMobile(teacherMobile);
		if (college != null) {
			teacher.setCollege(college);
		}
		if (special != null) {
			teacher.setSpecial(special);
		}
		if (birthDay != null) {
			teacher.setBirthDay(sdf2.format(birthDay));
		}
		if (freeStyle != null) {
			teacher.setFreeStyle(freeStyle);
		}
		if (schoolRecord != null) {
			teacher.setSchoolRecord(schoolRecord);
		}

		int tem = teacherServiceImpl.updateStudentextra(teacher);
		if (tem > 0) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}

	// 教师端多文件上传
	@SystemLog(module = "教师", methods = "日志管理-上传文件")
	@RequestMapping(value = "/teacherUpload.do")
	@ResponseBody
	public Map<String, Object> teacherUpload(@RequestParam("file") MultipartFile file, String teacherMobile,
			String fileType, HttpServletRequest request) throws IOException, Throwable {
		Map<String, Object> map = new HashMap<>();
	        String fileName = file.getOriginalFilename();  
	        String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);  
	        if(suffix.equals("zip")){
	        	fileType = "zip";
	        }else if(suffix.equals("rar")){
	        	fileType = "rar";
	        } else if (suffix.equals("7z")) {
	        	fileType = "7z";
			}else if(suffix.equals("pdf")){
				fileType = "pdf";
			}else if (suffix.equals("xls")) {
				fileType = "xls";
			}else if (suffix.equals("doc")) {
				fileType = "doc";
			}else if (suffix.equals("ppt")) {
				fileType = "ppt";
			}else if (suffix.equals("docx")) {
				fileType = "docx";
			}
		Teacher teacher = teacherServiceImpl.selectTeacherByMobile(teacherMobile);
		// 定义上传路径
		String path = request.getSession().getServletContext().getRealPath("/") + "file";
		boolean isFileUpload = ServletFileUpload.isMultipartContent(request);
		// 如果是文件上传类型
		if (isFileUpload) {
			// 得到文件上传工厂
			DiskFileItemFactory GongChang = new DiskFileItemFactory();
			// 处理文件上传核心类
			ServletFileUpload fileUpload = new ServletFileUpload(GongChang);
			// 设置文件上传类的编码格式
			fileUpload.setHeaderEncoding("UTF-8");
			// 得到文件名
			String time = new SimpleDateFormat("YYYY-MM-dd_HH_mm_ss").format(new Date());
			String time2 = new SimpleDateFormat("YYYY-MM-dd").format(new Date());
			String newfileName = fileName+"/"+time;
			FilePackage filePackage = new FilePackage();
			filePackage.setUserId(teacherMobile);
			filePackage.setFileName(newfileName);
			filePackage.setFileType(fileType);
			filePackage.setCreateTime(time2);
			// 拼接一个新的文件名
			// 路径
			File targetFile = new File(path, newfileName);
			System.out.println(targetFile.getAbsolutePath());
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				file.transferTo(targetFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			int tem = filePackageServiceImpl.insertFile(filePackage);
			if (tem > 0) {
				map.put("code", 0);
			}
		}

		return map;
	}
	//获取文件列表
	@SystemLog(module = "教师", methods = "日志管理-获取文件列表")
	@RequestMapping(value = "/getPrivateData.do")
	@ResponseBody
	public Map<String, Object> getPrivateData(String teacherMobile){
		Map<String, Object> map = new HashMap<>();
		List<FilePackage> filePackages = filePackageServiceImpl.selectFileByUserId(teacherMobile);
		map.put("filePackages", filePackages);
		return map;
	}
	//删除message
			@SystemLog(module = "教师", methods = "日志管理-删除消息")
			@RequestMapping(value = "/deleteMessage.do")
			@ResponseBody
			public Map<String, Object> deleteMessage(int messageId){
				Map<String, Object> map = new HashMap<>();
				int tem = messageServiceImpl.deleteMessage(messageId);
				if(tem > 0){
					map.put("result", true);
				}else{
					map.put("result", false);
				}
				return map;
			}
	

}
